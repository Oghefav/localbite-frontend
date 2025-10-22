import 'package:flutter/material.dart';

class BrownSmallText extends StatelessWidget {
  final String text;
  final double size;
  final Color? color;

  const BrownSmallText({
    super.key,
    required this.text,
    this.color = Colors.brown,
    this.size = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
    
      style: TextStyle(
        fontFamily: 'roboto',
        color: color, fontSize: size, overflow: TextOverflow.ellipsis, fontWeight: FontWeight.w500),
    );
  }
}
