import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vehicle/controller/home_controller.dart';
import 'package:vehicle/util/custom_dialog.dart';

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
        title: Text(
          'sing_out'.tr,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.black,
        ),
        onTap: () {
          CustomDialog().showOkCancel(
              title: 'sing_out'.tr,
              content: 'Are_you_sure_you_want_to_log_out'.tr,
              onOk: () async {
                if (!await controller.onSignOut()) {}
              });
        },
      );

  Widget drawerMapType() => ListTile(
        title: Text(
          'map_type'.tr,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        trailing: ObxValue(
            (data) => ToggleButtons(
                borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                constraints: const BoxConstraints(minHeight: 35, minWidth: 50),
                isSelected: data,
                onPressed: controller.onMapTypeChanged,
                children: [Text('normal'.tr), Text('satellite'.tr)]),
            controller.mapTypeToggleSelected),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
          child: ListView(children: [
        drawerUserHeader(),
        drawerMapType(),
        drawerLogout(),
      ])),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => Scaffold(
                body: GoogleMap(
                    mapType: controller.mapTypeToggleSelected[0]
                        ? MapType.normal
                        : MapType.satellite,
                    myLocationButtonEnabled: false,
                    zoomControlsEnabled: false,
                    minMaxZoomPreference: const MinMaxZoomPreference(12, 15),
                    initialCameraPosition: _seoulCitiHall,
                    onMapCreated: (GoogleMapController mapController) =>
                        controller.mapController.complete(mapController),
                    onCameraIdle: controller.onCameraIdle,
                    markers: Set<Marker>.of(controller.allMarkers)),
                floatingActionButton: FloatingActionButton(
                  onPressed: controller.goToCurrentPosition,
                  child: const Icon(Icons.location_searching),
                ),
              ),
            ),
          ),
          Expanded(
              child: Obx(
            () => ListView.builder(
                itemCount: controller.coordinateDataList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      controller.coordinateDataList.elementAt(index).prkplceNm,
                    ),
                    subtitle: Text(
                      controller.coordinateDataList.elementAt(index).rdnmadr ??
                          controller.coordinateDataList
                              .elementAt(index)
                              .lnmadr!,
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          controller.goToNavgation(controller.coordinateDataList.elementAt(index));
                        },
                        icon: Icon(
                          Icons.assistant_navigation,
                          color: Colors.amber,
                        )),
                  );
                }),
          )),
        ],
      ),
    );
  }
}
