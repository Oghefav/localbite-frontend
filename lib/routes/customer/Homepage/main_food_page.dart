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
      backgroundColor: AppColours.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
              right: Demensions.width15,
              left: Demensions.width15,
              top: Demensions.height35,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(text: 'Hello 👋'),
                    BigText(text: 'Oghene Favour'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppIcon(
                      icon: Icons.search_outlined,
                      iconColor: Colors.black,
                    ),
                    SizedBox(width: Demensions.width15),
                    GestureDetector(
                      child: Container(
                        // color: Colors.amber,
                        height: 40,
                        width: 40,
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 5,
                              child: AppIcon(
                                icon: Icons.shopping_cart_outlined,
                                iconColor: Colors.black,
                              ),
                            ),
                            
                            Positioned(
                              right: 0,
                              top: 0,
                              child: Container(
                                height: 20,
                                width: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black 
                              ),
                              child: Center(child: Text('2', style: TextStyle(color: Colors.white),)),
                            )),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: Demensions.width15),
                    AppIcon(icon: Icons.notifications, iconColor: Colors.black),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: Demensions.height15),
          const MainFoodBody(),
        ],
      ),
    );
  }
}
