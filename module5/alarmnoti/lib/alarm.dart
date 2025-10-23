
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final player = AudioPlayer();
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> playAlarm() async {
  await player.play(AssetSource('alarm.wav')); 
}

// Initialize notifications
Future<void> initNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  final InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

// Schedule alarm
Future<void> scheduleAlarm(DateTime alarmTime) async {
  const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
    'alarm_channel',
    'Alarm Notifications',
    channelDescription: 'Channel for alarm notifications',
    importance: Importance.max,
    priority: Priority.high,
    playSound: false, // Disable default sound
  );

  const NotificationDetails notificationDetails =
      NotificationDetails(android: androidDetails);

  final int delayInSeconds = alarmTime.difference(DateTime.now()).inSeconds;

  // Delay both notification and sound until alarmTime
  Future.delayed(Duration(seconds: delayInSeconds), () async {
    await flutterLocalNotificationsPlugin.show(
      0,
      '⏰ Alarm',
      'Your alarm is ringing!',
      notificationDetails,
    );

    await playAlarm(); 
  });
}
