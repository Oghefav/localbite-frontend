import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locabite/controller/signup_controller.dart';
import 'package:locabite/routes.dart';
import 'package:locabite/core/utility/app_colours.dart';
import 'package:locabite/core/utility/brown_big_text.dart';
import 'package:locabite/core/utility/brown_small_text.dart';
import 'package:locabite/core/utility/demensions.dart';

class CustomerSigupPage extends StatelessWidget {
  const CustomerSigupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
            child: SingleChildScrollView(

              child: GetBuilder<SignupController>(
                builder: (controller) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Demensions.height15 *2 ),
                      GestureDetector(
                        onTap: Get.back,
                        child: Icon(
                            Icons.arrow_back_ios_new,
                            color: AppColours.black,
                            size: Demensions.iconSize20,
                          ),
                      ),
                     
                      SizedBox(height: Demensions.height15),
                      BrownBigText(
                        text: 'Create account',
                        size: Demensions.fontSize10 * 4,
                      ),
                      // SizedBox(height: Demensions.height15),
                      BrownBigText(text: 'Name'),

                      // Name Field
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
                          controller: controller.nameController,
                          focusNode: controller.nameFocus,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your name',
                            hintStyle: TextStyle(),
                            errorText: controller.nameError,
                          ),
                        ),
                      ),
                      SizedBox(height: Demensions.height15),
                      BrownBigText(text: 'Phone number'),
                      // Controller Field
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
                          controller: controller.phoneController,
                          focusNode: controller.phoneFocus,
                          decoration: InputDecoration(
                            errorText: controller.phoneError,
                            border: InputBorder.none,
                            hintText: 'Enter your phone number',
                            hintStyle: TextStyle(),
                          ),
                        ),
                      ),
                      SizedBox(height: Demensions.height15),
                      BrownBigText(text: 'Email address'),
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
                          focusNode: controller.emailFocus,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your email address',
                            hintStyle: TextStyle(),
                            errorText: controller.emailError,
                          ),
                        ),
                      ),
                      SizedBox(height: Demensions.height15),
                      BrownBigText(text: 'Password'),
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
                          focusNode: controller.passwordFocus,
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
                      if (controller.getIsPasswordFocused == true)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  controller.hasMinLength
                                      ? Icons.check_circle
                                      : Icons.cancel,
                                  color:
                                      controller.hasMinLength
                                          ? Colors.green
                                          : Colors.red,
                                ),
                                SizedBox(width: Demensions.width10),
                                Text('contains  more than 7 characters'),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  controller.hasDigits
                                      ? Icons.check_circle
                                      : Icons.cancel,
                                  color:
                                      controller.hasDigits
                                          ? Colors.green
                                          : Colors.red,
                                ),
                                SizedBox(width: Demensions.width10),
                                Text('contains digits'),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  controller.hasLowerCase
                                      ? Icons.check_circle
                                      : Icons.cancel,
                                  color:
                                      controller.hasLowerCase
                                          ? Colors.green
                                          : Colors.red,
                                ),
                                SizedBox(width: Demensions.width10),
                                Text('contains lowercase letters'),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  controller.hasUpperCase
                                      ? Icons.check_circle
                                      : Icons.cancel,
                                  color:
                                      controller.hasUpperCase
                                          ? Colors.green
                                          : Colors.red,
                                ),
                                SizedBox(width: Demensions.width10),
                                Text(
                                  'contains uppercase letter',
                                  softWrap: true,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  controller.hasSpecialCharacters
                                      ? Icons.check_circle
                                      : Icons.cancel,
                                  color:
                                      controller.hasSpecialCharacters
                                          ? Colors.green
                                          : Colors.red,
                                ),
                                SizedBox(width: Demensions.width10),
                                Text(
                                  'contains special characters',
                                  softWrap: true,
                                ),
                              ],
                            ),
                          ],
                        ),

                      SizedBox(height: Demensions.height15),
                      BrownBigText(text: 'Confirm password'),
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
                          controller: controller.confirmPasswordController,
                          obscureText: !controller.getShowConfirmPassword,
                          focusNode: controller.confirmPasswordFocus,
                          decoration: InputDecoration(
                            errorText: controller.confirmPasswordError,
                            border: InputBorder.none,
                            hintText: 'confirm password',
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.setShowConfirmPassword =
                                    !controller.getShowConfirmPassword;
                              },
                              icon: Icon(
                                !controller.getShowConfirmPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (controller.getIsConfirmPasswordFocused &&
                          !controller.isConfirmPasswordEmpty)
                        Row(
                          children: [
                            Icon(
                              controller.passwordMatch
                                  ? Icons.check_circle
                                  : Icons.cancel,
                              color:
                                  controller.passwordMatch
                                      ? Colors.green
                                      : Colors.red,
                            ),
                            SizedBox(width: Demensions.width10),
                            Text('passwords match'),
                          ],
                        ),
                      SizedBox(height: Demensions.height15 * 2),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            controller.validateName();
                            controller.validatePhone();
                            controller.validateEmail();
                            controller.validatePassword();
                            controller.validateConfirmPassword();

                            if ((controller.nameError == null &&
                                controller.emailError == null &&
                                controller.phoneError == null &&
                                controller.confirmPasswordError == null &&
                                controller.passwordError == null)) {
                              print('correct');
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
                              child: BrownBigText(
                                text: 'Sign up',
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
                          BrownSmallText(text: 'Already have an account?'),
                          GestureDetector(
                            onTap: () => Get.toNamed(AppRoute.getLoginPage()),
                            child: BrownBigText(text: 'Sign in')),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
