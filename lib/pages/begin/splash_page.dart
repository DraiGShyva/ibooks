import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibooks/controller/app_controller.dart';
import 'package:ibooks/utils/local_image.dart';
import 'package:ibooks/utils/route.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _appController = Get.put(AppController());

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      if (_appController.isFirstRun.value) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          ONBOARDING,
          (route) => false,
        );
      } else if (_appController.authenKey.value == '') {
        Navigator.pushNamedAndRemoveUntil(
          context,
          LOGIN,
          (route) => false,
        );
      } else {
        Navigator.pushNamedAndRemoveUntil(
          context,
          HOME,
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 125, 18),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(SPLASH_IMG), fit: BoxFit.contain)),
        ),
      ),
    );
  }
}
