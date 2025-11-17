import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locabite/data/models/meal.dart';
import 'package:locabite/core/utility/app_colours.dart';
import 'package:locabite/routes.dart';
import 'package:locabite/widgets/app_icon.dart';
import 'package:locabite/core/utility/big_text.dart';
import 'package:locabite/core/utility/demensions.dart';
import 'package:locabite/core/utility/small_text.dart';
import 'package:locabite/widgets/reviews_widget.dart';

class MealDetailPage extends StatelessWidget {
  final Meal meal = Get.arguments;
 MealDetailPage({super.key,});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
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
              IconButton(onPressed: () => Get.back(),icon: Icon(Icons.arrow_back_ios,),),
                SizedBox(
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
                      SizedBox(
                        height: Demensions.height10 * 4,
                        width: Demensions.width80 / 2,
                        child: GestureDetector(
                          onTap: () => Get.toNamed(AppRoute.cartPage),
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
                                    color: AppColours.green,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                       '2',
                                      style: TextStyle(color: AppColours.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                image: AssetImage(meal.image!),
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
                BigText(text: meal.title!, size: Demensions.fontSize10 * 3),
                SmallText(
                  text: 'By ${meal.chef}',
                  size: Demensions.fontSize10,
                ),
                Row(
                  children: [
                    BigText(text: '34 reviews', size: Demensions.fontSize10 * 2,),
                    SizedBox(width: Demensions.width80 * 2.2),
                        GestureDetector(
                          onTap: () => Get.toNamed(AppRoute.allReviewsPage),
                          child: Text('View all', style: TextStyle(color: Colors.blue.shade500),)),
                    
                  
                  ]
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
                    ReviewsWidget(),
                    Positioned(
                      left: Demensions.width10,
                      bottom: Demensions.height10 * 4,
                      width: Demensions.width100,
                      child: Container(
                        height: Demensions.height100 / 2,
                        decoration: BoxDecoration(
                          color: AppColours.white,
                          border: Border.all(
                            color: AppColours.blue.shade500,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(
                            Demensions.radius15 * 2,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.remove, color: AppColours.black),
                            BigText(text: '1'),
                            Icon(Icons.add, color: AppColours.black),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: Demensions.width15,
                      bottom: Demensions.height10 * 4,
                      child: Container(
                        height: Demensions.height100 / 2,
                        width: Demensions.width220,
                        decoration: BoxDecoration(
                          color: AppColours.blue.shade500,
                          borderRadius: BorderRadius.circular(
                            Demensions.radius15 * 2,
                          ),
                        ),
                        child: Center(
                          child: BigText(
                            text:
                                'Add to cart - 11',
                            color: AppColours.white,
                            // size: Demensions.fontSize10,
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
