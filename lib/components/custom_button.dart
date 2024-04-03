import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.name,
    required this.onPressed,
  });

  final String name;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: ElevatedButton(
        onPressed: onPressed,
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
    );
  }
}
