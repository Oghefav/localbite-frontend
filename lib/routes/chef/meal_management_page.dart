import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locabite/controller/meal_management_controller.dart';
import 'package:locabite/core/utility/app_colours.dart';
import 'package:locabite/core/utility/big_text.dart';
import 'package:locabite/core/utility/demensions.dart';
import 'package:locabite/core/utility/small_text.dart';
import 'package:locabite/data/models/meal.dart';
import 'package:locabite/data/repositories/meals.dart';
import 'package:locabite/routes.dart';
import 'package:locabite/widgets/delete_dialog.dart';

class MealManagementPage extends StatelessWidget {
  const MealManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MealManagementController());

    return GetBuilder<MealManagementController>(
      builder:
          (controller) => Scaffold(
            appBar: AppBar(
              title: BigText(text: 'Manage Meals'),
              centerTitle: true,
              leading: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(Icons.arrow_back_ios_new),
              ),
            ),
            body: meals.isEmpty? _buildEmptyMealPage() :_buildMealPage(controller, meals),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () => Get.toNamed(AppRoute.getAddMealPage()),
              label: Text('Add meal'),
              icon: Icon(Icons.add),
            ),
          ),
    );
  }

  Widget _buildEmptyMealPage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.fastfood,
            color: Colors.grey.shade500,
            size: Demensions.iconSize20 * 5,
          ),
          SizedBox(height: Demensions.height15),
          BigText(text: 'No Meals Added '),
          SizedBox(height: Demensions.height15),
          SmallText(text: 'Add a meal to get started'),
          SizedBox(height: Demensions.height15),
          ElevatedButton.icon(
            onPressed: () => Get.toNamed(AppRoute.addMealPage),
            icon: Icon(Icons.add),
            label: Text('Add First Meal'),
          ),
        ],
      ),
    );
  }

  Widget _buildMealPage(MealManagementController controller, List<Meal> meals) {
    return Container(
      child: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Get.toNamed(AppRoute.mealDetailPage, arguments: meals[index]),
            child: Container(
              height: Demensions.height130,
              width: double.maxFinite,
              margin: EdgeInsets.all(Demensions.width10),
              padding: EdgeInsets.symmetric(
                vertical: Demensions.radius15 / 2,
                horizontal: Demensions.radius15,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Demensions.radius15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 5),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                            Demensions.radius15,
                          ),
                          child: Image(
                            image: AssetImage(meals[index].image!),
                            fit: BoxFit.cover,
                            height: Demensions.height100 / 2,
                          ),
                        ),
                        Positioned(
                          child: Icon(
                            Icons.fastfood,
                            color: Colors.grey.shade300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: Demensions.width15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BigText(
                                text: meals[index].title!,
                                size: Demensions.fontSize10 * 1.5,
                              ),
            
                              SizedBox(
                                width: Demensions.width180,
                                height: Demensions.height32,
            
                                child: Text(
                                  meals[index].description!,
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: Demensions.fontSize10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: Demensions.width15 * 1.2),
                          PopupMenuButton(
                            onSelected: (value) {
                              if (value == 'edit') {
                                Get.toNamed(
                                  AppRoute.editMealPage,
                                  arguments: meals[index],
                                );
                              } else if (value == 'delete') {
                                showDeleteDialog(meals[index], context, controller);
                              }
                            },
                            itemBuilder:
                                (context) => [
                                  const PopupMenuItem(
                                    value: 'edit',
                                    child: Text('Edit Meal'),
                                  ),
                                  const PopupMenuItem(
                                    value: 'delete',
                                    child: Text('Delete Meal'),
                                  ),
                                ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BigText(
                            text: '₦${meals[index].price!}',
                            size: Demensions.fontSize10 * 2,
                          ),
                          SizedBox(width: Demensions.width15 * 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SmallText(
                                text:
                                    meals[index].availabilityStatus!
                                        ? 'Avaliable'
                                        : 'Unavaliable',
                                color:
                                    meals[index].availabilityStatus!
                                        ? AppColours.black
                                        : Colors.grey,
                              ),
                              IconButton(
                                icon: Icon(
                                  meals[index].availabilityStatus!
                                      ? Icons.toggle_on
                                      : Icons.toggle_off,
                                  color:
                                      meals[index].availabilityStatus!
                                          ? Colors.green
                                          : Colors.grey,
                                ),
                                onPressed:
                                    () => controller.changedSwitch(
                                      meals[index],
                                      !meals[index].availabilityStatus!,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
