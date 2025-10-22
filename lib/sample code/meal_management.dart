import 'package:flutter/material.dart';
import 'package:locabite/sample%20code/meal_dialog.dart';

class MealManagementScreen extends StatefulWidget {
  @override
  _MealManagementScreenState createState() => _MealManagementScreenState();
}

class _MealManagementScreenState extends State<MealManagementScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('‘Manage Meals’'),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _showAddMealDialog(),
          ),
        ],
      ),
       body:_buildEmptyState()
      //  _buildMealsList(),
        
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.fastfood, size: 80, color: Colors.grey[300]),
          SizedBox(height: 16),
          Text(
            "‘No Meals Added’,",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 8),
          Text(
            '‘Add your first meal to get started’',
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => _showAddMealDialog(),
            icon: Icon(Icons.add),
            label: Text('Add First Meal'),
            style: ElevatedButton.styleFrom(
              // primary: Colors.green,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  void _showAddMealDialog() {
    showDialog(
      context: context,
      builder: (context) => MealDialog(
        // onSave: (meal) {
        //   setState(() {
        //     meals.add(meal);
        //   });
        // },
      ),
    );
  }
  //   void _showAddMealDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (context) => Text('addd')
  //   );
  // }


  Widget _buildMealCard( int index) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey[200],
            image: 
                 DecorationImage(
                    image: AssetImage('assets/images/food2.jpeg'),
                    fit: BoxFit.cover,
                  )
               
          ),
          child: Icon(Icons.fastfood, color: Colors.grey)
        ),
        title: Text(
          'Meal.name',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Meal.description',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(height: 4),
            Text(
              '₦{meal.price.toStringAsFixed(2)} • {meal.category}',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.green,
              ),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Availability Toggle
            IconButton(
              icon: Icon(
                 Icons.toggle_on,
                color:  Colors.green ,
                size: 30,
              ),
              onPressed: () {},
            ),
            PopupMenuButton<String>(
              
              itemBuilder: (BuildContext context) => [
                PopupMenuItem(value: 'edit', child: Text('Edit Meal')),
                PopupMenuItem(value:'delete', child: Text('Delete Meal')),
              ],
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildMealsList() {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: 3,
      itemBuilder: (context, index) {
        return _buildMealCard( index);
      },
    );
  }




  void _showDeleteDialog(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Meal'),
        content: Text('Are you sure you want to delete {meals[index].name}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // setState(() {
                
              // });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Meal deleted successfully'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}