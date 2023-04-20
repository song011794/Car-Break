import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final RxInt stepperIndex = 0.obs;

  final RxString idValue = ''.obs;
  final RxString passwordValue = ''.obs;
  final RxString passwordConfirmValue = ''.obs;

  final RxBool isPasswordObscure = false.obs;
  final RxBool isPasswordConfirmObscure = false.obs;

  // final RxBool checkId = false.obs;
  final ValueNotifier<bool> checkId = ValueNotifier<bool>(false);

  void onConfirmId(GlobalKey<FormState> formKey, VoidCallback onStepContinue) {
    if (!formKey.currentState!.validate()) {
      return;
    }
    formKey.currentState!.save();

    onStepContinue();
  }

    void onConfirmPassword(GlobalKey<FormState> formKey, VoidCallback onStepContinue) {
    if (!formKey.currentState!.validate()) {
      return;
    }
    formKey.currentState!.save();

    onStepContinue();
  }
}
