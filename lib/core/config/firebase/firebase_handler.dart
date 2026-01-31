/*
 * @Author: Km Muzahid
 * @Date: 2026-01-29 12:05:46
 * @Email: km.muzahid@gmail.com
 */
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mainland/common/notifications/cubit/notification_cubit.dart';
import 'package:mainland/core/config/dependency/dependency_injection.dart';
import 'package:mainland/core/config/firebase/config/firebase_config.dart';
import 'package:mainland/core/utils/log/app_log.dart';
import 'package:mainland/firebase_options.dart';

class FirebaseHandler {
  static NotificationCubit notificationCubit = getIt();

  // Firebase Messaging instance
  static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  static Future<void> initialize() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    FirebaseConfig.instance.setup();
  }

  /// Subscribe to topic
  static Future<void> subscribeToTopic(String topic) async {
    await _firebaseMessaging.subscribeToTopic(topic);
    AppLogger.debug('Subscribed to topic: $topic', tag: 'FirebaseHandler');
  }

  /// Unsubscribe from topic
  static Future<void> unsubscribeFromTopic(String topic) async {
    await _firebaseMessaging.unsubscribeFromTopic(topic);
    AppLogger.debug('Unsubscribed from topic: $topic', tag: 'FirebaseHandler');
  }

  /// Delete FCM token
  static Future<void> deleteToken() async {
    await _firebaseMessaging.deleteToken();
    AppLogger.debug('FCM token deleted', tag: 'FirebaseHandler');
  }

  /// Get new FCM token
  static Future<String?> getToken() async {
    return await _firebaseMessaging.getToken();
  }

  /// Get APNs token (iOS only)
  static Future<String?> getAPNSToken() async {
    if (Platform.isIOS) {
      return await _firebaseMessaging.getAPNSToken();
    }
    return null;
  }

  /// Set auto initialization
  static Future<void> setAutoInitEnabled(bool enabled) async {
    await _firebaseMessaging.setAutoInitEnabled(enabled);
  }

  /// Check if app is in foreground
  static Future<bool> isAppInForeground() async {
    final settings = await _firebaseMessaging.getNotificationSettings();
    return settings.authorizationStatus == AuthorizationStatus.authorized;
  }

  /// Set foreground notification presentation options (iOS)
  static Future<void> setForegroundNotificationPresentationOptions({
    bool alert = true,
    bool badge = true,
    bool sound = true,
  }) async {
    if (Platform.isIOS || Platform.isMacOS) {
      await _firebaseMessaging.setForegroundNotificationPresentationOptions(
        alert: alert,
        badge: badge,
        sound: sound,
      );
    }
  }
}
