import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final NotchBottomBarController? controller;

  const HomePage({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Center(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            controller?.jumpTo(2);
          },
          child: const Text('Page 1'),
        ),
      ),
    );
  }
}
