// // import 'package:flutter/material.dart';
// // import 'package:flutter_map/flutter_map.dart';
// // import 'package:latlong2/latlong.dart';
// // import 'package:geolocator/geolocator.dart';
// // import 'package:permission_handler/permission_handler.dart';
// // import 'package:geocoding/geocoding.dart';

// // void main() {
// //   runApp(const MaterialApp(
// //     debugShowCheckedModeBanner: false,
// //     home: MyMapApp(),
// //   ));
// // }

// // class MyMapApp extends StatefulWidget {
// //   const MyMapApp({super.key});

// //   @override
// //   State<MyMapApp> createState() => _MyMapAppState();
// // }

// // class _MyMapAppState extends State<MyMapApp> {
// //   final MapController _mapController = MapController();
// //   LatLng? _currentLocation;
// //   bool _isLoading = true;
// //   bool _showPlaces = false;

// //   final List<String> _visitedPlaces = [];
// //   final List<LatLng> _visitedLatLngs = [];

// //   String? _lastRecordedPlace; // last known place name
// //   LatLng? _lastRecordedLatLng; // last coordinates

// //   @override
// //   void initState() {
// //     super.initState();
// //     WidgetsBinding.instance.addPostFrameCallback((_) => _initLocation());
// //   }

// //   //  Ask for permission and start tracking
// //   Future<void> _initLocation() async {
// //     if (!await _requestPermission()) return;

// //     try {
// //       Position position = await Geolocator.getCurrentPosition(
// //         desiredAccuracy: LocationAccuracy.high,
// //       );
// //       await _updateLocation(position);

// //       //  Continuous tracking stream
// //       Geolocator.getPositionStream(
// //         locationSettings: const LocationSettings(
// //           distanceFilter: 20,
// //           accuracy: LocationAccuracy.high,
// //         ),
// //       ).listen((Position pos) {
// //         _updateLocation(pos);
// //       });
// //     } catch (e) {
// //       debugPrint("Location error: $e");
// //     } finally {
// //       setState(() => _isLoading = false);
// //     }
// //   }

// //   //  Request location permission
// //   Future<bool> _requestPermission() async {
// //     var status = await Permission.location.request();
// //     if (!status.isGranted) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(content: Text("Location permission is required")),
// //       );
// //       return false;
// //     }
// //     return true;
// //   }

// //   //  Update location and map view
// //   Future<void> _updateLocation(Position position) async {
// //     final newLatLng = LatLng(position.latitude, position.longitude);

// //     if (!mounted) return;
// //     await Future.delayed(const Duration(milliseconds: 200));

// //     try {
// //       _mapController.move(newLatLng, 15);
// //     } catch (e) {
// //       debugPrint("Map not ready yet: $e");
// //     }

// //     _currentLocation = newLatLng;

// //     // Record new street or place
// //     await _recordPlace(newLatLng);

// //     setState(() {});
// //   }

// //   //  Record new visited place (detect new streets or localities)
// //   Future<void> _recordPlace(LatLng latLng) async {
// //     try {
// //       // ✅ Check distance difference first to avoid duplicates
// //       if (_lastRecordedLatLng != null) {
// //         final distance = Distance().as(
// //           LengthUnit.Meter,
// //           latLng,
// //           _lastRecordedLatLng!,
// //         );
// //         if (distance < 30) return; // skip small GPS drift
// //       }

// //       List<Placemark> placemarks =
// //           await placemarkFromCoordinates(latLng.latitude, latLng.longitude);

// //       if (placemarks.isNotEmpty) {
// //         final p = placemarks.first;

// //         //  More detailed address for street-level detection
// //         String place =
// //             "${p.name ?? ''}, ${p.street ?? ''}, ${p.subLocality ?? ''}, ${p.locality ?? ''}, ${p.administrativeArea ?? ''}, ${p.country ?? ''}"
// //                 .replaceAll(RegExp(r', ,| ,'), ',')
// //                 .trim();

// //         //  Only record if this street/place is new
// //         if (place.isNotEmpty && place != _lastRecordedPlace) {
// //           _lastRecordedPlace = place;
// //           _lastRecordedLatLng = latLng;
// //           _visitedLatLngs.add(latLng);

// //           setState(() {
// //             _visitedPlaces.insert(0, place);
// //           });

