import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final ValueNotifier<String> idValue = ValueNotifier<String>('');
  final ValueNotifier<String> passwordValue = ValueNotifier<String>('');

  void onSignIn(GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    }

    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: idValue.value, password: passwordValue.value);

      if (credential.user?.emailVerified ?? false) {
        Get.toNamed('/home');
      } else {
        print('인증 안됨');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  void onSignUp() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: idValue.value,
        password: passwordValue.value,
      );

      await FirebaseAuth.instance.setLanguageCode("kr");
      await credential.user?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
