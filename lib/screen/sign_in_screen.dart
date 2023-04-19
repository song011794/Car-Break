import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/sign_in_controller.dart';

class SignInScreen extends GetView<SignInController> {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ObxValue(
          (data) => Stepper(
                currentStep: data.value,
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
                    title: const Text('Step 1 title'),
                    content: Container(
                        alignment: Alignment.centerLeft,
                        child: const Text('Content for Step 1')),
                  ),
                  const Step(
                    title: Text('Step 2 title'),
                    content: Text('Content for Step 2'),
                  ),
                ],
              ),
          controller.stepperIndex),
    );
  }
}
