import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? emailError;
  String? passwordError;

  bool _showPassword = false;
  bool get getShowPassword => _showPassword;
  set setShowPassword(bool value) {
    _showPassword = value;
    update();
  }

  void validatefields() {
    if (emailController.text.trim().isEmpty) {
      emailError = 'Email field is required';
    } else if (!GetUtils.isEmail(emailController.text.trim())) {
      emailError = 'Invalid email';
    } else {
      emailError = null;
    }
    passwordError =
        passwordController.text.trim().isEmpty
            ? 'Password field is required'
            : null;
    update();
  }
}
