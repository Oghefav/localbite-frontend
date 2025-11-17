import 'package:flutter/cupertino.dart';
import 'package:locabite/core/utility/demensions.dart';
import 'package:locabite/widgets/comment_widget.dart';

class ReviewsWidget extends StatelessWidget {
  const ReviewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: Demensions.height100 / 1.2),
      itemCount: 4,
      itemBuilder: (context, index) {
        return CommentWidget();
      },
    );
  }
}
