import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text;
  final double size;
  final Color? color;

  const SmallText({
    super.key,
    required this.text,
    this.color = Colors.grey,
    this.size = 11,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size, overflow: TextOverflow.ellipsis, fontWeight: FontWeight.w500),
    );
  }
}
