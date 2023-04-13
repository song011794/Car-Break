import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vehicle/controller/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  static const CameraPosition _seoulCitiHall = CameraPosition(
    target: LatLng(37.5664, 126.9779),
    zoom: 14.4746,
  );  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _seoulCitiHall,
            onMapCreated: (GoogleMapController mapController) =>
                controller.mapController.complete(mapController),
            onCameraIdle: controller.onCameraIdle,
            markers: Set<Marker>.of(controller.allMarkers)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.goToCurrentPosition,
        child: const Icon(Icons.location_searching),
      ),
    );
  }  
}
