import 'package:flutter/material.dart';
import 'package:locabite/routes/customer/Homepage/main_food_body_page.dart';
import 'package:locabite/core/utility/app_colours.dart';
import 'package:locabite/widgets/app_icon.dart';
import 'package:locabite/core/utility/big_text.dart';
import 'package:locabite/core/utility/demensions.dart';
import 'package:locabite/core/utility/small_text.dart';
import 'package:locabite/widgets/comment_widget.dart';

class MealDetail extends StatelessWidget {
  const MealDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.cream,
      body: Column(
        children: [
          SizedBox(height: Demensions.height35 * 1.3),
          Container(
            padding: EdgeInsets.only(
              left: Demensions.width10,
              right: Demensions.width10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back),
                Container(
                  child: Row(
                    children: [
                      Container(
                        height: Demensions.height15 * 2.5,
                        width: Demensions.width15 * 2.5,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/brandimage.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: Demensions.width15),
                      AppIcon(icon: Icons.favorite_border),
                      SizedBox(width: Demensions.width15),
                      Container(
                        // color: Colors.amber,
                        height: Demensions.height10 * 4,
                        width: Demensions.width80 / 2,
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: Demensions.height10 / 5,
                              child: AppIcon(
                                icon: Icons.shopping_cart_outlined,
                              ),
                            ),
                            Positioned(
                              top: Demensions.width10 / 5,
                              right: Demensions.width10 / 5,
                              child: Container(
                                height: Demensions.height10 * 2,
                                width: Demensions.width10 * 2,
                                decoration: BoxDecoration(
                                  color: AppColours.darkbrown,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: BigText(
                                    text: '20',
                                    color: AppColours.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: Demensions.height35),
          Container(
            height: Demensions.height100 * 2,
            width: Demensions.width100 * 2,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/food3.jfif'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(
              left: Demensions.width15,
              right: Demensions.width15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(text: "Ogbono Soup", size:   Demensions.fontSize10 * 3),
                SmallText(
                  text: 'By adslk;fajfalskjfkjdsakj',
                  size: Demensions.fontSize10,
                ),
                Row(
                  children: [
                    BigText(text: '34 reviews'),
                    SizedBox(width: Demensions.width80 * 1.8),
                    BigText(text: 'view all'),
                    SizedBox(width: Demensions.width15),
                    AppIcon(icon: Icons.arrow_forward_ios_rounded),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: Demensions.height10),
          Expanded(
            child: MediaQuery.removePadding(
              context: (context),
              removeTop: true,
              child: Align(
                child: Stack(
                  children: [
                    ListView.builder(
                      padding: EdgeInsets.only(
                        bottom: Demensions.height100 / 1.2,
                      ),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return CommentWidget();
                      },
                    ),
                    Positioned(
                      left: Demensions.width10,
                      bottom: Demensions.height10 * 4,
                      width: Demensions.width100,
                      child: Container(
                        height: Demensions.height100 / 2,
                        decoration: BoxDecoration(
                          color: AppColours.cream,
                          border: Border.all(
                            color: AppColours.darkbrown,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(
                            Demensions.radius15 * 2,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.remove, color: AppColours.darkbrown),
                            BigText(text: '1'),
                            Icon(Icons.add, color: AppColours.darkbrown),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: Demensions.width15,
                      bottom: Demensions.height10 * 40 ,
                      child: Container(
                        height: Demensions.height100 / 2,
                        width: Demensions.width220,
                        decoration: BoxDecoration(
                          color: AppColours.darkbrown,
                          borderRadius: BorderRadius.circular(
                            Demensions.radius15 * 2,
                          ),
                        ),
                        child: Center(
                          child: BigText(
                            text:
                                'Add to cart - ${MainFoodBody.currency(context).currencySymbol}11',
                            color: AppColours.lightBrown,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
