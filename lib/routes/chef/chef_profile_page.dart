import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locabite/controller/chef_controller.dart';
import 'package:locabite/core/utility/app_colours.dart';
import 'package:locabite/core/utility/big_text.dart';
import 'package:locabite/core/utility/demensions.dart';
import 'package:locabite/core/utility/small_text.dart';
import 'package:locabite/routes.dart';

class ChefProfilePage extends StatelessWidget {
  const ChefProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColours.white,
        actions: [
          PopupMenuButton(
            onSelected: (value) {},
            itemBuilder:
                (context) => [
                  const PopupMenuItem(value: 'Logout', child: Text('logout')),
                ],
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: GetBuilder<ChefController>(
          builder: (controller) {
            return Column(
              children: [
                // Profile Header Section
                _buildProfileHeader(controller),

                // Stats Section
                _buildStatsSection(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Edit Button
                    _buildEditButton(),

                    // Add Row Button
                    _buildAddRowButton(),
                  ],
                ),

                // Tab Section
                _buildTabSection(),

                // Content Section
                _buildContentSection(controller),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildProfileHeader(ChefController controller) {
    return Padding(
      padding: EdgeInsets.all(24.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 60,
            // backgroundImage:
            //     controller.chef.image != null
            //         // ? FileImage(File(controller.chef.image!)) as ImageProvider
            //         ? AssetImage('assets/images/bra')
            // //         : null,
            // child: controller.chef.image == null
            //     ? const Icon(Icons.person, size: 50, color: Colors.white)
            //     : null,
            child: const Icon(Icons.person, size: 50, color: Colors.white),
          ),
          SizedBox(height: 16),
          SmallText(text: 'Alexa, 08083847387'),
        ],
      ),
    );
  }

  Widget _buildStatsSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey, width: 0.5),
          bottom: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatItem('9', 'Meals'),
          _buildStatItem('₦30000', 'Earnings'),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }

  Widget _buildEditButton() {
    return Container(
      width: 200,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: ElevatedButton(
        onPressed: () => Get.toNamed(AppRoute.chefEditProfilePage),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        child: const Text(
          'Edit Profile',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildAddRowButton() {
    return Container(
      width: 150,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: OutlinedButton(
        onPressed: () => Get.toNamed(AppRoute.addMealPage),
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.black,
          side: const BorderSide(color: Colors.black),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        child: const Text(
          'Add meal',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildTabSection() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black, width: 2),
                ),
              ),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  foregroundColor: Colors.black,
                ),
                child: const Text(
                  'My meals',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentSection(ChefController controller) {
    final meals = controller.chefMeals;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.9,
        ),
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(
              right: Demensions.width10,
              bottom: Demensions.width10,
            ),
            padding: EdgeInsets.only(
              left: Demensions.width10,
              right: Demensions.width10,
              top: Demensions.height5,
            ),
            width: Demensions.width100,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 3),
                  blurRadius: 4,
                ),
              ],
              color: AppColours.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BigText(text: meals[index].title!, size: Demensions.fontSize10),
                SmallText(text: '₦ ${meals[index].price}'),
                SizedBox(height: 10),
                Container(
                  height: Demensions.height100,
                  width: Demensions.width80,
                  child: ClipRRect(
                    clipBehavior: Clip.hardEdge,
                    borderRadius: BorderRadius.circular(Demensions.radius15),
                    child: Image(
                      image: AssetImage('assets/images/food1.jpeg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
