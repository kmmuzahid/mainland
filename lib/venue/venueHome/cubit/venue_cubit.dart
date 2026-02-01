import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:mainland/common/auth/cubit/auth_cubit.dart';
import 'package:mainland/common/event/model/event_details_model.dart';
import 'package:mainland/common/event/repository/event_details_repository.dart';
import 'package:mainland/core/component/other_widgets/permission_handler_helper.dart';
import 'package:mainland/core/config/api/api_end_point.dart';
import 'package:mainland/core/config/bloc/safe_cubit.dart';
import 'package:mainland/core/config/dependency/dependency_injection.dart';
import 'package:mainland/core/config/network/dio_service.dart';
import 'package:mainland/core/config/network/request_input.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/main.dart';
import 'package:mainland/organizer/createTicket/model/create_event_model.dart';
import 'package:mainland/user/ticketManage/model/qr_code_model.dart';
import 'package:mainland/venue/venueHome/cubit/qr_code_utils.dart';
import 'package:mainland/venue/venueHome/widgets/validate_dailogue_widget.dart';
import 'package:permission_handler/permission_handler.dart';

import '../model/venue_history_model.dart';

part 'venue_state.dart';

class VenueCubit extends SafeCubit<VenueState> {
  VenueCubit() : super(const VenueState(eventCode: ''));
  final EventDetailsRepository repository = getIt();
  late AuthCubit authCubit;
  final ImagePicker imagePicker = ImagePicker();
  final DioService _dioService = getIt();
  void init({required String eventCode, required AuthCubit authCubit}) async {
    this.authCubit = authCubit;
    final isSoundOn = authCubit.state.profileModel?.isSoundNotificationEnabled;
    final isVibrateOn = authCubit.state.profileModel?.isVibrationNotificationEnabled;
    emit(
      state.copyWith(eventCode: eventCode, isSoundOn: isSoundOn ?? true, isVibrateOn: isVibrateOn),
    );
  }

  void changeSoundState({required bool isSoundOn}) {
    authCubit.updateProfile(
      profileModel: authCubit.state.profileModel?.copyWith(isSoundNotificationEnabled: isSoundOn),
    );
    emit(state.copyWith(isSoundOn: isSoundOn));
  }

  void changeVibrateState({required bool isVibrateOn}) {
    authCubit.updateProfile(
      profileModel: authCubit.state.profileModel?.copyWith(
        isVibrationNotificationEnabled: isVibrateOn,
      ),
    );
    emit(state.copyWith(isVibrateOn: isVibrateOn));
  }

  void changeIndex(int index) => emit(state.copyWith(currentIndex: index));

  void changeVenueCode({required String eventCode, Function? onSuccess}) async {
    if (state.isHistoryLoading) return;
    final result = await _dioService.request(
      input: RequestInput(
        endpoint: ApiEndPoint.instance.checkEventCode(eventCode),
        method: RequestMethod.GET,
      ),
      responseBuilder: (data) => data,
    );
    if (result.isSuccess) {
      showSnackBar(
        'Only $eventCode scans will be accepted going forward.',
        type: SnackBarType.success,
      );
      emit(state.copyWith(eventCode: eventCode, isEventCodeChecking: false));
      onSuccess?.call();
    } else {
      showSnackBar(result.message ?? '', type: SnackBarType.error);
      emit(state.copyWith(isEventCodeChecking: false));
    }
  }

  Future<void> pickQrCodeFromGallery({required String userId}) async {
    final status = await const PermissionHandlerHelper(permission: Permission.photos).getStatus();
    if (status) {
      emit(VenueState(eventCode: state.eventCode));
      final image = await imagePicker.pickImage(source: ImageSource.gallery);
      emit(state.copyWith(image: image));
      if (image != null) {
        final qr = await QrCodeUtils.instance.decodeQRFromGallery(image.path);
        getDetails(qr: qr, userId: userId);
      }
    }
  }

  Future<void> getDetails({required String? qr, required String userId, Uint8List? image}) async {
    if (image != null) {
      final file = XFile.fromData(image);
      emit(state.copyWith(image: file, openCamera: false));
    }
    if (qr != null && qr.startsWith('{')) {
      emit(state.copyWith(isEventDetailsLoading: true, openCamera: false));
      final model = QrCodeModel.fromJson(qr);
      _getEventDetails(model, userId);
    } else {
      showSnackBar('Sorry!! wrong QR code', type: SnackBarType.warning);
    }
  }

  Future<void> fetchHistory(String code) async {
    if (state.isHistoryLoading) return;
    emit(state.copyWith(isHistoryLoading: true));
    final result = await _dioService.request<VenuHistoryModel>(
      input: RequestInput(
        endpoint: ApiEndPoint.instance.perticipentCount(code),
        method: RequestMethod.GET,
      ),
      responseBuilder: (data) => VenuHistoryModel.fromJson(data),
    );
    if (!result.isSuccess && result.message != null) {
      showSnackBar(result.message ?? '', type: SnackBarType.error);
    }
    emit(state.copyWith(venueHistoryModel: result.data, isHistoryLoading: false));
  }

  Future<void> _getEventDetails(QrCodeModel model, String ownerId) async {
    if (model.eventCode != state.eventCode) {
      showSnackBar('Sorry, this ticket is not valid for this event.', type: SnackBarType.warning);
      emit(state.copyWith(isEventDetailsLoading: false));
      return;
    }
    final result = await repository.getDetails(id: model.eventId);
    if (result.isSuccess) {
      emit(state.copyWith(eventDetailsModel: result.data, isEventDetailsLoading: false));
      checkQr(ownerId: ownerId, eventId: model.eventId);
    } else {
      showSnackBar('Sorry, this ticket is not valid for this event.', type: SnackBarType.warning);
      emit(state.copyWith(isEventDetailsLoading: false));
    }
  }

  Future<void> scanQR() async {
    final status = await const PermissionHandlerHelper(permission: Permission.camera).getStatus();
    if (status) {
      emit(VenueState(openCamera: true, eventCode: state.eventCode));
    }
  }

  Future<void> checkQr({required String ownerId, required String eventId}) async {
    if (state.isQrChecking) return;
    emit(state.copyWith(isQrChecking: true, availableTickets: []));
    final result = await _dioService.request(
      input: RequestInput(
        endpoint: ApiEndPoint.instance.tikcetUse(
          eventId: eventId,
          ownerId: ownerId,
          isUpdate: false,
        ),
        method: RequestMethod.PATCH,
      ),
      responseBuilder: (data) => (data['data'] as List)
          .map((e) => Ticket(type: TicketName.values.byName(e['type']), availableUnits: e['count']))
          .toList(),
    );
    emit(state.copyWith(isQrChecking: false, availableTickets: result.data));
    ValidateDailogue(
      cubit: this,
      onTap: () {
        emit(state.copyWith(isQrChecking: true));
        _dioService.request(
          showMessage: true,
          input: RequestInput(
            endpoint: ApiEndPoint.instance.tikcetUse(
              eventId: eventId,
              ownerId: ownerId,
              isUpdate: true,
            ),
            method: RequestMethod.PATCH,
          ),
          responseBuilder: (data) => data,
        );
        emit(state.copyWith(isQrChecking: false));
        appRouter.pop();
      },
      tickets: result.data,
    );
  }

  
}
