import 'package:flutter/material.dart';
import 'package:locabite/utility/app_colours.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color iconColor;
  final double iconSize;
  final Color backGroundColour;
  const AppIcon({
    super.key,
    required this.icon,
    this.size = 30,
    this.iconSize = 24,
    this.backGroundColour = AppColours.white,
    this.iconColor = AppColours.darkbrown,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: backGroundColour,
        borderRadius: BorderRadius.circular(size /2),
      ),
      child: Icon(icon, size: iconSize, color: iconColor),
    );
  }
}
