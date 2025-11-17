import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locabite/core/utility/big_text.dart';
import 'package:locabite/widgets/reviews_widget.dart';

class AllReviewsPage extends StatelessWidget {
  const AllReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BigText(text: "Reviews"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: ReviewsWidget()
    );
  }
}
