import 'package:flutter/material.dart';
import 'package:myapp/components/my_app_text.dart';

class MyAppRoundedButton extends StatelessWidget {
  const MyAppRoundedButton({
    super.key,
    required this.name,
    required this.onPressed,
  });

  final String name;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(100),
          child: Ink(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 231, 250, 255),
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
            child: MyAppText(
              text: name,
              style: MyAppTextStyles.mediumBlue,
            ),
          ),
        ),
      ),
    );
  }
}
