import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../util/string_extension.dart';

class CustomDialog {
  void showSignInFormDialog() {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0))),
        title: Text('회원가입'),
        content: Container(
          height: 500.h,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value.validateEmail(),
                      decoration: InputDecoration(
                        isDense: true,
                        errorStyle: TextStyle(fontSize: 30.sp),
                        hintText: 'id'.tr,
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
                ),
                // SizedBox(
                //   height: 50.h,
                // ),
                Padding(
                  padding: EdgeInsets.only(bottom: 50.h),
                  child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value.validatePassword(),
                      decoration: InputDecoration(
                        isDense: true,
                        errorMaxLines: 2,
                        errorStyle: TextStyle(
                            fontSize: 30.sp, overflow: TextOverflow.fade),
                        hintText: 'password'.tr,
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
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Material(
                    color: const Color(0xffff8906),
                    child: InkWell(
                      onTap: () {
                        //print('called on tap');
                      },
                      child: SizedBox(
                        height: kToolbarHeight,
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'Bottom Button',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 50.w,
                ),
                Expanded(
                  child: Material(
                    color: const Color(0xffff8906),
                    child: InkWell(
                      onTap: () {
                        //print('called on tap');
                      },
                      child: SizedBox(
                        height: kToolbarHeight,
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'Bottom Button',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  void showOk({required String title, required String content}) {
    Get.dialog(AlertDialog(
      title: Text(title.tr),
      content: Text(content.tr),
      actions: [
        TextButton(
          child: const Text("Close"),
          onPressed: () => Get.back(),
        ),
      ],
    ));
  }
}
