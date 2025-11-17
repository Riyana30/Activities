import 'dart:io';
import 'package:flutter/material.dart';
import 'package:alarm/alarm.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Alarm.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const AlarmScreen(),
    );
  }
}

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({super.key});

  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  /// 🔹 Regular Daily Alarm (8:00 AM)
  Future<void> _setDailyAlarm() async {
    final now = DateTime.now();
    DateTime alarmDateTime = DateTime(now.year, now.month, now.day, 13, 53);


    if (alarmDateTime.isBefore(now)) {
      alarmDateTime = alarmDateTime.add(const Duration(days: 1));
    }

    final alarmSettings = AlarmSettings(
      id: 1,
      dateTime: alarmDateTime,
      assetAudioPath: 'assets/alarm.mp3',
      loopAudio: true,
      vibrate: true,
      warningNotificationOnKill: Platform.isIOS,
      androidFullScreenIntent: true,
      volumeSettings: VolumeSettings.fade(
        volume: 0.8,
        fadeDuration: const Duration(seconds: 3),
        volumeEnforced: true,
      ),
      notificationSettings: const NotificationSettings(
        title: 'Daily Reminder',
        body: 'Time for your daily task!',
        stopButton: 'Stop Alarm',
      ),
      allowAlarmOverlap: false,
      androidStopAlarmOnTermination: true,
    );

    await Alarm.set(alarmSettings: alarmSettings);

    // ✅ Show confirmation message to the user
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '✅ Daily alarm has been set for ${alarmDateTime.hour}:${alarmDateTime.minute.toString().padLeft(2, '0')}',
          ),
          duration: const Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.green,
        ),
      );
    }

    debugPrint('✅ Daily alarm set for: $alarmDateTime');
  }

  /// 🔹 Quick Test Alarm (fires after 10 seconds)
  Future<void> _setTestAlarm() async {
    final now = DateTime.now();
    final alarmDateTime = now.add(const Duration(seconds: 10));

    final alarmSettings = AlarmSettings(
      id: 2,
      dateTime: alarmDateTime,
      assetAudioPath: 'assets/alarm.mp3',
      loopAudio: true,
      vibrate: true,
      warningNotificationOnKill: Platform.isIOS,
      androidFullScreenIntent: true,
      volumeSettings: VolumeSettings.fade(
        volume: 0.8,
        fadeDuration: const Duration(seconds: 2),
        volumeEnforced: true,
      ),
      notificationSettings: const NotificationSettings(
        title: 'Test Alarm',
        body: 'This is a 10-second test alarm!',
        stopButton: 'Stop Test',
      ),
      allowAlarmOverlap: false,
      androidStopAlarmOnTermination: true,
    );

    await Alarm.set(alarmSettings: alarmSettings);

    // ✅ Show confirmation for test alarm
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('🚀 Test alarm will ring in 10 seconds!'),
          duration: Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }

    debugPrint('🚀 Test alarm set for: $alarmDateTime');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Alarm Tester')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _setTestAlarm,
              child: const Text('⏱️ Set 10-Second Test Alarm'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _setDailyAlarm,
              child: const Text('🌅 Set Daily 9:00 AM Alarm'),
            ),
          ],
        ),
      ),
    );
  }
}
