import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:mainland/core/config/firebase/firebase_setup.dart';
import 'package:mainland/core/config/firebase/notification/notification_config.dart';
import 'package:mainland/core/config/firebase/notification/notification_enums.dart';
import 'package:mainland/core/config/firebase/notification/notification_service.dart';
 

/// Background message handler (must be top-level function)
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
 

  final isSoundOn = message.data['isSoundNotificationEnabled'] == 'true';
  final isVibrateOn = message.data['isVibrationNotificationEnabled'] == 'true';

  NotificationAlertType alertType = NotificationAlertType.soundOnly;
  if (isSoundOn == true && isVibrateOn == true) {
    alertType = NotificationAlertType.vibrationAndSound;
  } else if (isSoundOn == true && isVibrateOn == false) {
    alertType = NotificationAlertType.soundOnly;
  } else if (isSoundOn == false && isVibrateOn == true) {
    alertType = NotificationAlertType.vibrationOnly;
  } else {
    alertType = NotificationAlertType.mute;
  }
 

  await NotificationService.instance.show(
    NotificationConfig(
      channelId: 'notificaion_channel_id_${alertType.name}',
      title: message.data['title'],
      body: message.data['body'],
      payload: message.data['payload'] ?? message.messageId,
      alertType: alertType,
    ),
  );
}

/// Singleton service for managing Firebase Cloud Messaging
class FirebaseConfig {
  // Private constructor
  FirebaseConfig._();

  // Singleton instance
  static final FirebaseConfig _instance = FirebaseConfig._();

  // Getter for singleton instance
  static FirebaseConfig get instance => _instance;

  // Firebase Messaging instance
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  bool _isInitialized = false;

  /// Initialize Firebase Messaging
  Future<void> setup() async {
    if (_isInitialized) return;
    _isInitialized = true;
    await NotificationService.instance.initialize(FirebaseSetup.onNotificationTapped);

    // Configure foreground notification presentation for iOS
    // This prevents Firebase from automatically showing notifications in foreground
    await _firebaseMessaging.setForegroundNotificationPresentationOptions();

    // Get APNs token for iOS (internally used by Firebase)
    if (Platform.isIOS) {
      var apnsToken = await _firebaseMessaging.getAPNSToken();
      debugPrint('APNs Token: $apnsToken');

      // If APNs token is null, wait for it before getting FCM token
      if (apnsToken == null) {
        debugPrint('Waiting for APNs token...');
        // Set up a listener for APNs token
        var retryCount = 0;
        while (apnsToken == null && retryCount < 10) {
          await Future.delayed(const Duration(milliseconds: 500));
          apnsToken = await _firebaseMessaging.getAPNSToken();
          retryCount++;
        }

        if (apnsToken != null) {
          debugPrint('APNs Token received: $apnsToken');
        } else {
          debugPrint('Warning: APNs token not available after retries');
        }
      }
    }

    // Get FCM token
    var fcmToken = await _firebaseMessaging.getToken();
    debugPrint('FCM Token: $fcmToken');

    // Call the token callback with initial token
    if (fcmToken != null) {
      FirebaseSetup.onTokenReceived(fcmToken);
    }

    // Listen to token refresh
    _firebaseMessaging.onTokenRefresh.listen((newToken) {
      fcmToken = newToken;
      debugPrint('FCM Token refreshed: $newToken');
      FirebaseSetup.onTokenReceived(newToken);
    });

    // // Handle foreground messages
    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   debugPrint('Got a message whilst in the foreground!');
    //   debugPrint('Message data: ${message.data}');

    //   // Show notification for both notification and data-only messages
    //   // We manually control this now since we disabled automatic presentation
    //   if (message.notification != null || message.data.isNotEmpty) {
    //     debugPrint('Showing notification from FCM message');
    //     NotificationService.instance.show(
    //       NotificationConfig(
    //         alertType: NotificationAlertType.mute, // Silent notification
    //         title: message.data['title'],
    //         body: message.data['body'],
    //         payload: message.data['payload'] ?? message.messageId,
    //       ),
    //     );
    //   }

    //   FirebaseSetup.onMessageReceived(message);
    // });

    // Handle when user taps notification while app is in background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint('Message clicked!');
      debugPrint('Message data: ${message.data}');
      FirebaseSetup.onMessageOpenedApp(message);
    });

    // Check if app was opened from a terminated state via notification
    final initialMessage = await _firebaseMessaging.getInitialMessage();
    if (initialMessage != null) {
      debugPrint('App opened from terminated state via notification');
      FirebaseSetup.onMessageOpenedApp.call(initialMessage);
    }

    // Set background message handler
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }
}
