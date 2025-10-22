import 'package:flutter/material.dart';
import 'package:locabite/controller/meal_management_controller.dart';

void selectImageBottomSheet(BuildContext context, MealManagementController controller) {
  showBottomSheet(
    context: context,
    builder: (context) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt, color: Colors.blueAccent),
                title: const Text('Take Photo'),
                onTap: () => controller.selectImageFromCamera(),
              ),
              ListTile(
                leading: const Icon(
                  Icons.photo_library,
                  color: Colors.orangeAccent,
                ),
                title: const Text('Choose from Gallery'),
                onTap: () => controller.selectImageFromGallery(),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.close, color: Colors.redAccent),
                title: const Text('Cancel'),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      );
    },
  );
}
