import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;

  const SmallText({
    super.key,
    required this.text,
    this.color = Colors.brown,
    this.size = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontFamily: 'Roboto', fontSize: size, overflow: TextOverflow.ellipsis),
    );
  }
}
