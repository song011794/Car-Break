import 'package:firebase_auth/firebase_auth.dart';
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

  void onConfirmPassword(
      GlobalKey<FormState> formKey, VoidCallback onStepContinue) {
    if (!formKey.currentState!.validate()) {
      return;
    }
    formKey.currentState!.save();

    onStepContinue();
  }

  Future<int> onSignUp(
      GlobalKey<FormState> idKey, GlobalKey<FormState> passwordKey) async {
    if (!idKey.currentState!.validate()) {
      stepperIndex(0);
      return -1;
    }

    if (!passwordKey.currentState!.validate()) {
      stepperIndex(1);
      return -2;
    }

    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: idValue.value,
        password: passwordValue.value,
      );

      await FirebaseAuth.instance.setLanguageCode("ko");
      await credential.user?.sendEmailVerification();

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');

        stepperIndex(0);
        return -3;
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    return 0;
  }
}
