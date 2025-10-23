// lib/extensions/flutter_local_notifications_extension.dart
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

extension FlutterLocalNotificationsPluginExtension
    on FlutterLocalNotificationsPlugin {
  Future<void> scheduleWithoutTimezone({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledDate,
    required NotificationDetails notificationDetails,
    bool androidAllowWhileIdle = false,
  }) async {
    return schedule(
      id,
      title,
      body,
      scheduledDate,
      notificationDetails,
      androidAllowWhileIdle: androidAllowWhileIdle,
    );
  }
  
  Future<void> schedule(int id, String title, String body, DateTime scheduledDate, NotificationDetails notificationDetails, {required bool androidAllowWhileIdle}) async {}
}
