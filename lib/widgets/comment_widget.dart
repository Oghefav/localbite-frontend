import 'package:flutter/material.dart';
import 'package:locabite/core/utility/app_colours.dart';
import 'package:locabite/core/utility/big_text.dart';
import 'package:locabite/core/utility/demensions.dart';
import 'package:locabite/core/utility/small_text.dart';
import 'package:locabite/widgets/star_widget.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: Demensions.width10,
        right: Demensions.width10,
        top: Demensions.height10,
        bottom: Demensions.height10 / 2,
      ),
      margin: EdgeInsets.only(bottom: Demensions.height10, left: Demensions.width10, right: Demensions.width10 ),
      height: 130,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Demensions.radius15 * 2),
        color: AppColours.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StarWidget(rating: 3),
              SmallText(text: '2024-08-7 11:45pm', size: Demensions.fontSize10),
            ],
          ),
          SizedBox(height: Demensions.height10),
          Text(
            'this meal is very nutritiousjasdhfljkhjakhjadshfjfhadskajfladfkjf;dkljkjskjkdasjkdsjasdkljalkjdaskljdskl jhfalsjkdhkjadsfhljkfhajkahfjfdashlfadjks',
            style: TextStyle(
              color: AppColours.black,
              fontSize: Demensions.fontSize10 * 1.2,
            ),
            softWrap: true,
          ),
          SizedBox(height: Demensions.height10 * 0.8,),
          BigText(text: ' By Oghene Favour', size: Demensions.fontSize10 * 1.5,)
        ],
      ),
    );
  }
}
