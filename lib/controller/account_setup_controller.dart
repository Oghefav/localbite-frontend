import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountSetupController extends GetxController {
  final TextEditingController accountNoController = TextEditingController();
  final TextEditingController accountNameController = TextEditingController();

  String? accountNoError;
  String? accountNameError;

  void validatefields() {
    try {
      int.parse(accountNoController.text.trim());
    } catch (e) {
      accountNoError = 'Invalid account number';
    }
    if (accountNameController.text.trim().isEmpty) {
      accountNameError = 'Account Name field is required';
    } else if (accountNoController.text.trim().isEmpty) {
      accountNoError = 'Account number field is required';
    } else if (accountNoController.text.trim().length != 10) {
      accountNoError = 'Invalid account number';
    } else {
      accountNameError = null;
      accountNoError = null;
    }

    update();
  }
}
