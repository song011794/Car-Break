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

  @override
  void onInit() {
    super.onInit();

    mapController.future.then((mapController) async {
      await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      await mapController.animateCamera(CameraUpdate.newLatLng(
          LatLng(position.latitude, position.longitude)));

      LatLngBounds latLngBounds = await mapController.getVisibleRegion();

      findByCoordinate(latLngBounds);
    });
  }

  findByCoordinate(LatLngBounds latLngBounds) async {
    final res = await homeRepository.findByCoordinate({
      'latitude_bound': [
        latLngBounds.southwest.latitude,
        latLngBounds.northeast.latitude
      ],
      'longitude_bound': [
        latLngBounds.southwest.longitude,
        latLngBounds.northeast.longitude
      ]
    });

    final dataList =
        res.body.map((data) => ResponseCoordinateModel.fromJson(data)).toList();

    print(dataList);
  }
}
