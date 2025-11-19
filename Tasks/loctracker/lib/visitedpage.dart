import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geocoding/geocoding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class MyMapApp extends StatefulWidget {
  const MyMapApp({super.key});

  @override
  State<MyMapApp> createState() => _MyMapAppState();
}

class _MyMapAppState extends State<MyMapApp> with WidgetsBindingObserver {
  final MapController _mapController = MapController();
  LatLng? _currentLocation;
  bool _isLoading = true;
  bool _showPlaces = false;

  final List<Map<String, dynamic>> _savedEntries = [];
  final List<LatLng> _routePoints = [];

  LatLng? _lastRecordedLatLng;
  LatLng? _targetLocation;

  final FlutterLocalNotificationsPlugin _notifier =
      FlutterLocalNotificationsPlugin();
  final TextEditingController _destinationController = TextEditingController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _initNotifications();
      await _initForegroundTracking();
      await _loadSavedLocations();
      await _loadTargetLocation();
    });
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 30));
      if (!mounted) return false;
      await _loadSavedLocations();
      return true;
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _destinationController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _loadSavedLocations();
      _loadTargetLocation();
    }
  }

  Future<void> _requestPermission() async {
    await Permission.location.request();
    await Permission.locationAlways.request();
    await Permission.notification.request();
  }

  Future<void> _initNotifications() async {
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initSettings = InitializationSettings(android: androidInit);
    await _notifier.initialize(initSettings);
  }
 Future<void> _showNotification(String title, String body) async {
    const androidDetails = AndroidNotificationDetails(
      'geofence_channel',
      'Geofence Alerts',
      importance: Importance.max,
      priority: Priority.high,
    );
    const details = NotificationDetails(android: androidDetails);
    await _notifier.show(0, title, body, details);
  }
 Future<void> _loadTargetLocation() async {
    final prefs = await SharedPreferences.getInstance();
    final lat = prefs.getDouble('target_lat');
    final lng = prefs.getDouble('target_lng');
    if (lat != null && lng != null) {
      setState(() => _targetLocation = LatLng(lat, lng));
    }
  }
 Future<void> _setTargetLocation(LatLng target) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('target_lat', target.latitude);
    await prefs.setDouble('target_lng', target.longitude);
    await prefs.setBool('shown_near', false);
    await prefs.setBool('shown_reached', false);
    setState(() => _targetLocation = target);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          ' Destination set: ${target.latitude.toStringAsFixed(5)}, ${target.longitude.toStringAsFixed(5)}',
        ),
      ),
    );
  }

  Future<void> _loadSavedLocations() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final storedData = prefs.getString('visited_places');
      _savedEntries.clear();
      if (storedData != null) {
        final List<dynamic> data = jsonDecode(storedData);
        final now = DateTime.now();
        for (final item in data) {
          final lat = (item['lat'] as num?)?.toDouble();
          final lng = (item['lng'] as num?)?.toDouble();
          final place = item['place'] as String? ?? '';
          final subarea = item['subarea'] as String? ?? '';
          final timestampStr = item['timestamp'] as String? ?? '';
          if (lat != null && lng != null && timestampStr.isNotEmpty) {
            final timestamp = DateTime.tryParse(timestampStr);
            if (timestamp != null &&
                now.difference(timestamp).inMinutes <= 60) {
              _savedEntries.add({
                'lat': lat,
                'lng': lng,
                'place': place,
                'subarea': subarea,
                'timestamp': timestampStr,
              });
            }
          }
        }
      }
      if (_savedEntries.isNotEmpty) {
        final last = _savedEntries.last;
        _lastRecordedLatLng = LatLng(last['lat'], last['lng']);
      }
      if (_savedEntries.length > 1) {
        try {
          await _getOSRMRoadRoute(_savedEntries);
        } catch (e) {
          debugPrint("⚠️ Route drawing skipped: $e");
        }
      }
      if (!mounted) return;
      setState(() => _isLoading = false);
    } catch (e) {
      debugPrint(" Error loading saved locations: $e");
    }
  }
Future<void> _initForegroundTracking() async {
    try {
      await _requestPermission();
if (!await Geolocator.isLocationServiceEnabled()) {
        await Geolocator.openLocationSettings();
        return;
      }
final pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      await _updateLocation(pos);
Geolocator.getPositionStream(
        locationSettings:LocationSettings(
          distanceFilter: 30,
          accuracy: LocationAccuracy.high,
        ),
      ).listen(_updateLocation);
    } catch (e) {
      debugPrint(" Foreground tracking error: $e");
    } finally {
      if (!mounted) return;
      setState(() => _isLoading = false);
    }
  }
Future<void> _updateLocation(Position position) async {
    final newLatLng = LatLng(position.latitude, position.longitude);
    if (!mounted) return;

    _currentLocation = newLatLng;
    _mapController.move(newLatLng, 16);
    await _recordPlaceForeground(newLatLng);
    await _checkGeofenceForeground(newLatLng);

    if (!mounted) return;
    setState(() {});
  }
