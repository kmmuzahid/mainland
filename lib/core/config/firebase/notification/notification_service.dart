import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:mainland/core/config/firebase/notification/notification_config.dart';
import 'package:mainland/core/config/firebase/notification/notification_details_builder.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

/// Singleton service for managing local notifications
class NotificationService {
  // Private constructor
  NotificationService._();

  // Singleton instance
  static final NotificationService _instance = NotificationService._();

  // Getter for singleton instance
  static NotificationService get instance => _instance;

  // Flutter Local Notifications Plugin instance
  final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();

  // Notification ID counter
  int _notificationId = 0;

  /// Initialize the notification service
  Future<void> initialize(Function(NotificationResponse) onNotificationTapped) async {
    WidgetsFlutterBinding.ensureInitialized();

    await _initializePlugin(
      onNotificationTapped: onNotificationTapped,
      onBackgroundNotificationTapped: onNotificationTapped,
    );

    await requestPermissions();
  }

  /// Request notification permissions (iOS/macOS/Android)
  Future<bool?> requestPermissions({
    bool alert = true,
    bool badge = true,
    bool sound = true,
  }) async {
    if (Platform.isIOS || Platform.isMacOS) {
      return await _notificationsPlugin
          .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(alert: alert, badge: badge, sound: sound);
    } else if (Platform.isAndroid) {
      final androidImplementation = _notificationsPlugin
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
      return await androidImplementation?.requestNotificationsPermission();
    }
    return null;
  }

  /// Check if notifications are enabled (Android)
  Future<bool?> areNotificationsEnabled() async {
    if (Platform.isAndroid) {
      return await _notificationsPlugin
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
          ?.areNotificationsEnabled();
    }
    return null;
  }

  /// Show a notification with the given configuration
  /// This is the main method to display any type of notification
  Future<void> show(NotificationConfig config) async {
    final notificationId = config.id ?? _notificationId++;
    final details = NotificationDetailsBuilder.build(config);

    if (config.scheduledDate != null) {
      // Schedule notification
      final scheduledTZDate = tz.TZDateTime.from(config.scheduledDate!, tz.local);
      await _notificationsPlugin.zonedSchedule(
        id: notificationId,
        title: config.title,
        body: config.body,
        scheduledDate: scheduledTZDate,
        notificationDetails: details,
        androidScheduleMode: config.androidScheduleMode,
        payload: config.payload,
      );
    } else {
      // Show immediate notification
      await _notificationsPlugin.show(
        id: notificationId,
        title: config.title,
        body: config.body,
        notificationDetails: details,
        payload: config.payload,
      );
    }
  }

  /// Cancel a specific notification
  Future<void> cancel(int id) async {
    await _notificationsPlugin.cancel(id: id);
  }

  /// Cancel all notifications
  Future<void> cancelAll() async {
    await _notificationsPlugin.cancelAll();
  }

  /// Get pending notification requests
  Future<List<PendingNotificationRequest>> getPendingNotifications() async {
    return await _notificationsPlugin.pendingNotificationRequests();
  }

  /// Get active notifications
  Future<List<ActiveNotification>?> getActiveNotifications() async {
    return await _notificationsPlugin.getActiveNotifications();
  }

  // ==================== Private Methods ====================

  /// Initialize the notification plugin
  Future<void> _initializePlugin({
    required void Function(NotificationResponse) onNotificationTapped,
    void Function(NotificationResponse)? onBackgroundNotificationTapped,
    List<DarwinNotificationCategory>? darwinNotificationCategories,
  }) async {
    await _configureLocalTimeZone();

    // Android initialization settings
    const androidSettings = AndroidInitializationSettings('@drawable/ic_launcher');

    // iOS/macOS initialization settings
    final iosSettings = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      notificationCategories: darwinNotificationCategories ?? [],
    );

    // Combined initialization settings
    final initializationSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
      macOS: iosSettings,
    );

    // Initialize the plugin
    await _notificationsPlugin.initialize(
      settings: initializationSettings,
      onDidReceiveNotificationResponse: onNotificationTapped,
      onDidReceiveBackgroundNotificationResponse: onBackgroundNotificationTapped,
    );
  }

  /// Configure local timezone
  Future<void> _configureLocalTimeZone() async {
    if (kIsWeb || Platform.isLinux) {
      return;
    }
    tz.initializeTimeZones();
    if (Platform.isWindows) {
      return;
    }
    final timeZoneName = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName.identifier));
  }

  /// Create a notification channel (Android)
  Future<void> _createNotificationChannel({
    required String id,
    required String name,
    String? description,
    Importance importance = Importance.defaultImportance,
  }) async {
    if (!Platform.isAndroid) return;

    final channel = AndroidNotificationChannel(
      id,
      name,
      description: description,
      importance: importance,
    );

    await _notificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  /// Delete a notification channel (Android)
  Future<void> _deleteNotificationChannel(String channelId) async {
    if (!Platform.isAndroid) return;

    await _notificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.deleteNotificationChannel(channelId: channelId);
  }

  /// Get the plugin instance (for advanced usage)
  FlutterLocalNotificationsPlugin get plugin => _notificationsPlugin;
}
