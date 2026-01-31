/// Notification alert type
enum NotificationAlertType {
  /// No sound or vibration
  mute,
  
  /// Sound only, no vibration
  soundOnly,
  
  /// Vibration only, no sound
  vibrationOnly,
  
  /// Both sound and vibration
  vibrationAndSound,
}

/// Type of notification display
enum NotificationDisplayType {
  /// Standard notification
  notification,
  
  /// Messaging style notification (Android)
  message,
}
