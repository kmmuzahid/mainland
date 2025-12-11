import 'package:mainland/common/tickets/model/ticket_model.dart';
import 'package:mainland/core/config/api/api_end_point.dart';
import 'package:mainland/core/config/bloc/safe_cubit.dart';
import 'package:mainland/core/config/dependency/dependency_injection.dart';
import 'package:mainland/core/config/network/dio_service.dart';
import 'package:mainland/core/config/network/request_input.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/main.dart';
import 'package:mainland/user/ticketManage/model/ticket_details_model.dart';
import 'package:mainland/user/ticketManage/model/ticket_history_details_model.dart';

import 'user_ticket_manage_state.dart';

class UserTicketManageCubit extends SafeCubit<UserTicketManageState> {
  UserTicketManageCubit() : super(UserTicketManageState());
  final DioService _dioService = getIt();

  Future<void> fetch({required String eventId, required TicketFilter filter}) async {
    if (state.isLoading) return;
    String path = '';
    if (filter == TicketFilter.Live) {
      path = ApiEndPoint.instance.userLiveDetails(id: eventId);
    } else if (filter == TicketFilter.Available) {
      path = ApiEndPoint.instance.userAvailableDetails(id: eventId);
    } else if (filter == TicketFilter.Sold) {
      path = ApiEndPoint.instance.ticketHistoryDetails(id: eventId, isExpired: false);
    } else if (filter == TicketFilter.Expired) {
      path = ApiEndPoint.instance.ticketHistoryDetails(id: eventId, isExpired: true);
    }
    emit(state.copyWith(isLoading: true, eventId: eventId));


    final isNotHistory = filter != TicketFilter.Sold && filter != TicketFilter.Expired;

    final response = await _dioService.request( 
      input: RequestInput(endpoint: path, method: RequestMethod.GET),
      responseBuilder: (response) {
        if (isNotHistory) {
          return (response as List).map((e) => TicketDetailsModel.fromMap(e)).toList();
        } else {
          return TicketHistoryDetailsModel.fromJson(response);
        }
      },
    );
    emit(
      state.copyWith(
        isLoading: false,
        ticketDetails: response.data == null
            ? []
            : isNotHistory
            ? response.data as List<TicketDetailsModel>
            : [],
        ticketHistoryDetailsModel: !isNotHistory
            ? response.data == null
                  ? null
                  : response.data as TicketHistoryDetailsModel
            : null,
      ),
    );
  }

  Future<void> sellNow(List<TicketDetailsModel> sellInfo) async {
    //make another list which has   totalPurchaseTicket>0 && totalPurchaseAmount>0

    if (state.isSaving) return;
    emit(state.copyWith(isSaving: true));

    final result = await _dioService.request<dynamic>(
      showMessage: true,
      input: RequestInput(
        endpoint: ApiEndPoint.instance.userOnSellTicket(id: state.eventId),
        method: RequestMethod.GET,
        listBody: sellInfo
            .map(
              (e) => {
                'ticketType': e.ticketType.name,
                'quantity': e.unit,
                'resellAmount': e.sellPrice,
              },
            )
            .toList(),
      ),

      responseBuilder: (data) => data,
    );
    emit(state.copyWith(isSaving: false));
    if (result.isSuccess) {
      appRouter.pop();
    }
  }

  Future<void> withdrewTickets() async {
    if (state.isSaving) return;
    emit(state.copyWith(isSaving: true));

    final result = await _dioService.request<dynamic>(
      showMessage: true,
      input: RequestInput(
        endpoint: ApiEndPoint.instance.withdrawTickets(id: state.eventId),
        method: RequestMethod.POST,
      ),

      responseBuilder: (data) => data,
    );
    emit(state.copyWith(isSaving: false));
    if (result.isSuccess) {
      appRouter.pop();
    }
  }
}
