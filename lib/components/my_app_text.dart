import 'package:flutter/material.dart';

class MyAppText extends StatelessWidget {
  const MyAppText({
    super.key,
    required this.text,
    this.style = MyAppTextStyles.medium,
    this.maxLines = 1,
    this.overflow = false,
  });

  final String text;
  final TextStyle style;
  final int maxLines;
  final bool overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      maxLines: maxLines,
      overflow: overflow ? TextOverflow.ellipsis : null,
    );
  }
}

class MyAppTextStyles {
  static const TextStyle largeBold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle mediumBold = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle smallBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle large = TextStyle(
    fontSize: 20,
  );

  static const TextStyle medium = TextStyle(
    fontSize: 17,
  );

  static const TextStyle small = TextStyle(
    fontSize: 14,
  );

  static const TextStyle largeGrey = TextStyle(
    fontSize: 20,
    color: Colors.grey,
  );

  static const TextStyle mediumGrey = TextStyle(
    fontSize: 17,
    color: Colors.grey,
  );

  static const TextStyle smallGrey = TextStyle(
    fontSize: 14,
    color: Colors.grey,
  );
}
