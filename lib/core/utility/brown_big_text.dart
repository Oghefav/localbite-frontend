import 'package:flutter/material.dart';
import 'package:locabite/core/utility/app_colours.dart';

class BrownBigText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;

  const BrownBigText({
    super.key,
    this.size = 18,
    this.color = AppColours.darkbrown,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'roboto',
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
