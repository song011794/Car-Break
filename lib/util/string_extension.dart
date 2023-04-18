import 'package:get/get.dart';

extension StringValidation on String? {
  String? validateEmail() {
    if ( this!.isEmpty) {
      return 'please_enter_your_email'.tr;
    } else if (!RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this!)) {
      return 'Invalid_email_format'.tr;
    }
    return null;
  }

  String? validatePassword() {
    if ( this!.isEmpty) {
      return 'please_enter_your_password'.tr;
    } else if (!RegExp(
            r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?~^<>,.&+=])[A-Za-z\d$@$!%*#?~^<>,.&+=]{8,15}$')
        .hasMatch(this!)) {
      return 'Invalid_password_format'.tr;
    }
    return null;
  }
}
