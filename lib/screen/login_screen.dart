import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import '../util/string_extension.dart';

import '../controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  /// 텍스트 입력(ID, Password)받는 위젯 </br>
  /// Param </br>
  /// ValueNotifier<String> listenableValue : 데이터 저장 변수 </br>
  /// bool isPassword : 패스워드 여부 </br>
  Widget textInputFiled(ValueNotifier<String> listenableValue,
      {bool isPassword = false,
      bool isObscure = false,
      Function? onObscureIconTap}) {
    return ValueListenableBuilder(
        valueListenable: listenableValue,
        builder: (context, value, child) {
          return SizedBox(
            height: 230.h,
            child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: isPassword ? null : TextInputType.emailAddress,
                initialValue: value,
                onChanged: (value) => listenableValue.value = value,
                obscureText: isPassword && !isObscure,
                validator: (value) => isPassword
                    ? value.validatePassword()
                    : value.validateEmail(),
                decoration: InputDecoration(
                  isDense: true,
                  errorStyle: TextStyle(fontSize: 30.sp),
                  prefixIcon: isPassword
                      ? const Icon(Icons.lock)
                      : const Icon(Icons.person),
                  suffixIcon: isPassword
                      ? IconButton(
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: !isObscure ? Colors.black : Colors.blueGrey,
                          ),
                          onPressed: () {
                            onObscureIconTap!();
                          },
                        )
                      : null,
                  hintText: isPassword ? 'password'.tr : 'id'.tr,
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.5),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      borderSide: BorderSide(color: Colors.blue)),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      borderSide: BorderSide(color: Colors.black)),
                  focusedErrorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      borderSide: BorderSide(color: Colors.blue)),
                  errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      borderSide: BorderSide(color: Colors.red)),
                )),
          );
        });
  }

  Widget socialLoginButton(String imagePath, VoidCallback onLogin) {
    return InkWell(
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.white,
        child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage(
              imagePath,
            )),
      ),
      onTap: () => onLogin,
    );
  }

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'lib/images/login_bg.png',
                  ),
                  fit: BoxFit.cover)),
          child: Container(
            padding: EdgeInsets.only(left: 100.w, right: 100.w),
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(children: [
                    SizedBox(
                      height: 500.h,
                    ),
                    textInputFiled(controller.idValue),
                    Obx(() => textInputFiled(controller.passwordValue,
                            isPassword: true,
                            isObscure: controller.isObscure.value,
                            onObscureIconTap: () {
                          controller.isObscure(!controller.isObscure.value);
                        })),
                  ]),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 150.h,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.lightGreen.withOpacity(0.95)),
                      ),
                      onPressed: () {
                        controller.onSignIn(_formKey);
                      },
                      child: Text(
                        'sing_in'.tr,
                        style: TextStyle(fontSize: 55.sp),
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          controller.onSignUp();
                        },
                        child: Text(
                          '아이디/비밀번호 찾기',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 35.sp),
                        )),
                    TextButton(
                        onPressed: () {
                          controller.onSignUp();
                        },
                        child: Text(
                          '회원가입',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 45.sp),
                        )),
                  ],
                ),
                SizedBox(
                  height: 150.h,
                ),
                Text(
                  'sns_login'.tr,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 40.sp),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    socialLoginButton('lib/images/google_logo.png',
                        controller.signInWithGoogle),
                    socialLoginButton('lib/images/apple_logo.png',
                        controller.signInWithGoogle),
                    socialLoginButton('lib/images/facebook_logo.png',
                        controller.signInWithGoogle),
                    // socialLoginButton(controller.signInWithGoogle)
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
