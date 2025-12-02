import 'package:mainland/common/tickets/model/ticket_model.dart';
import 'package:mainland/core/config/api/api_end_point.dart';
import 'package:mainland/core/config/bloc/safe_cubit.dart';
import 'package:mainland/core/config/dependency/dependency_injection.dart';
import 'package:mainland/core/config/network/dio_service.dart';
import 'package:mainland/core/config/network/request_input.dart';

import 'package:mainland/user/home/cubit/user_home_state.dart';

class UserHomeCubit extends SafeCubit<UserHomeState> {
  UserHomeCubit() : super(UserHomeState());
  final DioService _dioService = getIt();

  Future<void> fetch({bool isRefresh = false}) async {
    if (isRefresh) {
      emit(UserHomeState());
    }
    _fetchNewlyAdded();
    _fetchPopular();
  }

  Future<void> _fetchNewlyAdded() async {
    emit(state.copyWith(isNewlyAddedLoading: true));
    final result = await _dioService.request<List<TicketModel>>(
      input: RequestInput(
        endpoint: ApiEndPoint.instance.userNewlyAdded,
        method: RequestMethod.GET,
        queryParams: {'limit': 8, 'page': 1},
      ),
      responseBuilder: (data) =>
          (data as List<dynamic>).map((e) => TicketModel.fromJson(e)).toList(),
    );
    emit(state.copyWith(isNewlyAddedLoading: false, newlyAddedEvents: result.data ?? []));
  }

  Future<void> _fetchPopular() async {
    emit(state.copyWith(isPopularLoading: true));
    final result = await _dioService.request<List<TicketModel>>(
      input: RequestInput(
        endpoint: ApiEndPoint.instance.userPopularEvent,
        method: RequestMethod.GET,
        queryParams: {'limit': 8, 'page': 1},
      ),
      responseBuilder: (data) =>
          (data as List<dynamic>).map((e) => TicketModel.fromJson(e)).toList(),
    );
    emit(state.copyWith(isPopularLoading: false, popularEvents: result.data ?? []));
  }
}
