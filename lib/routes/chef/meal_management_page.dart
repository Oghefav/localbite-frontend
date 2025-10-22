import 'package:flutter/material.dart';
import 'package:locabite/core/utility/big_text.dart';
import 'package:locabite/core/utility/demensions.dart';
import 'package:locabite/core/utility/small_text.dart';

class MealManagementPage extends StatelessWidget {
  const MealManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: BigText(text: 'Manage Meal'), centerTitle: true),
      body: _buildEmptyMealPage(),
    );
  }

  Widget _buildEmptyMealPage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.fastfood, color: Colors.grey.shade500, size: Demensions.iconSize20 * 5,),
          SizedBox(height: Demensions.height15),
          BigText(text: 'No Meals Added '),
          SizedBox(height: Demensions.height15),
          SmallText(text: 'Add your first meal to get start'),
          SizedBox(height: Demensions.height15),
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.add),
            label: Text('Add First Meal'),
          ),
        ],
      ),
    );
  }

  

//  Widget _buildMealPage(){

//  }
}
