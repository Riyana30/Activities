
import 'dart:async';
import 'package:background_locator_2/settings/locator_settings.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:background_locator_2/background_locator.dart';
import 'package:background_locator_2/settings/android_settings.dart';
import 'back.dart'; 
Future<void> initializeService() async {
  final service = FlutterBackgroundService();
 await service.configure(
    androidConfiguration: AndroidConfiguration(
      onStart: onStartService,
      autoStart: true,
      isForegroundMode: true,
      notificationChannelId: 'location_channel',
      initialNotificationTitle: 'Location Service Active',
      initialNotificationContent: 'Tracking your location...',
    
    ),
    iosConfiguration: IosConfiguration(),
  );
 service.startService();
}
@pragma('vm:entry-point')
Future<void> onStartService(ServiceInstance service) async {
  if (service is AndroidServiceInstance) {
    service.setAsForegroundService();
  }
await BackgroundLocator.initialize();
 await BackgroundLocator.registerLocationUpdate(
    LocationCallbackHandler.callback, 
    autoStop: false,
    androidSettings: AndroidSettings(
      accuracy: LocationAccuracy.NAVIGATION,
      interval: 15000, 
      distanceFilter: 20,
      androidNotificationSettings: AndroidNotificationSettings(
        notificationChannelName: 'Background Tracking',
        notificationTitle: 'Tracking Active',
        notificationMsg: 'Your location is being tracked in background',
      ),
    ),
  );
}
