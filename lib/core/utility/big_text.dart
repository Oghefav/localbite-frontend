import 'package:flutter/material.dart';
import 'package:locabite/core/utility/app_colours.dart';

class BigText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;

  const BigText({
    super.key,
    this.size = 24,
    this.color = AppColours.black,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
