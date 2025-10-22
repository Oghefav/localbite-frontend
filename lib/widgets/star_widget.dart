import 'package:flutter/material.dart';
import 'package:locabite/core/utility/app_colours.dart';

class StarWidget extends StatelessWidget {
  final int rating;
  final int maxRating;
  final double size;

  const StarWidget({
    super.key,
    required this.rating,
    this.maxRating = 5,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Wrap(
          children: List.generate(maxRating, (int index) {
            if (index < rating) {
              return Icon(Icons.star, color: AppColours.darkbrown);
            } else {
              return Icon(Icons.star_border, color: AppColours.darkbrown);
            }
          }),
        ),
      ],
    );
  }
}
