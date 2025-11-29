import 'package:mainland/core/config/api/api_end_point.dart';
import 'package:mainland/core/config/bloc/safe_cubit.dart';
import 'package:mainland/core/config/dependency/dependency_injection.dart';
import 'package:mainland/core/config/network/dio_service.dart';
import 'package:mainland/core/config/network/request_input.dart';
import 'package:mainland/organizer/ticketMange/cubit/org_live_ticket_state.dart';
import 'package:mainland/organizer/ticketMange/model/org_ticket_summery_model.dart';

class OrgLiveTicketCubit extends SafeCubit<OrgLiveTicketState> {
  OrgLiveTicketCubit() : super(const OrgLiveTicketState());
  final DioService _dioService = getIt();

  Future<void> fetch({required String id}) async {
    if (state.isLoading) return;
    emit(state.copyWith(isLoading: true));
    final result = await _dioService.request<List<OrgTicketSummeryModel>>(
      input: RequestInput(
        endpoint: ApiEndPoint.instance.orgLiveEventDetails(id: id),
        method: RequestMethod.GET,
      ),
      responseBuilder: (data) =>
          (data as List<dynamic>).map((e) => OrgTicketSummeryModel.fromJson(e)).toList(),
    );
    emit(state.copyWith(isLoading: false, data: result.data));
  }
}
