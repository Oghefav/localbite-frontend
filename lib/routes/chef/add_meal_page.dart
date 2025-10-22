import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locabite/controller/meal_management_controller.dart';
import 'package:locabite/core/utility/big_text.dart';
import 'package:locabite/core/utility/demensions.dart';
import 'package:locabite/core/utility/app_colours.dart';
import 'package:locabite/widgets/custom_image_picker.dart';

class AddMealPage extends StatelessWidget {
  const AddMealPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(title: BigText(text: 'Add meal'), centerTitle: true),
      body: SingleChildScrollView(
        child: GetBuilder<MealManagementController>(
          builder: (controller) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: Demensions.width15),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: Demensions.height15 * 2),
                    CustomImagePicker(),
                    SizedBox(height: Demensions.height15 * 2),
                    TextFormField(
                      validator: (value) => value!.isEmpty ? 'Meal name is required' : null,
                      controller: controller.mealNameController,
                      decoration: InputDecoration(
                        hintText: 'e.g Ogbono Soup',
                        labelText: 'Meal Name',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Demensions.radius15 ),
                          borderSide: BorderSide(
                            color: AppColours.black,
                            style: BorderStyle.solid,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Demensions.radius15 ),
                          borderSide: BorderSide(
                            color: AppColours.black,
                            style: BorderStyle.solid,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: Demensions.height15),
                    TextFormField(
                      maxLines: 5,
                      controller: controller.descriptionController,
                      decoration: InputDecoration(
                        hintText: 'Enter a short description of the meal',
                        labelText: 'Description',
                        alignLabelWithHint: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Demensions.radius15 ),
                          borderSide: BorderSide(
                            color: AppColours.black,
                            style: BorderStyle.solid,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Demensions.radius15 ),
                          borderSide: BorderSide(
                            color: AppColours.black,
                            style: BorderStyle.solid,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: Demensions.height15),
                    TextFormField(
                      controller: controller.priceController,
                      decoration: InputDecoration(
                        hintText: '2000',
                        prefixText: '₦',
                        labelText: 'Price(₦)',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Demensions.radius15 ),
                          borderSide: BorderSide(
                            color: AppColours.black,
                            style: BorderStyle.solid,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Demensions.radius15 ),
                          borderSide: BorderSide(
                            color: AppColours.black,
                            style: BorderStyle.solid,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                     SizedBox(height: Demensions.height15),
                    TextFormField(
                      // validator: 
                      keyboardType: TextInputType.number,
                      controller: controller.unitsController,
                      decoration: InputDecoration(
                        hintText: 'eg 1,2, 3',
                        labelText: 'Units',
                        
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Demensions.radius15 ),
                          borderSide: BorderSide(
                            color: AppColours.black,
                            style: BorderStyle.solid,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Demensions.radius15 ),
                          borderSide: BorderSide(
                            color: AppColours.black,
                            style: BorderStyle.solid,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                     SizedBox(height: Demensions.height15 * 4),
                    
                    Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Demensions.radius15),
                        color: AppColours.blue.shade200,
                      ),
                      child: Center(
                        child: BigText(text: 'Add', color: AppColours.cream),
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
