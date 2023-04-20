import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../util/string_extension.dart';
import '../controller/sign_in_controller.dart';

enum TextFormType { id, password, passwordConfirm }

class SignInScreen extends GetView<SignInController> {
  SignInScreen({super.key});

  final GlobalKey<FormState> _idKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _passwordKey = GlobalKey<FormState>();

  Widget textForm(TextFormType textFormType,
      {bool isObscure = false, Function? onObscureIconTap}) {
    final RxString dataValue;

    if (textFormType == TextFormType.id) {
      dataValue = controller.idValue;
    } else if (textFormType == TextFormType.password) {
      dataValue = controller.passwordValue;
    } else {
      dataValue = controller.passwordConfirmValue;
    }

    return Container(
      padding: EdgeInsets.only(right: 100.w),
      child: ObxValue(
          (data) => TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: textFormType == TextFormType.id
                  ? TextInputType.emailAddress
                  : null,
              initialValue: data.value,
              onChanged: (value) => data(value),
              obscureText: (textFormType == TextFormType.password ||
                      textFormType == TextFormType.passwordConfirm) &&
                  !isObscure,
              validator: (value) {
                String? result;
                if (textFormType == TextFormType.id) {
                  result = value.validateEmail();
                } else if (textFormType == TextFormType.password) {
                  result = value.validatePassword();
                } else {
                  result = value
                      .validatePasswordConfirm(controller.passwordValue.value);
                }

                return result;
              },
              decoration: InputDecoration(
                isDense: true,
                errorStyle: TextStyle(fontSize: 30.sp),
                prefixIcon: textFormType == TextFormType.password ||
                        textFormType == TextFormType.passwordConfirm
                    ? const Icon(Icons.lock)
                    : const Icon(Icons.person),
                suffixIcon: textFormType == TextFormType.password ||
                        textFormType == TextFormType.passwordConfirm
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
          dataValue),
    );
  }

  Widget stepperBody() {
    return ObxValue(
        (data) => Stepper(
              currentStep: data.value,
              controlsBuilder: ((context, details) {
                if (details.currentStep == 0) {
                  return Row(
                    children: <Widget>[
                      TextButton(
                        onPressed: () {
                          controller.onConfirmId(
                              _idKey, details.onStepContinue!);
                        },
                        child: const Text(
                          'Continue',
                          style: TextStyle(
                            color: Colors.teal,
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Row(
                    children: <Widget>[
                      TextButton(
                        onPressed: () {
                          controller.onConfirmPassword(
                              _idKey, details.onStepContinue!);
                        },
                        child: const Text(
                          'Continue',
                          style: TextStyle(
                            color: Colors.teal,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: details.onStepCancel,
                        child: const Text('이전'),
                      ),
                    ],
                  );
                }
              }),
              onStepCancel: () {
                if (data.value > 0) {
                  --data.value;
                }
              },
              onStepContinue: () {
                if (data.value <= 0) {
                  ++data.value;
                }
              },
              onStepTapped: (int index) {
                data(index);
              },
              steps: <Step>[
                Step(
                    title: Text(
                      '아이디를 입력하세요.',
                      style: TextStyle(
                          color: _idKey.currentState?.validate() ?? true
                              ? data.value == 0
                                  ? Colors.blue
                                  : Colors.black
                              : Colors.red
                          // data.value == 0 ? Colors.blue : Colors.black
                          ),
                    ),
                    content: Form(
                      key: _idKey,
                      child: textForm(
                        TextFormType.id,
                      ),
                    )),
                Step(
                  title: Text(
                    '비밀번호를 입력하세요.',
                    style: TextStyle(
                        color: _passwordKey.currentState?.validate() ?? true
                            ? data.value == 0
                                ? Colors.blue
                                : Colors.black
                            : Colors.red),
                  ),
                  content: Form(
                    key: _passwordKey,
                    child: Column(children: [
                      Obx(
                        () => textForm(TextFormType.password,
                            isObscure: controller.isPasswordObscure.value,
                            onObscureIconTap: () => {
                                  controller.isPasswordObscure(
                                      !controller.isPasswordObscure.value)
                                }),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      Obx(
                        () => textForm(TextFormType.passwordConfirm,
                            isObscure:
                                controller.isPasswordConfirmObscure.value,
                            onObscureIconTap: () => {
                                  controller.isPasswordConfirmObscure(
                                      !controller
                                          .isPasswordConfirmObscure.value)
                                }),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
        controller.stepperIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'sign_up'.tr,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: stepperBody());
  }
}