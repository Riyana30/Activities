import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();
Future<void>main()async{
  WidgetsFlutterBinding.ensureInitialized();
  AndroidInitializationSettings androidInitisettings=AndroidInitializationSettings('@mipmap/ic_launcher');
  InitializationSettings initSettings=InitializationSettings(android: androidInitisettings);
  await flutterLocalNotificationsPlugin.initialize(initSettings);
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Notifiaction(),
    );
  }
}

class Notifiaction extends StatelessWidget {
  const Notifiaction({super.key});
  Future<void> shownoti()async{
    AndroidNotificationDetails androidDetails=AndroidNotificationDetails("channelId", "channelName",importance: Importance.high,priority: Priority.high);
    NotificationDetails platformDetails=NotificationDetails(android: androidDetails);
    await flutterLocalNotificationsPlugin.show(0, 'Hello', "This is a local Notification", platformDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local Notification Demo'),
        
      ),body: Center(child: ElevatedButton(onPressed: shownoti
      , child: Text('Show Notification')),),
    );
  }
}
