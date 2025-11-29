import 'package:mainland/common/event/cubit/all_event_state.dart';
import 'package:mainland/common/tickets/model/ticket_model.dart';
import 'package:mainland/common/tickets/repository/ticket_repository.dart';
import 'package:mainland/core/config/bloc/safe_cubit.dart';
import 'package:mainland/core/config/dependency/dependency_injection.dart';

class AllEventCubit extends SafeCubit<AllEventState> {
  AllEventCubit() : super(const AllEventState());
  final TicketRepository _repository = getIt();

  void fetch({bool isRefresh = false}) async {
    if (state.isLoading) return;
    emit(state.copyWith(isLoading: true, page: isRefresh ? 1 : null));
    final result = await _repository.getOranizerEvents(filter: TicketFilter.Live, page: state.page);
    emit(
      state.copyWith(
        isLoading: false,
        page: state.page + 1,
        events: isRefresh ? result.data : [...state.events, ...result.data ?? []],
      ),
    );
    return;
  }
}
