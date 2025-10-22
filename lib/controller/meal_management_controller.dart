import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MealManagementController extends GetxController {
  final TextEditingController mealNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController mealNamecontroller = TextEditingController();
  final TextEditingController unitsController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  File? _image;
  XFile? _pickedImage;

  final ImagePicker _picker = ImagePicker();

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
}
