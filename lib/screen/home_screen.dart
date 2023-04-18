import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vehicle/controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(HomeController());
  }

  final CameraPosition _seoulCitiHall = const CameraPosition(
    target: LatLng(37.5664, 126.9779),
    zoom: 14.4746,
  );

  Widget drawerUserHeader() => UserAccountsDrawerHeader(
        currentAccountPicture: FirebaseAuth.instance.currentUser?.photoURL ==
                null
            ? null
            : CircleAvatar(
                backgroundImage:
                    NetworkImage(FirebaseAuth.instance.currentUser!.photoURL!)),
        accountName: Text(FirebaseAuth.instance.currentUser?.displayName ?? ''),
        accountEmail: Text(FirebaseAuth.instance.currentUser?.email ?? ''),
        decoration: BoxDecoration(
            color: Colors.red[200],
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(40.0),
                bottomRight: Radius.circular(40.0))),
      );

  Widget drawerLogout() => ListTile(
        title: Text('sing_out'.tr),
        onTap: () => controller.onSignOut(),
      );

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      drawer: Drawer(
          child: ListView(children: [drawerUserHeader(), drawerLogout()])),
      appBar: AppBar(),
      body: Obx(
        () => GoogleMap(
            zoomControlsEnabled: false,
            minMaxZoomPreference: const MinMaxZoomPreference(12, 15),
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
