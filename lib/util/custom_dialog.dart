import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialog {
  void showOk({required String title, required String content}) {
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
              Get.back();
            },
          )
        ],
      ),
      barrierDismissible: false,

      //   AlertDialog(
      //   titlePadding: EdgeInsets.zero,
      //   shape: const RoundedRectangleBorder(
      //       borderRadius: BorderRadius.all(Radius.circular(32.0))),
      //   title: Container(
      //     color: Colors.indigoAccent,
      //     child: Center(
      //       child: Text(
      //         title.tr,
      //       ),
      //     ),
      //   ),
      //   content: Text(content.tr),
      //   actions: [
      //     TextButton(
      //       child: const Text("Close"),
      //       onPressed: () => Get.back(),
      //     ),
      //   ],
      // )
    );
  }
}
