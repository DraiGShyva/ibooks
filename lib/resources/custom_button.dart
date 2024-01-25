import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final Function()? onPressed;
  const CustomButton({
    super.key,
    required this.name,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
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
                blurRadius: 5,
                color: Color.fromARGB(200, 0, 20, 150),
              ),
            ],
          ),
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(100),
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 0, 152, 198),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
