import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locabite/routes.dart';
import 'package:locabite/core/utility/app_colours.dart';
import 'package:locabite/core/utility/demensions.dart';
import 'package:locabite/core/utility/brown_big_text.dart';

class RolePage extends StatelessWidget {
  const RolePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/images/food5.jpg'),
                fit: BoxFit.cover,
              ),
              color: AppColours.darkbrown,
            ),
          ),
          Container(color: Color.fromARGB(180, 218, 201, 189)),
          Positioned(
            top: 40,
            left: 15,
            child: GestureDetector(
              onTap: () => Get.toNamed(AppRoute.getSplashPage()),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: AppColours.darkbrown,
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 55,
            child: const BrownBigText(text: 'Select role', size: 50),
          ),
          Center(
            child: Container(
              height: 500,
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 300,
                    height: 100,
                    padding: EdgeInsets.only(right: Demensions.width80 / 1.7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Demensions.radius15),
                      color: AppColours.white,
                    ),
                    child: GestureDetector(
                      onTap: () => Get.toNamed(AppRoute.getCustomerSignUpPage()),
                      child: Row(
                        children: [
                          Icon(
                            Icons.person,
                            size: 100,
                            color: AppColours.darkbrown,
                          ),
                          SizedBox(width: Demensions.width15 * 2.5),
                          BrownBigText(
                            text: 'Customer',
                            size: Demensions.fontSize10 * 2.5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // chef section
                  GestureDetector(
                    onTap: () => Get.toNamed(AppRoute.getChefSignUpPage()),
                    child: Container(
                      height: 100,
                      width: 300,
                      padding: EdgeInsets.only(right: Demensions.width80),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Demensions.radius15),
                        color: AppColours.white,
                      ),
                      child: Row(
                        children: [
                          Image(
                            image: const AssetImage('assets/images/chefhat.png'),
                            color: AppColours.darkbrown,
                          ),
                          SizedBox(width: Demensions.width15 * 2.5),
                          BrownBigText(
                            text: 'Chef',
                            size: Demensions.fontSize10 * 2.5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // driver section
                  GestureDetector(
                    onTap: () => Get.toNamed(AppRoute.getDriverSignUpPage()),
                    child: Container(
                      height: 100,
                      width: 300,
                      padding: EdgeInsets.only(right: Demensions.width80),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Demensions.radius15),
                        color: AppColours.white,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.local_taxi,
                            size: 100,
                            color: AppColours.darkbrown,
                          ),
                          SizedBox(width: Demensions.width15 * 2.5),
                          BrownBigText(
                            text: 'Driver',
                            size: Demensions.fontSize10 * 2.5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
