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
  static const double _largeSize = 20;
  static const double _mediumSize = 17;
  static const double _smallSize = 14;

  static const TextStyle largeBold =
      TextStyle(fontSize: _largeSize, fontWeight: FontWeight.bold);

  static const TextStyle mediumBold =
      TextStyle(fontSize: _mediumSize, fontWeight: FontWeight.bold);

  static const TextStyle smallBold =
      TextStyle(fontSize: _smallSize, fontWeight: FontWeight.bold);

  static const TextStyle large = TextStyle(fontSize: _largeSize);

  static const TextStyle medium = TextStyle(fontSize: _mediumSize);

  static const TextStyle small = TextStyle(fontSize: _smallSize);

  static const TextStyle largeGrey =
      TextStyle(fontSize: _largeSize, color: Colors.blueGrey);

  static const TextStyle mediumGrey =
      TextStyle(fontSize: _mediumSize, color: Colors.blueGrey);

  static const TextStyle smallGrey =
      TextStyle(fontSize: _smallSize, color: Colors.blueGrey);

  static const TextStyle largeBlue =
      TextStyle(fontSize: _largeSize, color: Color.fromARGB(255, 0, 152, 198));

  static const TextStyle mediumBlue =
      TextStyle(fontSize: _mediumSize, color: Color.fromARGB(255, 0, 152, 198));

  static const TextStyle smallBlue =
      TextStyle(fontSize: _smallSize, color: Color.fromARGB(255, 0, 152, 198));
}
