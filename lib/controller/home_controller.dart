import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/coordinate_model.dart';
import '../repository/home_repository.dart';
import '../util/custom_dialog.dart';
import '../util/secure_storage.dart';

class HomeController extends GetxController {
  late final homeRepository = Get.put(HomeRepository());

  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  RxList<Marker> allMarkers = <Marker>[].obs;

  RxList<bool> mapTypeToggleSelected = <bool>[true, false].obs;

  RxList<CoordinateModel> coordinateDataList = <CoordinateModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    mapController.future.then((mapController) async {
      changeMapMode(mapController);
      await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      await mapController.animateCamera(CameraUpdate.newLatLng(
          LatLng(position.latitude, position.longitude)));
    });
  }

  void changeMapMode(GoogleMapController mapController) async {
    ByteData byte = await rootBundle.load('lib/assets/map_style.json');
    var list = byte.buffer.asUint8List(byte.offsetInBytes, byte.lengthInBytes);
    String jsonFile = utf8.decode(list);

    mapController.setMapStyle(jsonFile);
  }

  void onCameraIdle() {
    mapController.future.then((mapController) async {
      Future.delayed(const Duration(milliseconds: 200), () async {
        LatLngBounds latLngBounds = await mapController.getVisibleRegion();
        findByCoordinate(latLngBounds);
      });
    });
  }

  void findByCoordinate(LatLngBounds latLngBounds) async {
    try {
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

      List dataList =
          res.body.map((data) => CoordinateModel.fromJson(data)).toList();

      coordinateDataList(dataList
          .where((element) =>
              (element is CoordinateModel) &&
              (element.latitude != null) &&
              element.longitude != null)
          .cast<CoordinateModel>()
          .toList());

      List<Marker> tempMarker = [];

      for (CoordinateModel coordinateModel in coordinateDataList
          // dataList
          ) {
        tempMarker.add(Marker(
            infoWindow: InfoWindow(title: 'title\ntitle2', snippet: 'snippet2'),
            markerId: MarkerId(coordinateModel.prkplceNo),
            position: LatLng(double.parse(coordinateModel.latitude ?? '0'),
                double.parse(coordinateModel.longitude ?? '0'))));
      }

      allMarkers(tempMarker);
    } catch (e) {
      allMarkers([]);
    }
  }

  void goToCurrentPosition() {
    mapController.future.then((mapController) async {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      await mapController.animateCamera(CameraUpdate.newLatLngZoom(
          LatLng(position.latitude, position.longitude), 14.5));
    });
  }

  Future<bool> onSignOut() async {
    CustomDialog().showLoading();

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

    Navigator.of(Get.overlayContext!).pop();

    return true;
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

  void goToKaKaoNavgation(CoordinateModel coordinateModel) async {
    if (await NaviApi.instance.isKakaoNaviInstalled()) {
      // 카카오내비 앱으로 목적지 공유하기, WGS84 좌표계 사용
      await NaviApi.instance.shareDestination(
        destination: Location(
            name: coordinateModel.rdnmadr ?? coordinateModel.lnmadr!,
            x: coordinateModel.longitude!,
            y: coordinateModel.latitude!),
        // 좌표계 지정
        option: NaviOption(coordType: CoordType.wgs84),
      );
    } else {
      // 카카오내비 설치 페이지로 이동
      launchBrowserTab(Uri.parse(NaviApi.webNaviInstall));
    }
  }

  void goToTmapNavgation(CoordinateModel coordinateModel) async {
    try {
      final String result = await const MethodChannel('mobile/parameters')
          .invokeMethod('isTmapApplicationInstalled');

      if (result.isEmpty) {
        String url =
            'https://apis.openapi.sk.com/tmap/app/routes?appkey${dotenv.get("TMAP_API_KEY")}&name=${coordinateModel.rdnmadr ?? coordinateModel.lnmadr!}&lon=${coordinateModel.longitude}&lat=${coordinateModel.latitude}';

        Uri mapUrl = Uri.parse(Uri.encodeFull(url));

        if (await canLaunchUrl(mapUrl)) {
          await launchUrl(mapUrl);
        }
      } else {
        if (await canLaunchUrl(Uri.parse(result))) {
          await launchUrl(Uri.parse(result));
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
