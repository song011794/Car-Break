import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uuid/uuid.dart';
import 'package:vehicle/util/custom_dialog.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final ValueNotifier<String> idValue = ValueNotifier<String>('');
  final ValueNotifier<String> passwordValue = ValueNotifier<String>('');

  final RxBool isObscure = false.obs;

  void onSignIn(GlobalKey<FormState> formKey) async {
    if (!formKey.currentState!.validate()) {
      return;
      // formKey.currentState!.save();
    }

    formKey.currentState!.save();

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

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  Future<UserCredential> signInWithNaver() async {
    final clientState = const Uuid().v4();
    final url = Uri.https('nid.naver.com', '/oauth2.0/authorize', {
      'response_type': 'code',
      'client_id': dotenv.get('NAVER_CLIENT_ID'),
      'redirect_uri': dotenv.get('NAVER_REDIRECT_SIGN_IN_URI'),
      'state': clientState,
    });

    final result = await FlutterWebAuth.authenticate(
        url: url.toString(), callbackUrlScheme: "webauthcallback");
    final body = Uri.parse(result).queryParameters;

    final tokenUrl = Uri.https('nid.naver.com', '/oauth2.0/token', {
      'grant_type': 'authorization_code',
      'client_id': dotenv.get('NAVER_CLIENT_ID'),
      'client_secret': dotenv.get('NAVER_CLIENT_SECRET'),
      'code': body["code"],
      'state': clientState,
    });
    var responseTokens = await http.post(tokenUrl);

    Map<String, dynamic> bodys = json.decode(responseTokens.body);

    var response = await http.post(
        Uri.parse(dotenv.get('NAVER_REDIRECT_TOKEN_URI')),
        headers: {"Content-Type": "application/json"},
        body: json.encode({"accessToken": bodys['access_token']}));

    return FirebaseAuth.instance.signInWithCustomToken(response.body);
  }

  Future<UserCredential> signInWithKaKao() async {
    final clientState = const Uuid().v4();
    final url = Uri.https('kauth.kakao.com', '/oauth/authorize', {
      'response_type': 'code',
      'client_id': dotenv.get('KAKAO_CLIENT_ID'),
      'response_mode': 'form_post',
      'redirect_uri': dotenv.get('KAKAO_REDIRECT_SIGN_IN_URI'),
      'scope': 'account_email profile_image',
      'state': clientState,
    });

    print(url.toString());

    final result = await FlutterWebAuth.authenticate(
        url: url.toString(),
        callbackUrlScheme: "webauthcallback"); //"applink"//"signinwithapple"
    final body = Uri.parse(result).queryParameters;

    final tokenUrl = Uri.https('kauth.kakao.com', '/oauth/token', {
      'grant_type': 'authorization_code',
      'client_id': dotenv.get('KAKAO_CLIENT_ID'),
      'client_secret': dotenv.get('KAKAO_CLIENT_SECRET'),
      'redirect_uri': dotenv.get('KAKAO_REDIRECT_SIGN_IN_URI'),
      'code': body["code"],
    });
    var responseTokens = await http.post(tokenUrl);
    Map<String, dynamic> bodys = json.decode(responseTokens.body);
    var response = await http.post(
        Uri.parse(dotenv.get('KAKAO_REDIRECT_TOKEN_URI')),
        headers: {"Content-Type": "application/json"},
        body: json.encode({"accessToken": bodys['access_token']}));

    final aa = FirebaseAuth.instance.signInWithCustomToken(response.body);

    return FirebaseAuth.instance.signInWithCustomToken(response.body);
  }
}
