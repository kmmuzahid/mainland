import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mainland/common/notifications/repository/notification_repository.dart';
import 'package:mainland/core/config/bloc/safe_cubit.dart';
import 'package:mainland/core/config/dependency/dependency_injection.dart';

import 'notification_state.dart';

class NotificationCubit extends SafeCubit<NotificationState> {
  NotificationCubit() : super(const NotificationState());
  final NotificationRepository _repository = getIt();

  int? _getPageNo(List responce) => responce.isNotEmpty ? state.pageNo + 1 : null;

  void cleanList() async {
    emit(state.copyWith(notifications: [], unread: 0));
  }

  void addNotification({required RemoteMessage notification}) {
    final List<RemoteMessage> updatedList = [notification, ...state.notifications ?? []];
    emit(state.copyWith(notifications: updatedList, unread: state.unread + 1));
  }

  Future<void> fetch() async {
    if (state.isLoading) return;
    emit(state.copyWith(isLoading: true, notifications: [], pageNo: 0));
    final responce = await _repository.fetch(page: 0);
    emit(state.copyWith(notifications: responce, isLoading: false, pageNo: _getPageNo(responce)));
  }

  Future<void> loadMore() async {
    if (state.isLoading) return;
    emit(state.copyWith(isLoading: true));
    final responce = await _repository.fetch(page: state.pageNo);
    emit(
      state.copyWith(
        isLoading: false,
        notifications: [...state.notifications ?? [], ...responce],
        pageNo: _getPageNo(responce),
      ),
    );
  }
}
