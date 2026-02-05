import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mainland/core/config/firebase/notification/notification_config.dart';
import 'package:mainland/core/config/firebase/notification/notification_enums.dart';
import 'package:mainland/core/config/firebase/notification/notification_service.dart';

/// Helper class to build notification details
class NotificationDetailsBuilder {
  /// Build notification details from config
  static Future<NotificationDetails> build(NotificationConfig config) async {
    return NotificationDetails(
      android: await _buildAndroidDetails(config),
      iOS: _buildIOSDetails(config),
      macOS: _buildIOSDetails(config),
    );
  }

  /// Build Android notification details
  static Future<AndroidNotificationDetails> _buildAndroidDetails(NotificationConfig config) async {
    final playSound =
        config.alertType == NotificationAlertType.soundOnly ||
        config.alertType == NotificationAlertType.vibrationAndSound;

    final enableVibration =
        config.alertType == NotificationAlertType.vibrationOnly ||
        config.alertType == NotificationAlertType.vibrationAndSound;
 

    final channel = await _createNotificationChannel(
      id: config.channelId ?? _getDefaultChannelId(config),
      name: config.channelName ?? _getDefaultChannelName(config),
      description: config.channelDescription ?? _getDefaultChannelDescription(config),
      playSound: playSound,
      enableVibration: enableVibration,
    ); 

    final channelId = channel.id;
    final channelName = channel.name;
    final channelDescription = channel.description;

  
 
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
      styleInformation: styleInformation,
    );
  }
 
  static DarwinNotificationDetails _buildIOSDetails(NotificationConfig config) {
    
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
 
    );
  }

  // //
  static Future<AndroidNotificationChannel> _createNotificationChannel({
    required String id,
    required String name,
    String? description,
    Importance importance = Importance.defaultImportance,
    bool playSound = true,
    bool enableVibration = false,
  }) async {
    if (!Platform.isAndroid) {
      return AndroidNotificationChannel(id, name, importance: importance);
    }

    final androidPlugin = notificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();

    if (androidPlugin == null) {
      return AndroidNotificationChannel(id, name, importance: importance);
    }

    // Try to get existing channels
    final existingChannels = await androidPlugin.getNotificationChannels();

    // Check if channel already exists
    final index = existingChannels?.indexWhere((element) => element.id == id);

    if (index != null && index >= 0) {
      return existingChannels![index];
    }

    // Create new channel if it doesn't exist
    final newChannel = AndroidNotificationChannel(
      id,
      name,
      description: description,
      importance: importance,
      playSound: playSound,
      enableVibration: enableVibration,
    );

    await androidPlugin.createNotificationChannel(newChannel);

    return newChannel;
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
