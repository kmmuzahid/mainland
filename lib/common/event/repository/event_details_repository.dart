import 'package:dio/dio.dart';
import 'package:mainland/common/event/model/event_details_model.dart';
import 'package:mainland/core/config/api/api_end_point.dart';
import 'package:mainland/core/config/dependency/dependency_injection.dart';
import 'package:mainland/core/config/network/dio_service.dart';
import 'package:mainland/core/config/network/request_input.dart';
import 'package:mainland/core/config/network/response_state.dart';

class EventDetailsRepository {
  final DioService _dioService = getIt();
  Future<ResponseState<EventDetails?>> getDetails({required String id}) async {
    return _dioService.request<EventDetails>(
      input: RequestInput(
        endpoint: ApiEndPoint.instance.eventDetails(id: id),
        method: RequestMethod.GET,
      ),
      responseBuilder: (data) => EventDetails.fromJson(data),
    );
  }
}
