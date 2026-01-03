import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mainland/common/auth/repository/auth_repository.dart';
import 'package:mainland/core/config/dependency/dependency_injection.dart';
import 'package:mainland/core/utils/helpers/debouncer.dart';
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
  AuthRepository authRepository = getIt();
  final Debouncer _debouncer = Debouncer(delay: const Duration(seconds: 1));

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  NotificationCubit? notificationCubit;

  void logout() {
    _firebaseMessaging.deleteToken();
  }

  void updateFCMToken() async {
    // _debouncer.call(() {
    _firebaseMessaging.getToken().then((token) {
      if (token != null) {
        authRepository.updateFcmToken(fcmToken: token);
        AppLogger.debug('FCM Token: $token', tag: 'FirebaseNotificationHandler');
      }
    });
    // });
  }



  void setNotificationCubit(NotificationCubit cubit) {
    notificationCubit = cubit;
  }

  /// ✅ INITIALIZE EVERYTHING PROPERLY
  Future<void> init() async {
    /// 🔔 Request notification permission (Android 13+ & iOS)
    await _firebaseMessaging.requestPermission(
      
    );

    const AndroidInitializationSettings androidInit = AndroidInitializationSettings(
      '@drawable/ic_notification',
    );

    const DarwinInitializationSettings iosInit = DarwinInitializationSettings();

    const InitializationSettings initSettings = InitializationSettings(
      android: androidInit,
      iOS: iosInit,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
    );

    /// 📢 Create channel BEFORE showing notifications
    await _createAndroidNotificationChannel();

    /// 🔄 Firebase listeners
    FirebaseMessaging.onMessage.listen(_onForegroundMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenedApp);
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    updateFCMToken();
    _firebaseMessaging.onTokenRefresh.listen((fcmToken) {
      authRepository.updateFcmToken(fcmToken: fcmToken);
    });
 
  }

  /// 🔔 FOREGROUND MESSAGE
  Future<void> _onForegroundMessage(RemoteMessage message) async {
    AppLogger.debug(
      'Foreground message received: ${message.messageId}',
      tag: 'FirebaseNotificationHandler',
    );

    // await showLocalNotification(message.notification);
  }

  /// 📲 USER TAPS NOTIFICATION
  void _onMessageOpenedApp(RemoteMessage message) {
    AppLogger.debug(
      'Notification opened: ${message.messageId}',
      tag: 'FirebaseNotificationHandler',
    );
  }

  /// 🔔 LOCAL NOTIFICATION TAP
  static void _onNotificationTapped(NotificationResponse response) {
    AppLogger.debug(
      'Notification tapped with payload: ${response.payload}',
      tag: 'FirebaseNotificationHandler',
    );
  }

  /// 🧠 BACKGROUND HANDLER (ISOLATE SAFE)
  @pragma('vm:entry-point')
  static Future<void> _firebaseMessagingBackgroundHandler(
    RemoteMessage message,
  ) async {
    WidgetsFlutterBinding.ensureInitialized();

    final FlutterLocalNotificationsPlugin plugin = FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings androidInit = AndroidInitializationSettings(
      '@drawable/ic_notification',
    );

    await plugin.initialize(const InitializationSettings(android: androidInit));

    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: _channelDescription,
      importance: Importance.high,
      priority: Priority.high,
      icon: '@drawable/ic_notification',
    );

    await plugin.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000,
      message.notification?.title,
      message.notification?.body,
      const NotificationDetails(android: androidDetails),
    );
  }

  /// 🔔 SHOW LOCAL NOTIFICATION (FOREGROUND)
  Future<void> showLocalNotification(RemoteNotification? notification) async {
    if (notification == null) return;

    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
          _channelId,
          _channelName,
          channelDescription: _channelDescription,
          importance: Importance.high,
          priority: Priority.high,
      icon: '@drawable/ic_notification', // ✅ FIXED
        );

    const DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const NotificationDetails platformDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _flutterLocalNotificationsPlugin.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000,
      notification.title,
      notification.body,
      platformDetails,
      payload: 'notification_payload',
    );
  }

  /// 📢 ANDROID NOTIFICATION CHANNEL
  Future<void> _createAndroidNotificationChannel() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      _channelId,
      _channelName,
      description: _channelDescription,
      importance: Importance.high,
    );

    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }
}
