import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mainland/common/event/model/event_details_model.dart';
import 'package:mainland/common/event/repository/event_details_repository.dart';
import 'package:mainland/core/component/other_widgets/permission_handler_helper.dart';
import 'package:mainland/core/config/bloc/safe_cubit.dart';
import 'package:mainland/core/config/dependency/dependency_injection.dart';
import 'package:mainland/main.dart';
import 'package:mainland/user/ticketManage/model/qr_code_model.dart';
import 'package:mainland/venue/venueHome/cubit/qr_code_utils.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
part 'venue_state.dart';

class VenueCubit extends SafeCubit<VenueState> {
  VenueCubit() : super(const VenueState());
  final EventDetailsRepository repository = getIt();
  final MobileScannerController scannerController = MobileScannerController(
    formats: [BarcodeFormat.qrCode],
  );
  final ImagePicker imagePicker = ImagePicker();

  void changeIndex(int index) => emit(state.copyWith(currentIndex: index));

  Future<void> pickQrCodeFromGallery() async {
    final status = await const PermissionHandlerHelper(permission: Permission.photos).getStatus();
    if (status) {
      final image = await imagePicker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        final qr = await QrCodeUtils.instance.decodeQRFromGallery(image.path);
        if (qr != null && qr.startsWith('{')) {
          emit(state.copyWith(isEventDetailsLoading: true));
          final model = QrCodeModel.fromJson(qr);
          final result = await repository.getDetails(id: model.eventId);
          if (result.isSuccess) {
            scannerController.stop();
            emit(
              state.copyWith(
                eventDetailsModel: result.data,
                isEventDetailsLoading: false,
                image: image,
              ),
            );
          } else {
            emit(state.copyWith(isEventDetailsLoading: false));
          }
        } else {
          showSnackBar('Sorry!! wrong QR code', type: SnackBarType.warning);
        }
      }
    }
  }

  Future<void> scanQR() async {
    final status = await const PermissionHandlerHelper(permission: Permission.camera).getStatus();
    if (status) {
      emit(state.copyWith(image: null, eventDetailsModel: null));
      final img = await scannerController.start();
    }
  }

  @override
  Future<void> close() {
    scannerController.dispose();
    return super.close();
  }
}
