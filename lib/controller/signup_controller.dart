import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController brandNameController = TextEditingController();
  final TextEditingController vehicleLicenseNoController =
      TextEditingController();

  final passwordFocus = FocusNode();
  final nameFocus = FocusNode();
  final phoneFocus = FocusNode();
  final emailFocus = FocusNode();
  final confirmPasswordFocus = FocusNode();
  final brandNameFocus = FocusNode();
  final vehicleLicenseNoFocus = FocusNode();

  bool _showConfirmPassword = false;
  bool get getShowConfirmPassword => _showConfirmPassword;
  set setShowPassword(bool value) {
    _showPassword = value;
    update();
  }

  bool _showPassword = false;
  bool get getShowPassword => _showPassword;
  set setShowConfirmPassword(bool value) {
    _showConfirmPassword = value;
    update();
  }

  bool _isPasswordFocused = false;
  bool get getIsPasswordFocused => _isPasswordFocused;
  set isPasswordFocused(bool value) {
    _isPasswordFocused = value;
    update();
  }

  bool _isConfirmPasswordFocused = false;
  bool get getIsConfirmPasswordFocused => _isConfirmPasswordFocused;
  set setIsConfirmPasswordFocused(bool value) {
    _isConfirmPasswordFocused = value;
    update();
  }

  bool get hasMinLength => passwordController.text.length >= 8;
  bool get hasUpperCase => passwordController.text.contains(RegExp(r'[A-Z]'));
  bool get hasLowerCase => passwordController.text.contains(RegExp(r'[a-z]'));
  bool get hasSpecialCharacters =>
      passwordController.text.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  bool get hasDigits => passwordController.text.contains(RegExp(r'\d'));
  bool get passwordMatch =>
      passwordController.text == confirmPasswordController.text;
  bool get isConfirmPasswordEmpty => confirmPasswordController.text.isEmpty;

  @override
  void onInit() {
    super.onInit();
    passwordFocus.addListener(_handleFocusChange);
    nameFocus.addListener(_handleFocusChange);
    phoneFocus.addListener(_handleFocusChange);
    emailFocus.addListener(_handleFocusChange);
    confirmPasswordFocus.addListener(() {
      _handleFocusChange();
    });
    brandNameFocus.addListener(_handleFocusChange);
    vehicleLicenseNoFocus.addListener(_handleFocusChange);

    passwordController.addListener(update);
    confirmPasswordController.addListener(update);
    nameController.addListener(update);
    phoneController.addListener(update);
    emailController.addListener(update);
    emailController.addListener(update);
    brandNameController.addListener(update);
    vehicleLicenseNoController.addListener(update);
  }

  void _handleFocusChange() {
    isPasswordFocused = passwordFocus.hasFocus;
    _isConfirmPasswordFocused = confirmPasswordFocus.hasFocus;
    update();
  }

  String? nameError;
  String? emailError;
  String? phoneError;
  String? passwordError;
  String? confirmPasswordError;
  String? brandNameError;
  String? vehicleLicenseNoError;

  void validateName() {
    print(nameController.text);
    nameError =
        nameController.text.trim().isEmpty ? 'Name field is required' : null;
    update();
  }

  void validateVehicleLicenseNo() {
    vehicleLicenseNoError =
        vehicleLicenseNoController.text.trim().isEmpty
            ? 'vehicle License Number field is required'
            : null;
    update();
  }

  void validateBrandName() {
    brandNameError =
        brandNameController.text.trim().isEmpty
            ? 'Brand name field is required'
            : null;
    update();
  }

  void validateEmail() {
    if (emailController.text.trim().isEmpty) {
      print('email is empty');
      emailError = 'Email field is required';
    } else if (!GetUtils.isEmail(emailController.text.trim())) {
      emailError = 'Invalid email';
    } else {
      emailError = null;
    }
    update();
  }

  void validatePhone() {
    phoneError =
        phoneController.text.trim().isEmpty
            ? 'Phone number field is required'
            : null;
    update();
  }

  void validatePassword() {
    print(' password is $passwordController.text.trim()');
    if (passwordController.text.trim().isEmpty) {
      passwordError = 'Password field cannot be empty';
    } else if (!(hasDigits &&
        hasLowerCase &&
        hasMinLength &&
        hasSpecialCharacters &&
        hasUpperCase)) {
      passwordError = 'Password is not strong';
    } else {
      passwordError = null;
    }
    update();
  }

  void validateConfirmPassword() {
    if (confirmPasswordController.text.isEmpty) {
      confirmPasswordError = 'Please confirm your password';
    } else if (confirmPasswordController.text.trim() !=
        passwordController.text.trim()) {
      confirmPasswordError = 'Password do not match';
    } else {
      confirmPasswordError = null;
    }
    update();
  }

  @override
  void onClose() {
    super.onClose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    confirmPasswordController.dispose();
    passwordFocus.dispose();
    nameFocus.dispose();
    phoneFocus.dispose();
    emailFocus.dispose();
    confirmPasswordFocus.dispose();
    brandNameFocus.dispose();
    brandNameController.dispose();
    vehicleLicenseNoController.dispose();
    vehicleLicenseNoFocus.dispose();
  }
}
