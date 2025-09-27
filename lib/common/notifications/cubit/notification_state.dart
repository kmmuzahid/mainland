// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


class NotificationState extends Equatable {
  const NotificationState({this.notifications, this.pageNo = 0, this.isLoading = false, this.unread = 0});

  final List<RemoteMessage>? notifications;
  final int pageNo;
  final bool isLoading;
  final int unread;

  NotificationState copyWith({List<RemoteMessage>? notifications, int? pageNo, bool? isLoading, int? unread}) {
    return NotificationState(
      notifications: notifications ?? this.notifications,
      pageNo: pageNo ?? this.pageNo,
      isLoading: isLoading ?? this.isLoading,
      unread: unread ?? this.unread
    );
  }

  @override
  List<Object> get props => [notifications ?? '', pageNo, isLoading, unread];
}
