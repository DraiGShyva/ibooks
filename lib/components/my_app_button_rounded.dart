import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/app_controller.dart';
import 'package:myapp/utils/colors.dart';

class MyAppRoundedButton extends StatelessWidget {
  MyAppRoundedButton({
    super.key,
    required this.child,
    required this.onPressed,
  });

  final Widget child;
  final Function()? onPressed;
  final Color bgColor = Get.put(AppController()).isDarkMode.value
      ? MyAppColors.blueGrey
      : MyAppColors.white;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: MyAppColors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(100),
          child: Ink(
            decoration: BoxDecoration(
              color: bgColor,
              border: Border.all(
                color: const Color.fromARGB(41, 93, 93, 255),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(100),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 2,
                  color: Color.fromARGB(93, 0, 20, 150),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
