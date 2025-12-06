// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../../../common/event/model/event_details_model.dart';

class TicketSaveState {
  TicketSaveState({this.isLoding = false, this.eventDetailsModel, this.imageByte});

  final bool isLoding;
  final EventDetailsModel? eventDetailsModel;
  final ByteData? imageByte;

  TicketSaveState copyWith({
    bool? isLoding,
    EventDetailsModel? eventDetailsModel,
    ByteData? imageByte,
  }) {
    return TicketSaveState(
      isLoding: isLoding ?? this.isLoding,
      eventDetailsModel: eventDetailsModel ?? this.eventDetailsModel,
      imageByte: imageByte ?? this.imageByte,
    );
  }

  @override
  bool operator ==(covariant TicketSaveState other) {
    if (identical(this, other)) return true;

    return other.isLoding == isLoding &&
        other.eventDetailsModel == eventDetailsModel &&
        other.imageByte == imageByte;
  }

  @override
  int get hashCode => isLoding.hashCode ^ eventDetailsModel.hashCode ^ imageByte.hashCode;
}
