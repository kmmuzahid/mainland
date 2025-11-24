import 'package:mainland/common/auth/model/user_login_info_model.dart';
import 'package:mainland/common/tickets/model/ticket_model.dart';
import 'package:mainland/core/config/api/api_end_point.dart';
import 'package:mainland/core/config/dependency/dependency_injection.dart';
import 'package:mainland/core/config/network/dio_service.dart';
import 'package:mainland/core/config/network/request_input.dart';
import 'package:mainland/core/config/network/response_state.dart';
import 'package:mainland/core/utils/app_utils.dart';
import 'package:mainland/gen/assets.gen.dart';

class TicketRepository {
  final DioService _dioService = getIt();

  Future<ResponseState<List<TicketModel>?>> getOranizerEvents({
    required TicketFilter filter,
    required int page,
  }) async {
    final role = Utils.getRole();

    String path = '';
    String eventStatus = '';
    bool isDraft = false;

    if (role == Role.ORGANIZER) {
      path = ApiEndPoint.instance.orgEvent;
      if (filter == TicketFilter.Live) {
        eventStatus = 'Live';
      } else if (filter == TicketFilter.UnderReview) {
        eventStatus = 'UnderReview';
      } else if (filter == TicketFilter.Draft) {
        isDraft = true;
      } else if (filter == TicketFilter.Closed) {
        path = ApiEndPoint.instance.orgEventClosed;
      }
    }

    final result = await _dioService.request<List<TicketModel>>(
      input: RequestInput(
        endpoint: path,
        queryParams: {
          'limit': 20,
          'page': page,
          if (eventStatus.isNotEmpty) 'EventStatus': eventStatus,
          if (isDraft) 'isDraft': isDraft,
        },
        method: RequestMethod.GET,
      ),
      responseBuilder: (data) => (data as List).map((e) => TicketModel.fromJson(e)).toList(),
    );
    return result;
  }
}
