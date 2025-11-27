// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import 'package:mainland/common/tickets/model/ticket_model.dart';

class OrgHomeState {
  bool isLoading;
  int page;
  List<TicketModel> events;
  OrgHomeState({this.isLoading = false, this.page = 1, this.events = const []});

  OrgHomeState copyWith({bool? isLoading, int? page, List<TicketModel>? events}) {
    return OrgHomeState(
      isLoading: isLoading ?? this.isLoading,
      page: page ?? this.page,
      events: events ?? this.events,
    );
  }

  @override
  bool operator ==(covariant OrgHomeState other) {
    if (identical(this, other)) return true;

    return other.isLoading == isLoading && other.page == page && listEquals(other.events, events);
  }

  @override
  int get hashCode => isLoading.hashCode ^ page.hashCode ^ events.hashCode;
}
