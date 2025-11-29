import 'package:mainland/common/setting/cubit/faq_state.dart';
import 'package:mainland/common/setting/model/faq_model.dart';
import 'package:mainland/core/config/api/api_end_point.dart';
import 'package:mainland/core/config/bloc/safe_cubit.dart';
import 'package:mainland/core/config/dependency/dependency_injection.dart';
import 'package:mainland/core/config/network/dio_service.dart';
import 'package:mainland/core/config/network/request_input.dart';

class FaqCubit extends SafeCubit<FaqState> {
  FaqCubit() : super(const FaqState());
  final DioService _dioService = getIt();

  void fetch({bool isRefresh = false}) async {
    emit(state.copyWith(isLoading: true, page: isRefresh ? 1 : null));

    final result = await _dioService.request<List<FaqModel>>(
      input: RequestInput(endpoint: ApiEndPoint.instance.faq, method: RequestMethod.GET),
      responseBuilder: (data) => (data as List<dynamic>).map((e) => FaqModel.fromJson(e)).toList(),
    );
    emit(
      state.copyWith(
        isLoading: false,
        page: state.page + 1,
        faq: isRefresh ? result.data : [...state.faq, ...result.data ?? []],
      ),
    );
    return;
  }
}
