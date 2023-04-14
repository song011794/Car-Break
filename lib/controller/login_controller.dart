import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final ValueNotifier<String> idValue = ValueNotifier<String>('');
  final ValueNotifier<String> passwordValue = ValueNotifier<String>('');
}
