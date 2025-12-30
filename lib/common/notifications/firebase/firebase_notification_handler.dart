import 'dart:io';
import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mainland/core/utils/log/app_log.dart';

import '../cubit/notification_cubit.dart';

final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

const String _channelId = 'high_importance_channel';
const String _channelName = 'High Importance Notifications';
const String _channelDescription = 'Used for important notifications';

class FirebaseNotificationHandler {
  FirebaseNotificationHandler._();
  static final FirebaseNotificationHandler instance =
      FirebaseNotificationHandler._();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  NotificationCubit? notificationCubit;

  void setNotificationCubit(NotificationCubit cubit) {
    notificationCubit = cubit;
  }

  Future<void> init() async {
    await _createAndroidNotificationChannel();

    FirebaseMessaging.onMessage.listen(_onForegroundMessage);

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenedApp);

    if (defaultTargetPlatform == TargetPlatform.iOS) {
      final String? apnsToken = await _firebaseMessaging.getAPNSToken();

      if (apnsToken == null) {
        AppLogger.debug(
          'APNS token not yet available, skipping FCM token fetch',
          tag: 'FirebaseNotificationHandler',
        );
        return;
      }
    }

    final String? fcmToken = await _firebaseMessaging.getToken();
    AppLogger.debug('FCM Token: $fcmToken', tag: 'FirebaseNotificationHandler');
  }

  Future<void> _onForegroundMessage(RemoteMessage message) async {
    AppLogger.debug(
      'Foreground message received: ${message.messageId}',
      tag: 'FirebaseNotificationHandler',
    );

    await showLocalNotification(message.notification);
  }

  void _onMessageOpenedApp(RemoteMessage message) {
    AppLogger.debug(
      'Notification opened: ${message.messageId}',
      tag: 'FirebaseNotificationHandler',
    );

    // Handle deep links / navigation here
  }

  /// 🔔 Notification tap handler
  void _onNotificationTapped(NotificationResponse response) {
    AppLogger.debug(
      'Notification tapped with payload: ${response.payload}',
      tag: 'FirebaseNotificationHandler',
    );
  }

  /// 🧠 Background message handler (TOP-LEVEL SAFE)
  static Future<void> _firebaseMessagingBackgroundHandler(
    RemoteMessage message,
  ) async {
    AppLogger.debug(
      'Handling background message: ${message.messageId}',
      tag: 'FirebaseNotificationHandler',
    );

    await FirebaseNotificationHandler.instance.showLocalNotification(
      message.notification,
    );
  }

  /// 🔔 Show local notification
  Future<void> showLocalNotification(RemoteNotification? notification) async {
    if (notification == null) return;

    final AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
          _channelId,
          _channelName,
          channelDescription: _channelDescription,
          importance: Importance.high,
          priority: Priority.high,
        );

    const DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    final NotificationDetails platformDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _flutterLocalNotificationsPlugin.show(
      Random().nextInt(100000), // unique ID
      notification.title,
      notification.body,
      platformDetails,
      payload: 'notification_payload',
    );
  }

  /// 📢 Create Android notification channel
  Future<void> _createAndroidNotificationChannel() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      _channelId,
      _channelName,
      description: _channelDescription,
      importance: Importance.high,
    );

    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);
  }
}
