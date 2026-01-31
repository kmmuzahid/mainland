/*
 * @Author: Km Muzahid
 * @Date: 2026-01-28 14:37:38
 * @Email: km.muzahid@gmail.com
 */
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mainland/core/config/api/api_end_point.dart';
import 'package:mainland/core/config/dependency/dependency_injection.dart';
import 'package:mainland/core/config/network/dio_service.dart';
import 'package:mainland/core/config/network/request_input.dart';

///this methods are automatically called by the FirebaseConfig
class FirebaseSetup {
  static void onMessageOpenedApp(RemoteMessage message) {}
  static void onNotificationTapped(NotificationResponse respnce) {}

  static void onMessageReceived(RemoteMessage message) async {}

  static void onTokenReceived(String fcm) async {
    getIt<DioService>().request(
      input: RequestInput(
        endpoint: ApiEndPoint.instance.profile,
        method: RequestMethod.PATCH,
        jsonBody: {'fcmToken': fcm},
      ),
      responseBuilder: (data) => data,
    );
  }
}
