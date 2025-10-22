import 'package:flutter/material.dart';
import 'package:locabite/routes/customer/Homepage/main_food_body_page.dart';
import 'package:locabite/core/utility/app_colours.dart';
import 'package:locabite/core/utility/big_text.dart';
import 'package:locabite/core/utility/demensions.dart';
import 'package:locabite/core/utility/small_text.dart';
import 'package:locabite/widgets/app_icon.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.cream,
      body: Column(
        children: [
          SizedBox(height: Demensions.height15 * 3),
          Container(
            margin: EdgeInsets.symmetric(horizontal: Demensions.width10),
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back),
                BigText(text: 'Cart'),
                AppIcon(icon: Icons.delete),
              ],
            ),
          ),
          SizedBox(height: Demensions.height15,),
          Expanded(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      vertical: Demensions.height10,
                      horizontal: Demensions.width10,
                    ),
                    margin: EdgeInsets.only(
                      bottom: Demensions.height10,
                      left: Demensions.width10,
                      right: Demensions.width10,
                    ),
                    height: 130,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: AppColours.white,
                      borderRadius: BorderRadius.circular(
                        Demensions.radius10 * 2,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
              
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/images/food2.jpeg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: Demensions.width10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BigText(
                                text: 'Ogbono Soup',
                                size: Demensions.fontSize10 * 2,
                              ),
                              SizedBox(height: Demensions.height15),
                              SmallText(
                                text:
                                    'dslk;fakjfsdkjfajfdashfjdhlajAHLSJLHJAshjaj',
                              ),
                              SizedBox(height: Demensions.height15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  BigText(
                                    text:
                                        '${MainFoodBody.currency(context).currencySymbol} 2000',
                                    size: Demensions.fontSize10 * 1.5,
                                  ),
                                  Container(
                                    width: 100,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: AppColours.darkbrown,
                                            borderRadius: BorderRadius.circular(
                                              Demensions.radius10 / 2,
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.remove,
                                            color: AppColours.white,
                                          ),
                                        ),
                                        BigText(text: '20'),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: AppColours.darkbrown,
                                            borderRadius: BorderRadius.circular(
                                              Demensions.radius10 / 2,
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.add,
                                            color: AppColours.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            
            padding: EdgeInsets.symmetric(horizontal: Demensions.width15),
            decoration: BoxDecoration(
              color: AppColours.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(Demensions.width10 * 1), topRight: Radius.circular(Demensions.width10 * 1),)
            ),
            child: Stack(
              children: [
                Container(
                  height: 200,
                  width: double.maxFinite,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SmallText(text: 'Subtotal'),
                          BigText(
                            text:
                                '${MainFoodBody.currency(context).currencySymbol} 2000',
                          ),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Divider(
                        height: 4,
                        color: AppColours.darkbrown,
                      ),
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SmallText(text: 'Delivery fee'),
                          BigText(
                            text:
                                '${MainFoodBody.currency(context).currencySymbol} 400',
                          ),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Divider(
                        height: 4,
                        color: AppColours.darkbrown,
                      ),
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const BigText(text: 'Total',),
                          BigText(
                            text:
                                '${MainFoodBody.currency(context).currencySymbol} 2400',
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: Demensions.height10,
                  right: Demensions.width15 * 1.5 ,
                  left: Demensions.width15 * 1.5,
                  child: Container(
                    height: 40,
                    width: 300,
                    decoration: BoxDecoration(
                      color: AppColours.darkbrown,
                      borderRadius: BorderRadius.circular(Demensions.radius15 * 2)
                    ),
                    child: Center(child: BigText(text: 'Checkout - ${MainFoodBody.currency(context).currencySymbol} 2400', color: AppColours.white,)),
                  ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
