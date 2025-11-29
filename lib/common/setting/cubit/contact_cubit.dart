import 'package:mainland/common/setting/cubit/contact_state.dart';
import 'package:mainland/core/config/api/api_end_point.dart';
import 'package:mainland/core/config/bloc/safe_cubit.dart';
import 'package:mainland/core/config/dependency/dependency_injection.dart';
import 'package:mainland/core/config/network/dio_service.dart';
import 'package:mainland/core/config/network/request_input.dart';
import 'package:mainland/core/config/route/app_router.dart';

class ContactCubit extends SafeCubit<ContactState> {
  ContactCubit() : super(const ContactState());
  final DioService _dioService = getIt();

  void save(String message) async {
    if (message.isEmpty) return;
    if (state.isSening) return;
    emit(state.copyWith(isSening: true));
    final result = await _dioService.request(
      showMessage: true,
      input: RequestInput(
        endpoint: ApiEndPoint.instance.contact_us,
        method: RequestMethod.POST,
        jsonBody: {'message': message},
      ),
      responseBuilder: (data) => data,
    );
    emit(state.copyWith(isSening: false));
    if (result.isSuccess) {
      appRouter.pop();
    }
  }
}
