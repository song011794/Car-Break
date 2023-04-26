import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:app_settings/app_settings.dart';
import 'package:vehicle/util/custom_dialog.dart';

class PermissionHandler {
  Future<void> requestPermission() async {
    if (await Permission.location.request().isGranted) {
      return;
    }

// You can request multiple permissions at once.
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.locationWhenInUse,
    ].request();

    if (statuses[Permission.location] == PermissionStatus.permanentlyDenied) {
      CustomDialog().showOk(
          title: 'permission_request'.tr,
          content: 'Please_allow_location_permission'.tr,
          onOk: () {
            AppSettings.openLocationSettings();
          });
    }
  }
}
