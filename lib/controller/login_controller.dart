import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vehicle/util/custom_dialog.dart';

class LoginController extends GetxController {
  final ValueNotifier<String> idValue = ValueNotifier<String>('');
  final ValueNotifier<String> passwordValue = ValueNotifier<String>('');

  final RxBool isObscure = false.obs;

  void onSignIn(GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    }

    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: idValue.value, password: passwordValue.value);

      String? tt = await credential.user?.providerData[0].providerId;
      print('providerId : $tt');

      String? aa = await credential.user?.uid;
      print('uid : $aa');

      String? jwtToken = await credential.user?.getIdToken();

      if (credential.user?.emailVerified ?? false) {
        Get.toNamed('/home');
      } else {
        // debugPrint('인증 안됨');
        CustomDialog().showOk(title: 'Dialog', content: 'This is a dialog');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
      }
    }
  }

  void onSignUp() async {
    Get.toNamed('/signin');
    // CustomDialog().showSignInFormDialog();

    // try {
    //   final credential =
    //       await FirebaseAuth.instance.createUserWithEmailAndPassword(
    //     email: idValue.value,
    //     password: passwordValue.value,
    //   );

    //   await FirebaseAuth.instance.setLanguageCode("ko");
    //   await credential.user?.sendEmailVerification();
    // } on FirebaseAuthException catch (e) {
    //   if (e.code == 'weak-password') {
    //     debugPrint('The password provided is too weak.');
    //   } else if (e.code == 'email-already-in-use') {
    //     debugPrint('The account already exists for that email.');
    //   }
    // } catch (e) {
    //   debugPrint(e.toString());
    // }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    String? tt = await userCredential.user?.providerData[0].providerId;
    print('providerId : $tt');

    String? aa = await userCredential.user?.uid;
    print('uid : $aa');

    String? jwtToken = await userCredential.user?.getIdToken();

    try {
      final emailCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: userCredential.user!.email!,
              password: userCredential.user!.uid);

      if (emailCredential.user?.emailVerified ?? false) {
        Get.toNamed('/home');
      } else {
        debugPrint('인증 안됨');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Get.toNamed('/home');
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithApple() async {
    final appleProvider = AppleAuthProvider();

    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithProvider(appleProvider);

    String? jwtToken = await userCredential.user?.getIdToken();

    return await FirebaseAuth.instance.signInWithProvider(appleProvider);
  }
}
