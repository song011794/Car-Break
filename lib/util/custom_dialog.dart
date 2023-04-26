import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../util/string_extension.dart';

class CustomDialog {
  Future<void> showLoading() async {
    await showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => WillPopScope(
        onWillPop: () async => false,
        child: const Center(
          child: SizedBox(
            width: 60,
            height: 60,
            child: CircularProgressIndicator(
              strokeWidth: 10,
            ),
          ),
        ),
      ),
    );
  }

  void showOk(
      {required String title, required String content, VoidCallback? onOk}) {
    Get.dialog(
      AlertDialog(
        title: Container(
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
          child: Text(
            title.tr,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        titlePadding: const EdgeInsets.all(0),
        content: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Text(content.tr, textAlign: TextAlign.center),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        actions: <Widget>[
          MaterialButton(
            child: Text("ok".tr),
            onPressed: () {
              if (onOk != null) {
                onOk();
              } else {
                Get.back();
              }
            },
          )
        ],
      ),
      barrierDismissible: false,
    );
  }

  void showTextFild({required Function onOk}) {
    TextEditingController textEditingController = TextEditingController();

    Get.dialog(
      AlertDialog(
        title: Container(
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
          child: Text(
            'find_password'.tr,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        titlePadding: const EdgeInsets.all(0),
        content: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: TextFormField(
                controller: textEditingController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.emailAddress,
                validator: (value) => value.validateEmail(),
                decoration: InputDecoration(
                  isDense: true,
                  errorStyle: TextStyle(fontSize: 30.sp),
                  prefixIcon: const Icon(Icons.person),
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
                ))),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        actions: <Widget>[
          MaterialButton(
            child: Text("ok".tr),
            onPressed: () {
              onOk(textEditingController.value.text);
              textEditingController.dispose();
              Get.back();
            },
          )
        ],
      ),
      barrierDismissible: false,
    );
  }
}
