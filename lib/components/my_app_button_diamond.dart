import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibooks/controller/app_controller.dart';
import 'package:ibooks/utils/colors.dart';

class MyAppDiamondButton extends StatelessWidget {
  MyAppDiamondButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  final void Function()? onPressed;
  final IconData icon;
  final Color bgColor = Get.put(AppController()).isDarkMode.value
      ? MyAppColors.blueGrey
      : MyAppColors.white;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 0.8,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(10),
        child: Ink(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: MyAppColors.black.withOpacity(0.1),
                spreadRadius: 1.0,
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Transform.rotate(
            angle: -0.8,
            child: Icon(
              icon,
              color: MyAppColors.blueAccent,
            ),
          ),
        ),
      ),
    );
  }
}
