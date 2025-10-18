import 'package:flutter/material.dart';
import 'package:locabite/utility/app_colours.dart';

class BigText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;

  const BigText({
    super.key,
    this.size = 16,
    this.color = AppColours.darkbrown,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontFamily: "Roboto",
        fontSize: size,
        fontWeight: FontWeight.bold
      ),
    );
  }
}
