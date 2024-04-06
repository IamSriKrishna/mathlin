import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:math/Maps/Booking.dart';
import 'package:math/Maps/Widget/MainTextfield.dart';
import 'package:math/Maps/Widget/MapAppBar.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Location locationController = Location();

  static const LatLng googlePlex = LatLng(37.4223, -122.0848);
  static const LatLng mountainView = LatLng(37.3861, -122.0839);

  LatLng? currentPosition;
  Map<PolylineId, Polyline> polylines = {};
  late GoogleMapController mapController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await initializeMap();
    });
  }

  Future<void> initializeMap() async {
    await fetchLocationUpdates();
    final coordinates = await fetchPolylinePoints();
    generatePolyLineFromPoints(coordinates);
  }

  final TextEditingController _pickup = TextEditingController();
  final TextEditingController _drop = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    // Dispose location updates when the widget is disposed
    locationController.onLocationChanged.listen(null).cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(254, 250, 224, 1),
      body: CustomScrollView(
        slivers: [
          const MapCustomAppBar(text: '',),
          MainTextField(drop: _drop, pickup: _pickup),
          SliverToBoxAdapter(
            child: currentPosition == null
                ? const Center(child: CircularProgressIndicator())
                : SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: GoogleMap(
                      onTap: (argument) {
                        Get.to(() => const GoogleMapPage());
                      },
                      onMapCreated: (controller) {
                        mapController = controller;
                      },
                      markers: {
                        Marker(
                          markerId: const MarkerId('currentLocation'),
                          icon: BitmapDescriptor.defaultMarker,
                          position: currentPosition!,
                        ),
                      },
                      initialCameraPosition: CameraPosition(
                        target: currentPosition ?? const LatLng(0, 0),
                        zoom: 15, // Zoom level for the current location
                      ),
                    ),
                  ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromRGBO(217, 4, 41, 1),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Choose your vehicle",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            color: Colors.transparent,
                            child: Column(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'images/bike-removebg-preview.png'))),
                                ),
                                const Text("Bike")
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            color: Colors.transparent,
                            child: Column(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage('images/car.png'))),
                                ),
                                Text("Car")
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> fetchLocationUpdates() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await locationController.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await locationController.requestService();
    }
    if (!serviceEnabled) {
      return;
    }

    permissionGranted = await locationController.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await locationController.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationController.onLocationChanged.listen((LocationData currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          currentPosition = LatLng(
            currentLocation.latitude!,
            currentLocation.longitude!,
          );
        });
        // Zoom to the current location when it's available
        mapController.animateCamera(CameraUpdate.newLatLng(currentPosition!));
      }
    });
  }

  Future<List<LatLng>> fetchPolylinePoints() async {
    final PolylinePoints polylinePoints = PolylinePoints();

    final PolylineResult result =
        await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyC9cchYOHolyPlxRGnWvr4a6LIpXfIc1x0",
      PointLatLng(googlePlex.latitude, googlePlex.longitude),
      PointLatLng(mountainView.latitude, mountainView.longitude),
    );

    if (result.points.isNotEmpty) {
      return result.points
          .map((PointLatLng point) => LatLng(point.latitude, point.longitude))
          .toList();
    } else {
      debugPrint(result.errorMessage);
      return [];
    }
  }

  Future<void> generatePolyLineFromPoints(
      List<LatLng> polylineCoordinates) async {
    const PolylineId id = PolylineId('polyline');

    final Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.blueAccent,
      points: polylineCoordinates,
      width: 5,
    );

    setState(() => polylines[id] = polyline);
  }
}
