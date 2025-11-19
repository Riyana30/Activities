import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:background_locator_2/background_locator.dart';
import 'package:background_locator_2/settings/android_settings.dart';
import 'package:background_locator_2/settings/locator_settings.dart';
import 'package:background_locator_2/settings/ios_settings.dart';
import 'package:loctracker/back.dart';
import 'package:loctracker/visitedpage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await _initApp(); 
 runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyMapApp(),
  ));
}
Future<void> _initApp() async {
await _requestPermissions();
try {
    await BackgroundLocator.initialize();
    debugPrint(" BackgroundLocator initialized successfully");
 await Future.delayed(const Duration(seconds: 1)); 
await BackgroundLocator.registerLocationUpdate(
      LocationCallbackHandler.callback,
      autoStop: false,
      iosSettings: IOSSettings(
        accuracy: LocationAccuracy.NAVIGATION,
        distanceFilter: 0,
      ),
      androidSettings: AndroidSettings(
        accuracy:LocationAccuracy.NAVIGATION,
        interval: 15000, 
        distanceFilter: 30,
        androidNotificationSettings: AndroidNotificationSettings(
          notificationChannelName: 'Location Tracking',
          notificationTitle: 'Tracking Active',
          notificationMsg: 'Your location is being tracked in background',
          notificationBigMsg:
              'Tracking continues even if the app is closed or swiped away.',
          notificationIcon: '', 
          notificationTapCallback:
              LocationCallbackHandler.notificationCallback,
        ),
      ),
    );
 debugPrint(" Background locator started");
  }catch (e) {
  debugPrint(" BackgroundLocator init failed: $e");
  }
}
Future<void> _requestPermissions() async {
 if (await Permission.location.isDenied) {
    await Permission.location.request();
  }
  if (await Permission.locationAlways.isDenied) {
    await Permission.locationAlways.request();
  }
  if (await Permission.notification.isDenied) {
    await Permission.notification.request();
  }
 final fine = await Permission.location.status;
  if (!fine.isGranted) {
    debugPrint(' Location permission not granted. Background tracking may fail.');
  }
}
