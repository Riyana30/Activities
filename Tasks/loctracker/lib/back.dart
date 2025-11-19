import 'dart:convert';
import 'package:background_locator_2/location_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/foundation.dart';
class LocationCallbackHandler {
  static Future<void> callback(LocationDto locationDto) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final storedData = prefs.getString('visited_places');
      List<dynamic> list = storedData != null ? jsonDecode(storedData) : [];
final placemarks = await placemarkFromCoordinates(
        locationDto.latitude,
        locationDto.longitude,
      );
String place = '';
      if (placemarks.isNotEmpty) {
        final p = placemarks.first;
        place = "${p.locality ?? ''}, ${p.country ?? ''}";
      } else {
        place = 'Unknown place';
      }
list.add({
        'lat': locationDto.latitude,
        'lng': locationDto.longitude,
        'place': place,
        'timestamp': DateTime.now().toIso8601String(),
      });
await prefs.setString('visited_places', jsonEncode(list));
      debugPrint(' Location saved: ${locationDto.latitude}, ${locationDto.longitude}');
    } catch (e) {
      debugPrint(' Error saving location: $e');
    }
  }
static Future<void> initCallback(Map<dynamic, dynamic> params) async {
    debugPrint(' Background locator initialized.');
  }
  static Future<void> disposeCallback() async {
    debugPrint(' Background locator disposed.');
  }
  static Future<void> notificationCallback() async {
    debugPrint(' Notification clicked.');
  }
}
