import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locabite/controller/meal_management_controller.dart';
import 'package:locabite/core/theme/input_theme.dart';
import 'package:locabite/core/utility/big_text.dart';
import 'package:locabite/core/utility/demensions.dart';
import 'package:locabite/core/utility/app_colours.dart';
import 'package:locabite/widgets/custom_image_picker.dart';

class AddMealPage extends StatelessWidget {
  const AddMealPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _addMealFormKey = GlobalKey<FormState>();
    final controller = Get.put(MealManagementController());
    return Scaffold(
      appBar: AppBar(title: BigText(text: 'Add meal'), centerTitle: true),
      body: SingleChildScrollView(
        child: GetBuilder<MealManagementController>(
          builder: (controller) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: Demensions.width15),
              child: Form(
                key: _addMealFormKey,
                child: Column(
                  children: [
                    SizedBox(height: Demensions.height15 * 2),
                    CustomImagePicker(),
                    SizedBox(height: Demensions.height15 * 2),
                    TextFormField(
                      validator:
                          (value) =>
                              value!.isEmpty ? 'Meal name is required' : null,
                      controller: controller.mealNameController,
                      decoration: customInputDecoration(
                        hintText: 'e.g Ogbono soup',
                        labelText: 'Meal Name',
                      ),
                    ),
                    SizedBox(height: Demensions.height15),
                    TextFormField(
                      maxLines: 5,
                      controller: controller.descriptionController,
                      validator:
                          (value) =>
                              value!.isEmpty
                                  ? 'Meal description is required'
                                  : null,
                      decoration: customInputDecoration(
                        hintText: 'Enter a short description of the meal',
                        labelText: 'Description',
                        alignLabelWithHint: true,
                      ),
                    ),
                    SizedBox(height: Demensions.height15),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: controller.priceController,
                      validator:
                          (value) =>
                              value!.isEmpty ? 'Meal price is required' : null,
                      decoration: customInputDecoration(
                        hintText: '2000',
                        prefixText: '₦',
                        labelText: 'Price(₦)',
                      ),
                    ),
                    SizedBox(height: Demensions.height15),
                    TextFormField(
                      validator:
                          (value) =>
                              value!.isEmpty ? 'Meal units is required' : null,
                      keyboardType: TextInputType.number,
                      controller: controller.unitsController,
                      decoration: customInputDecoration(
                        hintText: 'eg 1,2, 3',
                        labelText: 'Units',
                      ),
                    ),
                    SizedBox(height: Demensions.height15 * 4),

                    GestureDetector(
                      onTap: () {
                        _addMealFormKey.currentState!.validate();
                        if (controller.pickedImage == null) {
                          Get.snackbar('Error', 'Meal image is reqired');
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            Demensions.radius15 * 2,
                          ),
                          color: AppColours.blue.shade500,
                        ),
                        child: Center(
                          child: BigText(text: 'Add', color: AppColours.cream),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
