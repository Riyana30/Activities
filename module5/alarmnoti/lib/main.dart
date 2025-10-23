// lib/main.dart
import 'package:flutter/material.dart';
import 'alarm.dart';
 // ✅ import your service

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initNotifications(); // ✅ initialize notifications
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AlarmPage());
  }
}

class AlarmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Set Alarm '),backgroundColor: Colors.amber,centerTitle: true,),
      
      body: Center(
        child: ElevatedButton(
          onPressed: () {
           
            DateTime alarmTime = DateTime.now().add(Duration(seconds: 10));
            scheduleAlarm(alarmTime);
          },
          child: Text('Set Alarm'),
        ),
      ),
    );
  }
}
