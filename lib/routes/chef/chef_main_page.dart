import 'package:flutter/material.dart';
import 'package:locabite/routes/customer/Homepage/main_food_body_page.dart';
import 'package:locabite/utility/app_colours.dart';
import 'package:locabite/utility/big_text.dart';
import 'package:locabite/utility/demensions.dart';
import 'package:locabite/utility/small_text.dart';
import 'package:locabite/widgets/app_icon.dart';

class ChefMainPage extends StatelessWidget {
  const ChefMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: Demensions.height35 * 1.5),
          Container(
            margin: EdgeInsets.only(left: Demensions.width10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: 'Chef Dashboard'),
                    SmallText(text: 'Hi Favour, welcome back'),
                  ],
                ),
                AppIcon(icon: Icons.notifications),
              ],
            ),
          ),
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.all(Demensions.width15),
            decoration: BoxDecoration(
              color: AppColours.cream,
              borderRadius: BorderRadius.circular(Demensions.radius15),
            ),
            height: 80,
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 80,
                  decoration: BoxDecoration(
                    color: AppColours.darkbrown,
                    borderRadius: BorderRadius.circular(Demensions.radius15),
                  ),
                  child: Icon(
                    Icons.monetization_on,
                    size: Demensions.iconSize20 * 4,
                    color: AppColours.white,
                  ),
                ),
                SizedBox(width: Demensions.width10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BigText(text: 'Total sales', color: AppColours.lightBrown),
                    BigText(
                      text:
                          '${MainFoodBody.currency(context).currencySymbol}5000 ',
                      size: Demensions.fontSize10 * 3,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.all(Demensions.width15),
            decoration: BoxDecoration(
              color: AppColours.cream,
              borderRadius: BorderRadius.circular(Demensions.radius15),
            ),
            height: 80,
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 80,
                  decoration: BoxDecoration(
                    color: AppColours.darkbrown,
                    borderRadius: BorderRadius.circular(Demensions.radius15),
                  ),
                  child: Icon(
                    Icons.receipt_long,
                    size: Demensions.iconSize20 * 4,
                    color: AppColours.white,
                  ),
                ),
                SizedBox(width: Demensions.width10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BigText(text: 'Total orders', color: AppColours.lightBrown),
                    BigText(text: '100 ', size: Demensions.fontSize10 * 3),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: Demensions.height15),
          Container(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 80,
                  width: 140,
                  padding: EdgeInsets.all(Demensions.width15 / 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Demensions.radius10),
                    color: AppColours.cream,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppIcon(icon: Icons.add),
                      SmallText(text: 'Add Meal'),
                    ],
                  ),
                ),
                Container(
                  height: 80,
                  width: 140,
                  padding: EdgeInsets.all(Demensions.width15 / 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Demensions.radius10),
                    color: AppColours.cream,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppIcon(icon: Icons.shop_sharp),
                      SmallText(text: 'View Orders'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: Demensions.height15),
          Container(
            margin: EdgeInsets.only(
              left: Demensions.width10,
              right: Demensions.width10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BigText(text: 'Recent order'),
                Row(
                  children: [
                    SmallText(text: 'See all'),
                    AppIcon(icon: Icons.arrow_forward_ios_rounded),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 290,
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, int index) {
                return Container(
                  height: 60,
                  margin: EdgeInsets.all(Demensions.width10),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: Demensions.radius15 * 2,
                        child: Image.asset(
                          'assets/images/food2.jpeg',
                          fit: BoxFit.fill,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BigText(text: 'Ogbono suop'),
                          SmallText(text: '35 mins age'),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BigText(
                            text:
                                '${MainFoodBody.currency(context).currencySymbol } 22 ',
                          ),
                          SmallText(text: 'Recieved')
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