// //           debugPrint(" New street or place visited: $place");
// //         }
// //       }
// //     } catch (e) {
// //       debugPrint("Geocoding error: $e");
// //     }
// //   }

// //   void _togglePlaces() {
// //     setState(() {
// //       _showPlaces = !_showPlaces;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text("Live Location Tracker"),
// //         backgroundColor: Colors.blueAccent,
// //       ),
// //       body: Stack(
// //         children: [
// //           _currentLocation == null
// //               ? const Center(child: CircularProgressIndicator())
// //               : FlutterMap(
// //                   mapController: _mapController,
// //                   options: MapOptions(
// //                     initialCenter: _currentLocation!,
// //                     initialZoom: 15,
// //                   ),
// //                   children: [
// //                     TileLayer(
// //                       urlTemplate:
// //                           'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
// //                       userAgentPackageName: 'com.example.loctracker',
// //                     ),

// //                     // Draw line between visited places
// //                     if (_visitedLatLngs.length > 1)
// //                       PolylineLayer(
// //                         polylines: [
// //                           Polyline(
// //                             points: _visitedLatLngs,
// //                             strokeWidth: 5,
// //                             color: Colors.blueAccent,
// //                           ),
// //                         ],
// //                       ),

// //                     //  Current location marker
// //                     MarkerLayer(
// //                       markers: [
// //                         if (_currentLocation != null)
// //                           Marker(
// //                             point: _currentLocation!,
// //                             width: 60,
// //                             height: 60,
// //                             child: const Icon(
// //                               Icons.location_pin,
// //                               color: Colors.red,
// //                               size: 45,
// //                             ),
// //                           ),
// //                       ],
// //                     ),
// //                   ],
// //                 ),

// //           //  Show visited places list
// //           if (_showPlaces)
// //             Align(
// //               alignment: Alignment.bottomCenter,
// //               child: Container(
// //                 height: 250,
// //                 padding: const EdgeInsets.all(12),
// //                 decoration: BoxDecoration(
// //                   color: Colors.white.withOpacity(0.95),
// //                   borderRadius:
// //                       const BorderRadius.vertical(top: Radius.circular(16)),
// //                 ),
// //                 child: Column(
// //                   children: [
// //                     const Text(
// //                       "Visited Places",
// //                       style:
// //                           TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
// //                     ),
// //                     const SizedBox(height: 8),
// //                     Expanded(
// //                       child: _visitedPlaces.isEmpty
// //                           ? const Center(child: Text("No places recorded yet."))
// //                           : ListView.builder(
// //                               itemCount: _visitedPlaces.length,
// //                               itemBuilder: (context, index) {
// //                                 return ListTile(
// //                                   leading: const Icon(Icons.place,
// //                                       color: Colors.blueAccent),
// //                                   title: Text(_visitedPlaces[index]),
// //                                 );
// //                               },
// //                             ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),

// //           if (_isLoading)
// //             const Center(child: CircularProgressIndicator()),
// //         ],
// //       ),

