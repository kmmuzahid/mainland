import 'package:mainland/common/event/cubit/event_details_state.dart';
import 'package:mainland/core/config/bloc/safe_cubit.dart';

class EventDetailsCubit extends SafeCubit<EventDetailsState> {
  EventDetailsCubit() : super(const EventDetailsState());

  void showDetails(bool show) {
    emit(EventDetailsState(showDetails: show));
  }
}
