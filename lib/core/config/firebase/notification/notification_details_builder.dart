import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mainland/core/config/firebase/notification/notification_config.dart';
import 'package:mainland/core/config/firebase/notification/notification_enums.dart';

/// Helper class to build notification details
class NotificationDetailsBuilder {
  /// Build notification details from config
  static NotificationDetails build(NotificationConfig config) {
    return NotificationDetails(
      android: _buildAndroidDetails(config),
      iOS: _buildIOSDetails(config),
      macOS: _buildIOSDetails(config),
    );
  }

  /// Build Android notification details
  static AndroidNotificationDetails _buildAndroidDetails(NotificationConfig config) {
    final channelId = config.channelId ?? _getDefaultChannelId(config);
    final channelName = config.channelName ?? _getDefaultChannelName(config);
    final channelDescription = config.channelDescription ?? _getDefaultChannelDescription(config);

    // Determine playSound and enableVibration based on alertType
    final playSound =
        config.alertType == NotificationAlertType.soundOnly ||
        config.alertType == NotificationAlertType.vibrationAndSound;
    final enableVibration =
        config.alertType == NotificationAlertType.vibrationOnly ||
        config.alertType == NotificationAlertType.vibrationAndSound;

    // Get sound if applicable
    AndroidNotificationSound? sound;
    if (playSound && config.soundFileName != null) {
      sound = RawResourceAndroidNotificationSound(
        config.soundFileName!.replaceAll('.mp3', '').replaceAll('.wav', ''),
      );
    }

    // Build style information
    StyleInformation? styleInformation;
    final imagePath = config.extractedImagePath;

    if (config.displayType == NotificationDisplayType.message) {
      // Messaging style
      final messagingStyle = MessagingStyleInformation(
        Person(name: config.title ?? 'User'),
        conversationTitle: config.title,
        messages: [
          Message(config.body ?? '', DateTime.now(), Person(name: config.title ?? 'User')),
        ],
      );
      styleInformation = messagingStyle;
    } else if (imagePath != null && Platform.isAndroid) {
      // Big picture style
      styleInformation = BigPictureStyleInformation(
        FilePathAndroidBitmap(imagePath),
        contentTitle: config.title,
        summaryText: config.body,
      );
    }

    return AndroidNotificationDetails(
      channelId,
      channelName,
      channelDescription: channelDescription,
      importance: Importance.high,
      priority: Priority.high,
      playSound: playSound, // CRITICAL: Explicitly set to false for mute
      sound: sound,
      enableVibration: enableVibration, // CRITICAL: Explicitly set to false for mute/soundOnly
      styleInformation: styleInformation, 
    );
  }

  /// Build iOS/macOS notification details
  static DarwinNotificationDetails _buildIOSDetails(NotificationConfig config) {
    // Determine if sound should be played
    final presentSound =
        config.alertType == NotificationAlertType.soundOnly ||
        config.alertType == NotificationAlertType.vibrationAndSound;

    String? sound;
    if (presentSound && config.soundFileName != null) {
      sound = config.soundFileName;
    }

    return DarwinNotificationDetails(
      presentAlert: true, // Always show the notification
      presentBadge: true,
      presentSound: presentSound, // CRITICAL: Controls sound on iOS
      sound: sound,
      
      // Note: iOS doesn't have separate vibration control in local notifications
      // Vibration is tied to sound settings and user's device settings
    );
  }

  /// Get default channel ID based on config
  static String _getDefaultChannelId(NotificationConfig config) {
    if (config.displayType == NotificationDisplayType.message) {
      return 'message_channel';
    }
    return 'default_channel';
  }

  /// Get default channel name based on config
  static String _getDefaultChannelName(NotificationConfig config) {
    if (config.displayType == NotificationDisplayType.message) {
      return 'Messages';
    }
    return 'Notifications';
  }

  /// Get default channel description based on config
  static String _getDefaultChannelDescription(NotificationConfig config) {
    if (config.displayType == NotificationDisplayType.message) {
      return 'Message notifications';
    }
    return 'General notifications';
  }
}
