import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locabite/controller/meal_management_controller.dart';
import 'package:locabite/core/utility/demensions.dart';
import 'package:locabite/core/utility/small_text.dart';
import 'package:locabite/widgets/select_image_bottom_sheet.dart';

// ignore: must_be_immutable
class CustomImagePicker extends StatelessWidget {
  String? mealImage;
  CustomImagePicker({super.key, this.mealImage});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MealManagementController>(
      builder: (controller) {
        return GestureDetector(
          onTap: () {
            controller.changeImage(mealImage);
            selectImageBottomSheet(context, controller);
          },
          child:
              controller.getImage == null && mealImage == null
                  ? DottedBorder(
                    options: RoundedRectDottedBorderOptions(
                      radius: Radius.circular(Demensions.radius15),
                      color: Colors.grey,
                      dashPattern: const [6, 3],
                    ),
                    child: Container(
                      height: Demensions.height100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          Demensions.radius15,
                        ),
                        color: Colors.grey.shade200,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.camera_alt_rounded,
                            color: Colors.grey,
                            size: Demensions.iconSize20 * 2,
                          ),
                          SmallText(text: 'Tap to add meal image'),
                        ],
                      ),
                    ),
                  )
                  : Column(
                    children: [
                      Container(
                        height: Demensions.height100,
                        width: Demensions.width100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            Demensions.radius15 * 4,
                          ),
                          child:
                              controller.getImage == null
                                  ? Image(
                                    image: AssetImage(mealImage!),
                                    height: Demensions.height100,
                                    fit: BoxFit.cover,
                                  )
                                  : Image.file(
                                    controller.getImage!,
                                    height: Demensions.height100,
                                    fit: BoxFit.cover,
                                  ),
                        ),
                      ),
                      SmallText(text: 'Tap to edit meal image'),
                    ],
                  ),
        );
      },
    );
  }
}
