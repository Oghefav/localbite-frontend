import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:locabite/controller/splash_controller.dart';
import 'package:locabite/core/utility/check_location.dart';
import 'package:locabite/routes.dart';
import 'package:locabite/core/utility/app_colours.dart';
import 'package:locabite/core/utility/big_text.dart';
import 'package:locabite/core/utility/demensions.dart';
import 'package:locabite/core/utility/brown_big_text.dart';
import 'package:locabite/core/utility/brown_small_text.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  


  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) {
        checkLocation(context);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColours.cream,
          body: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('assets/images/food5.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(color: Color.fromARGB(180, 218, 201, 189)),
              Positioned(
                left: 15,
                bottom: 190,
                child: Text(
                  'Locabite',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 70,
                    fontFamily: 'Welcome',
                    color: AppColours.darkbrown,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Positioned(
                left: 10,
                bottom: 180,
                child: Text(
                  'Bringing local flavors to your fingertips',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                    fontFamily: 'Welcome',
                    color: AppColours.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Positioned(
                bottom: 60,
                left: 50,
                right: 50,
                child: GestureDetector(
                  onTap: () => Get.toNamed(AppRoute.getLoginPage()),
                  child: Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Demensions.radius15),
                      color: AppColours.darkbrown,
                    ),
                    child: Center(
                      child: BigText(text: 'Sign in', color: AppColours.cream),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 70,
                right: 50,
                child: Row(
                  children: [
                    BrownSmallText(
                      text: 'Don\'t have an account?',
                      color: AppColours.lightBrown,
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed(AppRoute.getRolePage()),
                      child: BrownBigText(text: 'Sign Up'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
