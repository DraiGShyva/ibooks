import 'package:flutter/material.dart';

class MyAppText extends StatelessWidget {
  const MyAppText({
    super.key,
    required this.text,
    this.style = MyAppTextStyles.medium,
    this.maxLines = 1,
    this.overflow = false,
    this.textAlign,
  });

  final String text;
  final TextStyle style;
  final int maxLines;
  final bool overflow;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      maxLines: maxLines,
      overflow: overflow ? TextOverflow.ellipsis : null,
      textAlign: textAlign,
    );
  }
}

class MyAppTextStyles {
  static const double largeSize = 20;
  static const double mediumSize = 17;
  static const double smallSize = 14;

  static const TextStyle largeBold =
      TextStyle(fontSize: largeSize, fontWeight: FontWeight.bold);

  static const TextStyle mediumBold =
      TextStyle(fontSize: mediumSize, fontWeight: FontWeight.bold);

  static const TextStyle smallBold =
      TextStyle(fontSize: smallSize, fontWeight: FontWeight.bold);

  static const TextStyle large = TextStyle(fontSize: largeSize);

  static const TextStyle medium = TextStyle(fontSize: mediumSize);

  static const TextStyle small = TextStyle(fontSize: smallSize);

  static const TextStyle largeGrey =
      TextStyle(fontSize: largeSize, color: Colors.blueGrey);

  static const TextStyle mediumGrey =
      TextStyle(fontSize: mediumSize, color: Colors.blueGrey);

  static const TextStyle smallGrey =
      TextStyle(fontSize: smallSize, color: Colors.blueGrey);

  static const TextStyle largeBlue =
      TextStyle(fontSize: largeSize, color: Color.fromARGB(255, 0, 152, 198));

  static const TextStyle mediumBlue =
      TextStyle(fontSize: mediumSize, color: Color.fromARGB(255, 0, 152, 198));

  static const TextStyle smallBlue =
      TextStyle(fontSize: smallSize, color: Color.fromARGB(255, 0, 152, 198));
}
