// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import 'package:mainland/organizer/ticketMange/model/org_ticket_summery_model.dart';

class OrgLiveTicketState {
  const OrgLiveTicketState({this.isLoading = false, this.data = const []});

  final bool isLoading;
  final List<OrgTicketSummeryModel> data;

  OrgLiveTicketState copyWith({bool? isLoading, List<OrgTicketSummeryModel>? data}) {
    return OrgLiveTicketState(isLoading: isLoading ?? this.isLoading, data: data ?? this.data);
  }

  @override
  bool operator ==(covariant OrgLiveTicketState other) {
    if (identical(this, other)) return true;

    return other.isLoading == isLoading && listEquals(other.data, data);
  }

  @override
  int get hashCode => isLoading.hashCode ^ data.hashCode;
}
