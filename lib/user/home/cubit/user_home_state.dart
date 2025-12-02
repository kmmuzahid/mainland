// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import 'package:mainland/common/tickets/model/ticket_model.dart';

class UserHomeState {
  bool isPopularLoading;
  bool isNewlyAddedLoading;
  List<TicketModel> popularEvents;
  List<TicketModel> newlyAddedEvents;

  UserHomeState({
    this.isPopularLoading = false,
    this.isNewlyAddedLoading = false,
    this.popularEvents = const [],
    this.newlyAddedEvents = const [],
  });

  UserHomeState copyWith({
    bool? isPopularLoading,
    bool? isNewlyAddedLoading,
    List<TicketModel>? popularEvents,
    List<TicketModel>? newlyAddedEvents,
  }) {
    return UserHomeState(
      isPopularLoading: isPopularLoading ?? this.isPopularLoading,
      isNewlyAddedLoading: isNewlyAddedLoading ?? this.isNewlyAddedLoading,
      popularEvents: popularEvents ?? this.popularEvents,
      newlyAddedEvents: newlyAddedEvents ?? this.newlyAddedEvents,
    );
  }

  @override
  bool operator ==(covariant UserHomeState other) {
    if (identical(this, other)) return true;

    return other.isPopularLoading == isPopularLoading &&
        other.isNewlyAddedLoading == isNewlyAddedLoading &&
        listEquals(other.popularEvents, popularEvents) &&
        listEquals(other.newlyAddedEvents, newlyAddedEvents);
  }

  @override
  int get hashCode {
    return isPopularLoading.hashCode ^
        isNewlyAddedLoading.hashCode ^
        popularEvents.hashCode ^
        newlyAddedEvents.hashCode;
  }
}
