import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/coordinate_model.dart';
import '../repository/home_repository.dart';

class HomeController extends GetxController {
  final homeRepository = Get.find<HomeRepository>();

  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  List<Marker> allMarkers = <Marker>[].obs;

  @override
  void onInit() {
    super.onInit();

    mapController.future.then((mapController) async {
      await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      await mapController.animateCamera(CameraUpdate.newLatLng(
          LatLng(position.latitude, position.longitude)));
    });
  }

  void onCameraIdle() {
    mapController.future.then((mapController) async {
      LatLngBounds latLngBounds = await mapController.getVisibleRegion();

      findByCoordinate(latLngBounds);
    });
  }

  void findByCoordinate(LatLngBounds latLngBounds) async {
    allMarkers.clear();

    final res = await homeRepository.findByCoordinate({
      'latitude_bound': [
        latLngBounds.southwest.latitude.abs(),
        latLngBounds.northeast.latitude.abs()
      ],
      'longitude_bound': [
        latLngBounds.southwest.longitude.abs(),
        latLngBounds.northeast.longitude.abs()
      ]
    });

    final dataList =
        res.body.map((data) => CoordinateModel.fromJson(data)).toList();

    List<Marker> tempMarker = [];

    for (CoordinateModel coordinateModel in dataList) {
      tempMarker.add(Marker(
          markerId: MarkerId(coordinateModel.prkplceNo),
          position: LatLng(double.parse(coordinateModel.latitude ?? '0'),
              double.parse(coordinateModel.longitude ?? '0'))));
    }

    allMarkers.addAll(tempMarker);
  }

  void goToCurrentPosition() {
    mapController.future.then((mapController) async {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      await mapController.animateCamera(CameraUpdate.newLatLng(
          LatLng(position.latitude, position.longitude)));
    });
  }
}
