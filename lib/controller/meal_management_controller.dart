import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:locabite/data/models/meal.dart';
import 'package:locabite/data/repositories/meals.dart';

class MealManagementController extends GetxController {
  final TextEditingController mealNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController unitsController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  File? _image;
  XFile? _pickedImage;
  XFile? get pickedImage => _pickedImage;
  bool _isAvaliable = true;

   List<Meal> availableMeals = meals;

  bool? _isFieldsvalid;
  bool? get isFieldValid => _isFieldsvalid;

  final ImagePicker _picker = ImagePicker();

  @override
  void onIint() {
    super.onInit();
   
  }

  Future<void> selectImageFromCamera() async {
    _pickedImage = await _picker.pickImage(source: ImageSource.camera);
    if (_pickedImage != null) {
      _image = File(_pickedImage!.path);
      update();
    }
  }

  Future<void> selectImageFromGallery() async {
    _pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (_pickedImage != null) {
      _image = File(_pickedImage!.path);
      update();
    }
  }

  File? get getImage => _image;

  String? mealNameValidator(String value) {
    if (value.isEmpty) {
      return 'Meal name is required';
    } else {
      return null;
    }
  }

  bool get isAvaliable => _isAvaliable;

  void changedSwitch(Meal meal, bool value) {
    meal.availabilityStatus = value;
    update();
  }

  void validatefields() {
    if (mealNameController.text.trim().isEmpty) {
      _isFieldsvalid = false;
    } else if (descriptionController.text.isEmpty) {
      _isFieldsvalid = false;
    } else if (_pickedImage.isBlank!) {
      _isFieldsvalid = false;
    } else if (priceController.value.isBlank!) {
      _isFieldsvalid = false;
    } else if (unitsController.value.isBlank!) {
      _isFieldsvalid = false;
    } else {
      _isFieldsvalid = true;
    }
    update();
  }

  void changeImage(String? mealImage) {
    mealImage = null;
    update();
  }

  void deleteMeal(Meal meal) {
    meals.remove(meal);
    update();
  }
}