Future<void> _checkGeofenceForeground(LatLng current) async {
    final prefs = await SharedPreferences.getInstance();
    final targetLat = prefs.getDouble('target_lat');
    final targetLng = prefs.getDouble('target_lng');
    if (targetLat == null || targetLng == null) return;
final target = LatLng(targetLat, targetLng);
    final distance = Distance().as(LengthUnit.Meter, current, target);
final shownNear = prefs.getBool('shown_near') ?? false;
    final shownReached = prefs.getBool('shown_reached') ?? false;
if (distance <= 10 && !shownNear && distance > 3) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            ' You are near your destination — only ${distance.toStringAsFixed(1)} meters away!',
          ),
        ),
      );
      await _showNotification(
        ' Near Destination',
        'You are about ${distance.toStringAsFixed(1)} meters from your target.',
      );
      await prefs.setBool('shown_near', true);
    }
 if (distance <= 3 && !shownReached) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(' You have reached your destination!')),
      );
      await _showNotification(
        ' Destination Reached',
        'You have arrived at your target.',
      );
      await prefs.setBool('shown_reached', true);
    }
  }
Future<void> _recordPlaceForeground(LatLng latLng) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final storedData = prefs.getString('visited_places');
      List<dynamic> data = storedData != null ? jsonDecode(storedData) : [];
  if (_lastRecordedLatLng != null) {
        final d = Distance().as(LengthUnit.Meter, _lastRecordedLatLng!, latLng);
        if (d < 30) return;
      }
 final placemarks = await placemarkFromCoordinates(
        latLng.latitude,
        latLng.longitude,
      );
  String placeName = "Unknown location";
      String subArea = "";
 if (placemarks.isNotEmpty) {
        final p = placemarks.first;
        placeName = p.name ?? "Unnamed place";
        subArea = [
          p.subLocality,
          p.locality,
          p.administrativeArea,
        ].where((s) => s != null && s.isNotEmpty).join(', ');
      }
   final newEntry = {
        'lat': latLng.latitude,
        'lng': latLng.longitude,
        'place': placeName,
        'subarea': subArea,
        'timestamp': DateTime.now().toIso8601String(),
      };
   data.add(newEntry);
      await prefs.setString('visited_places', jsonEncode(data));

      _lastRecordedLatLng = latLng;
      await _loadSavedLocations();
    } catch (e) {
      debugPrint(" Error recording place: $e");
    }
  }
Future<void> _getOSRMRoadRoute(List<Map<String, dynamic>> entries) async {
    try {
      if (entries.length < 2) return;
 _routePoints.clear();
 for (int i = 0; i < entries.length - 1; i++) {
        final start = entries[i];
        final end = entries[i + 1];
        final startLat = start['lat'];
        final startLng = start['lng'];
        final endLat = end['lat'];
        final endLng = end['lng'];
     if (startLat == null ||
            startLng == null ||
            endLat == null ||
            endLng == null) {
          continue;
        }
     final url =
            "https://router.project-osrm.org/route/v1/driving/$startLng,$startLat;$endLng,$endLat?geometries=geojson&overview=full";
       final res = await http.get(Uri.parse(url));
       if (res.statusCode == 200) {
          final data = jsonDecode(res.body);
          if (data['routes'] != null && data['routes'].isNotEmpty) {
            final routeCoords =
                data['routes'][0]['geometry']['coordinates'] as List<dynamic>;

            for (var c in routeCoords) {
              _routePoints.add(LatLng(c[1], c[0]));
            }
          }
        }
      }
     if (!mounted) return;
      setState(() {});
    } catch (e) {
      debugPrint(" Route error: $e");
    }
  }
 void _togglePlaces() {
    setState(() => _showPlaces = !_showPlaces);
    if (_showPlaces) {
      showModalBottomSheet(
        context: context,
        builder: (_) => ListView(
          children: _savedEntries.reversed.map((e) {
            return ListTile(
              leading: Icon(Icons.location_on, color: Colors.blue),
              title: Text(e['place'] ?? "Unknown place"),
              subtitle: Text(
                e['subarea'].isNotEmpty
                    ? e['subarea']
                    : (DateTime.tryParse(
                            e['timestamp'],
                          )?.toLocal().toString().substring(0, 19) ??
                          ''),
              ),
            );
          }).toList(),
        ),
      ).whenComplete(() => setState(() => _showPlaces = false));
    }
  }
 Future<void> _clearSavedLocations() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('visited_places');
    _savedEntries.clear();
    setState(() {});
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("All locations cleared")));
  }
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location Tracker"),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: _clearSavedLocations,
          ),
        ],
      ),
      body: Stack(
        children: [
          if (_currentLocation == null && _isLoading)
            Center(child: CircularProgressIndicator())
          else
            FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                initialCenter: _currentLocation ?? LatLng(0, 0),
                initialZoom: 16,
                onTap: (tapPosition, latlng) async {
                  await _setTargetLocation(latlng);
                },
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.loctracker',
                ),
                if (_routePoints.isNotEmpty)
                  PolylineLayer(
                    polylines: [
                      Polyline(
                        points: _routePoints,
                        strokeWidth: 5,
                        color: Colors.blueAccent,
                      ),
                    ],
                  ),
                MarkerLayer(
                  markers: [
                    if (_currentLocation != null)
                      Marker(
                        point: _currentLocation!,
                        width: 60,
                        height: 60,
                        child: Icon(
                          Icons.location_pin,
                          color: Colors.red,
                          size: 45,
                        ),
                      ),
                    if (_targetLocation != null)
                      Marker(
                        point: _targetLocation!,
                        width: 50,
                        height: 50,
                        child: Icon(Icons.flag, color: Colors.green, size: 45),
                      ),
                  ],
                ),
              ],
            ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: "locate",
            onPressed: _initForegroundTracking,
            child: Icon(Icons.my_location),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "places",
            onPressed: _togglePlaces,
            child: Icon(_showPlaces ? Icons.close : Icons.list),
          ),
        ],
      ),
    );
  }
}