// //       //  Floating buttons
// //       floatingActionButton: Column(
// //         mainAxisSize: MainAxisSize.min,
// //         children: [
// //           FloatingActionButton(
// //             heroTag: "locate",
// //             onPressed: _initLocation,
// //             tooltip: "Get My Location",
// //             child: const Icon(Icons.my_location),
// //           ),
// //           const SizedBox(height: 10),
// //           FloatingActionButton(
// //             heroTag: "places",
// //             onPressed: _togglePlaces,
// //             tooltip: "Show Recent Places",
// //             child: Icon(_showPlaces ? Icons.close : Icons.list),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// // 1111111111111111111111111111111111111111111111111111111111
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:loctracker/back.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class MyMapApp extends StatefulWidget {
//   const MyMapApp({super.key});

//   @override
//   State<MyMapApp> createState() => _MyMapAppState();
// }

// class _MyMapAppState extends State<MyMapApp> {
//   final MapController _mapController = MapController();
//   LatLng? _currentLocation;
//   bool _isLoading = true;
//   bool _showPlaces = false;

//   final List<String> _visitedPlaces = [];
//   final List<LatLng> _visitedLatLngs = [];
//   final List<LatLng> _routePoints = [];

//   String? _lastRecordedPlace;
//   LatLng? _lastRecordedLatLng;

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       await _initApp();
//     });
//   }

//   Future<void> _initApp() async {
//     await BackgroundService.initialize(); // ✅ initialize background_locator_2
//     await _requestPermission();

//     // ✅ Start background tracking (runs even after app killed)
//     await BackgroundService.start();

//     // ✅ Load visited places (persistent storage)
//     await _loadSavedLocations();

//     // ✅ Foreground tracking for live updates
//     await _initForegroundTracking();
//   }

//   /// ✅ Load all saved locations from SharedPreferences
//   Future<void> _loadSavedLocations() async {
//     final prefs = await SharedPreferences.getInstance();
//     final storedData = prefs.getString('visited_places');

//     _visitedLatLngs.clear();
//     _visitedPlaces.clear();

//     if (storedData != null) {
//       final data = jsonDecode(storedData) as List<dynamic>;
//       for (final item in data.reversed) {
//         final lat = item['lat'];
//         final lng = item['lng'];
//         final place = item['place'];
//         if (lat != null && lng != null && place != null) {
//           _visitedLatLngs.add(LatLng(lat, lng));
//           _visitedPlaces.add(place);
//         }
//       }
//     }

//     setState(() {});
//     debugPrint("📍 Loaded ${_visitedPlaces.length} saved places");
//   }

//   /// Ask for foreground + background permissions
//   Future<void> _requestPermission() async {
//     var foreground = await Permission.locationWhenInUse.request();
//     if (!foreground.isGranted) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Location permission is required")),
//       );
//       return;
//     }

//     var background = await Permission.locationAlways.request();
//     if (background.isDenied || background.isPermanentlyDenied) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Please enable background location")),
//       );
//       await openAppSettings();
//     }
//   }

//   /// Foreground live tracking
//   Future<void> _initForegroundTracking() async {
//     try {
//       bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//       if (!serviceEnabled) {
//         await Geolocator.openLocationSettings();
//         return;
//       }

//       Position pos = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high,
//       );

//       await _updateLocation(pos);

//       Geolocator.getPositionStream(
//         locationSettings: const LocationSettings(
//           distanceFilter: 20,
//           accuracy: LocationAccuracy.high,
//         ),
//       ).listen(_updateLocation);
//     } catch (e) {
//       debugPrint("❌ Foreground tracking error: $e");
//     } finally {
//       setState(() => _isLoading = false);
//     }
//   }

//   Future<void> _updateLocation(Position position) async {
//     final newLatLng = LatLng(position.latitude, position.longitude);
//     if (!mounted) return;

//     _currentLocation = newLatLng;
//     _mapController.move(newLatLng, 16);
//     await _recordPlace(newLatLng);
//     setState(() {});
//   }

//   /// ✅ Record new location (and save persistently)
//   Future<void> _recordPlace(LatLng latLng) async {
//     try {
//       if (_lastRecordedLatLng != null) {
//         final distance = Distance().as(
//           LengthUnit.Meter,
//           latLng,
//           _lastRecordedLatLng!,
//         );
//         if (distance < 30) return;
//       }

//       List<Placemark> placemarks =
//           await placemarkFromCoordinates(latLng.latitude, latLng.longitude);

//       if (placemarks.isNotEmpty) {
//         final p = placemarks.first;
//         String place =
//             "${p.name ?? ''}, ${p.locality ?? ''}, ${p.country ?? ''}"
//                 .replaceAll(RegExp(r', ,| ,'), ',')
//                 .trim();

//         if (place.isNotEmpty && place != _lastRecordedPlace) {
//           _lastRecordedPlace = place;
//           _lastRecordedLatLng = latLng;
//           _visitedLatLngs.add(latLng);
//           _visitedPlaces.insert(0, place);
//           debugPrint("✅ Foreground place recorded: $place");

//           // ✅ Save persistently in single list
//           final prefs = await SharedPreferences.getInstance();
//           final storedData = prefs.getString('visited_places');
//           List<dynamic> storedList = [];

//           if (storedData != null) {
//             storedList = jsonDecode(storedData);
//           }

//           final newEntry = {
//             'lat': latLng.latitude,
//             'lng': latLng.longitude,
//             'place': place,
//             'timestamp': DateTime.now().toIso8601String(),
//           };

//           storedList.add(newEntry);
//           await prefs.setString('visited_places', jsonEncode(storedList));

//           // ✅ Draw route between last two
//           if (_visitedLatLngs.length > 1) {
//             await _getRoadRoute(
//               _visitedLatLngs[_visitedLatLngs.length - 2],
//               _visitedLatLngs.last,
//             );
//           }

//           setState(() {});
//         }
//       }
//     } catch (e) {
//       debugPrint("Geocoding error: $e");
//     }
//   }

//   Future<void> _getRoadRoute(LatLng start, LatLng end) async {
//     final url =
//         "https://router.project-osrm.org/route/v1/driving/${start.longitude},${start.latitude};${end.longitude},${end.latitude}?geometries=geojson";
//     try {
//       final res = await http.get(Uri.parse(url));
//       if (res.statusCode == 200) {
//         final data = jsonDecode(res.body);
//         final coords = data["routes"][0]["geometry"]["coordinates"] as List;
//         for (var c in coords) {
//           _routePoints.add(LatLng(c[1], c[0]));
//         }
//         setState(() {});
//       }
//     } catch (e) {
//       debugPrint("OSRM route fetch error: $e");
//     }
//   }

//   void _togglePlaces() async {
//     if (!_showPlaces) {
//       // ✅ Reload when opening list, includes background data
//       await _loadSavedLocations();
//     }
//     setState(() => _showPlaces = !_showPlaces);
//   }

//   Future<void> _clearSavedLocations() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove('visited_places');
//     setState(() {
//       _visitedPlaces.clear();
//       _visitedLatLngs.clear();
//     });
//     debugPrint("🧹 Cleared saved locations");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Location Tracker"),
//         backgroundColor: Colors.blueAccent,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.delete_forever),
//             tooltip: "Clear Saved Data",
//             onPressed: _clearSavedLocations,
//           )
//         ],
//       ),
//       body: Stack(
//         children: [
//           if (_currentLocation == null && _isLoading)
//             const Center(child: CircularProgressIndicator())
//           else
//             FlutterMap(
//               mapController: _mapController,
//               options: MapOptions(
//                 initialCenter: _currentLocation ?? const LatLng(0, 0),
//                 initialZoom: 16,
//               ),
//               children: [
//                 TileLayer(
//                   urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
//                   userAgentPackageName: 'com.example.loctracker',
//                 ),
//                 if (_routePoints.isNotEmpty)
//                   PolylineLayer(
//                     polylines: [
//                       Polyline(
//                         points: _routePoints,
//                         strokeWidth: 6,
//                         color: Colors.blueAccent,
//                       ),
//                     ],
//                   ),
//                 MarkerLayer(
//                   markers: [
//                     if (_currentLocation != null)
//                       Marker(
//                         point: _currentLocation!,
//                         width: 60,
//                         height: 60,
//                         child: const Icon(
//                           Icons.location_pin,
//                           color: Colors.red,
//                           size: 45,
//                         ),
//                       ),
//                   ],
//                 ),
//               ],
//             ),

//           /// Visited Places bottom panel
//           if (_showPlaces)
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Container(
//                 height: 250,
//                 padding: const EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: Colors.white.withOpacity(0.95),
//                   borderRadius:
//                       const BorderRadius.vertical(top: Radius.circular(16)),
//                 ),
//                 child: Column(
//                   children: [
//                     const Text(
//                       "Visited Places",
//                       style:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                     ),
//                     const SizedBox(height: 8),
//                     Expanded(
//                       child: _visitedPlaces.isEmpty
//                           ? const Center(
//                               child: Text("No places recorded yet."),
//                             )
//                           : ListView.builder(
//                               itemCount: _visitedPlaces.length,
//                               itemBuilder: (context, index) => ListTile(
//                                 leading: const Icon(Icons.place,
//                                     color: Colors.blueAccent),
//                                 title: Text(_visitedPlaces[index]),
//                               ),
//                             ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//         ],
//       ),
//       floatingActionButton: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           FloatingActionButton(
//             heroTag: "locate",
//             onPressed: _initForegroundTracking,
//             tooltip: "Get My Location",
//             child: const Icon(Icons.my_location),
//           ),
//           const SizedBox(height: 10),
//           FloatingActionButton(
//             heroTag: "places",
//             onPressed: _togglePlaces,
//             tooltip: "Show Recent Places",
//             child: Icon(_showPlaces ? Icons.close : Icons.list),
//           ),
//         ],
//       ),
//     );
//   }
// }
