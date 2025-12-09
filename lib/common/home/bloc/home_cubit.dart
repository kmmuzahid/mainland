import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:mainland/common/auth/model/user_login_info_model.dart';
import 'package:mainland/core/config/bloc/safe_cubit.dart';
import 'package:mainland/core/config/dependency/dependency_injection.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/config/socket/socket_service.dart';
import 'package:mainland/core/config/socket/stream_data_model.dart';
import 'package:mainland/core/utils/app_utils.dart';

import '../repository/home_repository.dart';

part 'home_state.dart';

class HomeCubit extends SafeCubit<HomeState> {
  HomeCubit() : super(const HomeState(currentIndex: 0));
  final HomeRepository homeRepository = getIt();
  late StreamSubscription<StreamDataModel> _subscriptions;

  void changeIndex(int index) => emit(state.copyWith(currentIndex: index));
  void resetNotificationCount() => emit(state.copyWith(unreadNotification: 0));
  void resetMessageCount() => emit(state.copyWith(unreadMessage: 0));

  void init() async {
    fetchCount();
    _subscriptions = SocketService.instance.streamController.stream.listen((data) {
      if (data.streamType == StreamType.notification) {
        print(appRouter.current.name);
        if (appRouter.current.name != 'NotificationRoute')
          emit(state.copyWith(unreadNotification: state.unreadNotification + 1));
      } else if (data.streamType == StreamType.message) {
        final bool isChatOpen = Utils.getRole() == Role.ORGANIZER
            ? state.currentIndex == 3
            : state.currentIndex == 4;
        if (!isChatOpen) emit(state.copyWith(unreadMessage: state.unreadMessage + 1));
      }
    });
  }

  Future<void> fetchCount() async {
    final result = await homeRepository.getUnreadCount();
    if (result.isSuccess) {
      emit(
        state.copyWith(
          unreadNotification: result.data?.notification,
          unreadMessage: result.data?.message,
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _subscriptions.cancel();
    return super.close();
  }
}
