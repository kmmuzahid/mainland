import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'notification_enums.dart';

/// Configuration for showing a notification
class NotificationConfig {
  /// Unique notification ID (auto-generated if null)
  final int? id;

  /// Notification title
  final String? title;

  /// Notification body/message
  final String? body;

  /// Alert type (mute, sound only, vibration only, both)
  final NotificationAlertType alertType;

  /// Display type (notification or message style)
  final NotificationDisplayType displayType;

  /// Custom sound file name (without extension)
  final String? soundFileName;

  /// Payload data to pass with notification
  final String? payload;

  /// Image path or URL (for big picture notifications)
  final String? imagePath;

  /// Builder function to extract image from custom data
  final String? Function(dynamic data)? imageBuilder;

  /// Custom data to pass to imageBuilder
  final dynamic data;

  /// Channel ID (uses default if not provided)
  final String? channelId;

  /// Channel name (uses default if not provided)
  final String? channelName;

  /// Channel description
  final String? channelDescription;

  /// Schedule time (null for immediate notification)
  final DateTime? scheduledDate;

  /// Android schedule mode for scheduled notifications
  final AndroidScheduleMode androidScheduleMode;

  const NotificationConfig({
    this.id,
    this.title,
    this.body,
    this.alertType = NotificationAlertType.vibrationAndSound,
    this.displayType = NotificationDisplayType.notification,
    this.soundFileName,
    this.payload,
    this.imagePath,
    this.imageBuilder,
    this.data,
    this.channelId,
    this.channelName,
    this.channelDescription,
    this.scheduledDate,
    this.androidScheduleMode = AndroidScheduleMode.exactAllowWhileIdle,
  });

  /// Get the extracted image path
  String? get extractedImagePath {
    if (imagePath != null) return imagePath;
    if (imageBuilder != null && data != null) {
      return imageBuilder!(data);
    }
    return null;
  }
}
