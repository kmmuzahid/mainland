import 'package:mainland/common/tickets/model/ticket_model.dart';
import 'package:mainland/common/tickets/repository/ticket_repository.dart';
import 'package:mainland/core/config/bloc/safe_cubit.dart';
import 'package:mainland/core/config/dependency/dependency_injection.dart';

import 'org_home_state.dart';

class OrgHomeCubit extends SafeCubit<OrgHomeState> {
  OrgHomeCubit() : super(OrgHomeState());

  final TicketRepository _repository = getIt();

  void fetch({bool isRefresh = false}) async {
    emit(state.copyWith(isLoading: true, page: isRefresh ? 1 : null));

    final result = await _repository.getOranizerEvents(filter: TicketFilter.Live, page: state.page);
    if (result.isSuccess)
      emit(
        state.copyWith(
          isLoading: false,
          page: state.page + 1,
          events: isRefresh ? result.data : [...state.events, ...result.data ?? []],
        ),
      );
    else
      emit(state.copyWith(isLoading: false));
  }
}
