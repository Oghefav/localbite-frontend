import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locabite/controller/Login_controller.dart';
import 'package:locabite/routes.dart';
import 'package:locabite/utility/app_colours.dart';
import 'package:locabite/utility/big_text.dart';
import 'package:locabite/utility/demensions.dart';
import 'package:locabite/utility/small_text.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.cream,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/food5.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(color: Color.fromARGB(180, 218, 201, 189)),
          Container(
            padding: EdgeInsets.all(Demensions.width15),
            width: double.maxFinite,
            child: GetBuilder<LoginController>(
              builder: (controller) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: Demensions.height15 * 2),
                    GestureDetector(
                      onTap: Get.back,
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: AppColours.black,
                        size: Demensions.iconSize20,
                      ),
                    ),
                    SizedBox(height: Demensions.height15),
                    BigText(text: 'Login', size: Demensions.fontSize10 * 4),
                    BigText(text: 'Email'),

                    // Email Field
                    Container(
                      padding: EdgeInsets.only(left: Demensions.width10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColours.darkbrown,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(
                          Demensions.radius15,
                        ),
                      ),
                      child: TextField(
                        controller: controller.emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your email address',
                          hintStyle: TextStyle(),
                          errorText: controller.emailError,
                        ),
                      ),
                    ),
                    SizedBox(height: Demensions.height15),
                    BigText(text: 'Password'),
                    Container(
                      padding: EdgeInsets.only(left: Demensions.width10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColours.darkbrown,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(
                          Demensions.radius15,
                        ),
                      ),
                      child: TextField(
                        controller: controller.passwordController,
                        obscureText: !controller.getShowPassword,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          errorText: controller.passwordError,
                          hintText: 'Enter a strong password',
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.setShowPassword =
                                  !controller.getShowPassword;
                            },
                            icon: Icon(
                              !controller.getShowPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: Demensions.height35),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          controller.validatefields();

                          if ((controller.emailError == null &&
                              controller.passwordError == null)) {
                            Get.toNamed(AppRoute.getChefHomePage());
                          } else {
                            print('not correct');
                          }
                        },
                        child: Container(
                          height: Demensions.height100 / 2,
                          width: Demensions.width100 * 3,
                          decoration: BoxDecoration(
                            color: AppColours.darkbrown,
                            borderRadius: BorderRadius.circular(
                              Demensions.radius10,
                            ),
                          ),
                          child: Center(
                            child: BigText(
                              text: 'Sign in',
                              color: AppColours.white,
                              size: Demensions.fontSize10 * 2,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: Demensions.height10),
                    Row(
                      children: [
                        SizedBox(width: Demensions.width15 * 3),
                        SmallText(text: 'Don\'t have an account?'),
                        GestureDetector(
                          onTap: () => Get.toNamed(AppRoute.getRolePage()),
                          child: BigText(text: 'Sign Up'),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
