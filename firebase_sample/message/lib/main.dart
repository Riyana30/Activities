import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:message/firebase_api.dart';
import 'package:message/firebase_options.dart';
import 'package:message/home.dart';
import 'package:message/notifcation.dart';

void main(dynamic navigatorKey)async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
await FirebaseApi().initNotification();
runApp(MaterialApp(
  home: Home(),
  navigatorKey: navigatorKey,
  routes: {
    'Mynoti':(context)=> Mynoti(),
  },
));
 
}



