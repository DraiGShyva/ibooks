import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/my_app_text.dart';
import 'package:myapp/controller/app_controller.dart';
import 'package:myapp/utils/route.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appController = Get.put(AppController());
    return Scaffold(
      appBar: AppBar(actions: [
        TextButton(
          onPressed: () {
            appController.isFirstRun.value = false;
            appController.saveFirstRun();
            Navigator.pushNamedAndRemoveUntil(
              context,
              LOGIN,
              (route) => false,
            );
          },
          child: const MyAppText(text: 'Cancel'),
        ),
        const SizedBox(width: 10),
      ]),
      body: const Center(
        child: Text('Onboarding Page'),
      ),
    );
  }
}
