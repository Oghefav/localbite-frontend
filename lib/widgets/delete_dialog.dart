import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locabite/controller/meal_management_controller.dart';
import 'package:locabite/data/models/meal.dart';

void showDeleteDialog(
  Meal meal,
  BuildContext context,
  MealManagementController controller,
) {
  showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          content: Text(
            'Are you sure you want to delete ${meal.title} from your menu?',
          ),
          actions: [
            TextButton(onPressed: () => Get.back(), child: Text('cancel')),
            ElevatedButton(
              onPressed: () {
                controller.deleteMeal(meal);
                Get.back();
              },
              child: Text(
                'Yes, I\'m sure.',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
  );
}
