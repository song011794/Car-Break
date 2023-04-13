import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
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

    findByCoordinate();
  }

  findByCoordinate() async {
    final res = await homeRepository.findByCoordinate({
      'latitude_bound': [36.015056, 37.1241231],
      'longitude_bound': [127.394592, 128.34234]
    });

    final dataList =
        res.body.map((data) => ResponseCoordinateModel.fromJson(data)).toList();
  }
}
