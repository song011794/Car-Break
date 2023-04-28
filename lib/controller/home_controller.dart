import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

import '../models/coordinate_model.dart';
import '../repository/home_repository.dart';
import '../util/secure_storage.dart';

class HomeController extends GetxController {
  late final homeRepository = Get.put(HomeRepository());

  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  RxList<Marker> allMarkers = <Marker>[].obs;

  RxList<bool> mapTypeToggleSelected = <bool>[true, false].obs;

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
    // allMarkers.clear();

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

    // allMarkers.addAll(tempMarker);
    allMarkers(tempMarker);
  }

  void goToCurrentPosition() {
    mapController.future.then((mapController) async {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      await mapController.animateCamera(CameraUpdate.newLatLng(
          LatLng(position.latitude, position.longitude)));
    });
  }

  void onSignOut() async {
    String? accessToken = await SecretStorage().readAccessToken();
    String? loginType = await SecretStorage().readLoginType();

    if (loginType != null) {
      // SNS 로그아웃
      if (accessToken != null) {
        if (loginType == 'naver') {
          await naverLogOut(accessToken);
        } else if (loginType == 'kakao') {
          await kakaoLogOut(accessToken);
        }
      }

      // Email, Google 로그아웃
      if (loginType == 'email') {
        // await naverLogOut(accessToken);
      } else if (loginType == 'google') {
        await googleLogOut();
      }
    }

    FirebaseAuth.instance.signOut();
    Get.offAllNamed('/login');
  }

  Future<void> kakaoLogOut(String accessToken) async {
    Uri kakaoUnLinkUri = Uri.https('kapi.kakao.com', '/v1/user/unlink');

    await http.post(
      kakaoUnLinkUri,
      headers: {"Authorization": 'Bearer $accessToken'},
    );
  }

  Future<void> naverLogOut(String accessToken) async {
    Uri kakaoUnLinkUri = Uri.https('nid.naver.com', '/oauth2.0/token', {
      'grant_type': 'delete',
      'client_id': dotenv.get('NAVER_CLIENT_ID'),
      'client_secret': dotenv.get('NAVER_CLIENT_SECRET'),
      'access_token': accessToken,
      'service_provider': 'NAVER'
    });

    var response = await http.get(kakaoUnLinkUri);
    debugPrint(response.toString());
  }

  Future<void> googleLogOut() async {
    await GoogleSignIn().disconnect();
    // await FirebaseAuth.instance.currentUser?.unlink('google.com');
  }

  void onMapTypeChanged(int index) {
    var tmpList = List.generate(mapTypeToggleSelected.length, (i) {
      if (index == i) {
        return true;
      } else {
        return false;
      }
    });

    mapTypeToggleSelected(tmpList);
  }
}
