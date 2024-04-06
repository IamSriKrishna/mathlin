import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:math/Maps/Booking.dart';
class MainScreenMap extends StatelessWidget {
  final LatLng currentPosition;
  final GoogleMapController mapController;
  
  MainScreenMap({Key? key, required this.currentPosition, required this.mapController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: currentPosition == null
          ? Center(child: CircularProgressIndicator())
          : Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.4,
              child: GoogleMap(
                onTap: (argument) {
                  Get.to(() => GoogleMapPage());
                },
                onMapCreated: (controller) {},
                markers: {
                  Marker(
                    markerId: const MarkerId('currentLocation'),
                    icon: BitmapDescriptor.defaultMarker,
                    position: currentPosition,
                  ),
                },
                initialCameraPosition: CameraPosition(
                  target: currentPosition ?? LatLng(0, 0),
                  zoom: 15, // Zoom level for the current location
                ),
              ),
            ),
    );
  }
}
