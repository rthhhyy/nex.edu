class NotificationModel {
  final String id;
  final String title;
  final String message;
  final DateTime timestamp;
}

class ReminderSettings {
  final bool enabled;
  final String frequency;
  final TimeOfDay time;
}
