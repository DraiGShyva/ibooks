import 'package:flutter/material.dart';

class MyAppDiamondButton extends StatelessWidget {
  const MyAppDiamondButton({
    super.key,
    required this.onTap,
    required this.icon,
  });

  final void Function()? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 0.8,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Ink(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1.0,
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Transform.rotate(
            angle: -0.8,
            child: Icon(
              icon,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
