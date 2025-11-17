import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/utils.dart';
import 'package:locabite/controller/meal_management_controller.dart';
import 'package:locabite/core/theme/input_theme.dart';
import 'package:locabite/core/utility/app_colours.dart';
import 'package:locabite/core/utility/big_text.dart';
import 'package:locabite/core/utility/demensions.dart';
import 'package:locabite/data/models/meal.dart';
import 'package:locabite/widgets/custom_image_picker.dart';

class EditMealPage extends StatelessWidget {
  final Meal meal = Get.arguments;
  EditMealPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _editMealFormKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: BigText(text: 'Edit Meal Info'),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: SingleChildScrollView(
        child: GetBuilder<MealManagementController>(
          builder: (controller) {
            controller.mealNameController.text = meal.title!;
            controller.descriptionController.text = meal.description!;
            controller.unitsController.text = meal.units!.toString();
            controller.priceController.text = meal.price!.toString();
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: Demensions.width15),
              child: Form(
                key: _editMealFormKey,
                child: Column(
                  children: [
                    SizedBox(height: Demensions.height15 * 2),
                    CustomImagePicker(mealImage: meal.image,),
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
                        _editMealFormKey.currentState!.validate();
                        if (controller.pickedImage == null && meal.image == null) {
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
                          child: BigText(text: 'Edit meal', color: AppColours.cream),
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
