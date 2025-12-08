import 'dart:typed_data';
 
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 
import 'package:mainland/common/event/repository/event_details_repository.dart';
import 'package:mainland/core/config/bloc/safe_cubit.dart';
import 'package:mainland/core/config/dependency/dependency_injection.dart';
import 'package:mainland/core/config/network/dio_service.dart'; 
import 'package:mainland/core/utils/common_share.dart';
import 'package:mainland/gen/assets.gen.dart';
import 'package:mainland/user/ticketManage/cubit/ticket_save_state.dart';
import 'package:mainland/user/ticketManage/model/qr_code_model.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart'; 

class TicketSaveCubit extends SafeCubit<TicketSaveState> {
  TicketSaveCubit() : super(TicketSaveState());

  final DioService dioService = getIt();
  final EventDetailsRepository repository = getIt();

  Future<void> fetch({required String id, required String userId}) async {
    emit(state.copyWith(isLoding: true));
    final result = await repository.getDetails(id: id);
    if (result.isSuccess && result.data != null) {
      final qrCode = QrCodeModel.fromJson(
        QrCodeModel(
          userId: userId,
          eventId: result.data?.id ?? '',
          eventCode: result.data?.eventCode ?? '',
        ).toJson(),
      );
      final qrImage = QrImage(
        QrCode.fromData(data: qrCode.toJson(), errorCorrectLevel: QrErrorCorrectLevel.H),
      );

      emit(
        state.copyWith(
          eventDetailsModel: result.data,
          isLoding: false,
          imageByte: await _getImageByte(qrImage),
        ),
      );
    } else {
      emit(state.copyWith(isLoding: false));
    }
  }

  bool isSharing = false;
  Future<void> shareNow() async {
    if (state.imageByte == null || isSharing) return;
    isSharing = true;
    isSharing = false;
    CommonShare.instance.shareByteContent(
      title: state.eventDetailsModel?.eventName ?? '',
      imageUrl: state.imageByte!,
      deepLinkUrl: 'Scan QR Code with Mainland Scanner',
    );
  }

  Future<ByteData?>? _getImageByte(QrImage qrImage) async { 
    return await qrImage.toImageAsBytes(
      size: 512,
      decoration: PrettyQrDecoration(
        // shape: const PrettyQrSmoothSymbol(),
        background: const Color(0xFFFFFFFF), // Pure white background (important for scanning)
        image: PrettyQrDecorationImage(image: AssetImage(Assets.icon.iconCircle.path)),
      ),
    );
  }
 
}
