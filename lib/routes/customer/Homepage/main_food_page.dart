import 'package:flutter/material.dart';
import 'package:locabite/routes/customer/Homepage/main_food_body_page.dart';
import 'package:locabite/core/utility/app_colours.dart';
import 'package:locabite/widgets/app_icon.dart';
import 'package:locabite/core/utility/big_text.dart';
import 'package:locabite/core/utility/demensions.dart';
import 'package:locabite/core/utility/small_text.dart';

class MainFoodPage extends StatelessWidget {
  const MainFoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.cream,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Container(
            margin:  EdgeInsets.only(right: Demensions.width15, left: Demensions.width15, top: Demensions.height35,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(text: 'Hello 👋'),
                    BigText(text: 'Oghene Favour')
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    AppIcon(icon: Icons.search_outlined,),
                    SizedBox(width: Demensions.width15,),
                    AppIcon(icon: Icons.notifications)
                  ],
                )
              ],
            ),),
            SizedBox(height: Demensions.height15,),
            const MainFoodBody()
        ],
      )
    );
  }
}