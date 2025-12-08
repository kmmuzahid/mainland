// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:mainland/user/ticketManage/model/ticket_history_details_model.dart';

import '../model/ticket_details_model.dart';

class UserTicketManageState {
  UserTicketManageState({
    this.isLoading = false,
    this.isSaving = false,
    this.ticketDetails = const [],
    this.eventId = '',
    this.ticketHistoryDetailsModel
  });

  final bool isLoading;
  final bool isSaving;
  final List<TicketDetailsModel> ticketDetails;
  final TicketHistoryDetailsModel? ticketHistoryDetailsModel;
  final String eventId;

  UserTicketManageState copyWith({
    bool? isLoading,
    String? eventId,
    bool? isSaving,
    List<TicketDetailsModel>? ticketDetails,
    TicketHistoryDetailsModel? ticketHistoryDetailsModel
  }) {
    return UserTicketManageState(
      eventId: eventId ?? this.eventId,
      isLoading: isLoading ?? this.isLoading,
      isSaving: isSaving ?? this.isSaving,
      ticketDetails: ticketDetails ?? this.ticketDetails,
      ticketHistoryDetailsModel: ticketHistoryDetailsModel ?? this.ticketHistoryDetailsModel
    );
  }

  @override
  bool operator ==(covariant UserTicketManageState other) {
    if (identical(this, other)) return true;

    return other.isLoading == isLoading &&
        other.isSaving == isSaving &&
        other.ticketHistoryDetailsModel == ticketHistoryDetailsModel &&
        listEquals(other.ticketDetails, ticketDetails);
  }

  @override
  int get hashCode =>
      isLoading.hashCode ^
      isSaving.hashCode ^
      ticketDetails.hashCode ^
      ticketHistoryDetailsModel.hashCode;
}
