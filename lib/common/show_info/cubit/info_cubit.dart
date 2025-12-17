import 'package:mainland/common/show_info/cubit/info_state.dart';
import 'package:mainland/core/config/api/api_end_point.dart';
import 'package:mainland/core/config/bloc/safe_cubit.dart';
import 'package:mainland/core/config/dependency/dependency_injection.dart';
import 'package:mainland/core/config/network/dio_service.dart';
import 'package:mainland/core/config/network/request_input.dart';

class InfoCubit extends SafeCubit<InfoState> {
  InfoCubit() : super(InfoState());

  final DioService _dioService = getIt();

  Future<void> fetch(InfoType infoType) async {
    String path = '';
    switch (infoType) {
      case InfoType.about_us:
        path = ApiEndPoint.instance.about_us;
        break;
      case InfoType.terms:
        path = ApiEndPoint.instance.termsAndConditions;
        break;
      case InfoType.privacy:
        path = ApiEndPoint.instance.privacyPolicy;
        break;
    }
    if (path.isEmpty) return;
    emit(state.copyWith(isLoading: true));
    final result = await _dioService.request<dynamic>(
      input: RequestInput(endpoint: path, method: RequestMethod.GET),
      responseBuilder: (data) => data,
    );
    if (result.isSuccess) {
      if (infoType != InfoType.terms)
        emit(
          state.copyWith(
            isLoading: false,
            content: result.data['content'].toString(),
          ),
        );
      else
        emit(
          state.copyWith(
            isLoading: false,
            content: result.data['termsAdnCondition'].toString(),
          ),
        );
    } else {
      emit(state.copyWith(isLoading: false));
    }
  }
}
