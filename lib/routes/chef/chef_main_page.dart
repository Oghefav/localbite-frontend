import 'package:flutter/material.dart';
import 'package:locabite/routes/customer/Homepage/main_food_body_page.dart';
import 'package:locabite/sample%20code/ui_samplecode.dart';
import 'package:locabite/core/utility/app_colours.dart';
import 'package:locabite/core/utility/big_text.dart';
import 'package:locabite/core/utility/demensions.dart';
import 'package:locabite/core/utility/small_text.dart';

class ChefMainPage extends StatelessWidget {
  const ChefMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Order> recentOrders = [
      Order("87092348278275724", "Ogbono Soup", "35 mins ago", "preparing"),
      Order("80273452974235444", "Jollof Rice & Chicken", "58 mins ago", "preparing"),
      Order("78702348972387428", "Pounded Yam & Egusi", "2 hours ago", "completed"),
      Order("78702348972387428", "Beans and Plantain", "2 hours ago", "completed"),
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Demensions.height35),
        
            _buildWelcomeSection(welcomeText: 'Hi Oghene, welcome back 👨‍🍳'),
            SizedBox(height: Demensions.height15 * 1.5),
        
            _buildStatCardSection(context: context),
            SizedBox(height: Demensions.height15 * 1.5),
        
            _buildQuickAction(),
            SizedBox(height: Demensions.height15 * 1.5),
        
            _buildRecentOrderSection(
              context: context,
              recentOrders: recentOrders,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeSection({required welcomeText}) {
    return Container(
      margin: EdgeInsets.only(left: Demensions.width15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(text: 'Chef DashBoard'),
          SmallText(text: welcomeText),
        ],
      ),
    );
  }

  Widget _buildStatCardSection({required context}) {
    return Row(
      children: [
        SizedBox(width: Demensions.height15),
        Expanded(
          child: _buildStatCard(
            icon: Icons.attach_money,
            title: 'TOTAL SALES',
            value: '${MainFoodBody.currency(context).currencySymbol}400',
            subtitle: '↓ 2% from last week',
            color: AppColours.green,
          ),
        ),
        SizedBox(width: Demensions.height15),
        Expanded(
          child: _buildStatCard(
            icon: Icons.receipt_long,
            title: 'TOTAL ORDERS',
            value: '100',
            subtitle: '↑ 12% from last week',
            color: AppColours.blue,
          ),
        ),
        SizedBox(width: Demensions.height15),
      ],
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String title,
    required String value,
    required String subtitle,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.all(Demensions.width15),
      decoration: BoxDecoration(
        color: AppColours.white,
        borderRadius: BorderRadius.circular(Demensions.radius10),
        boxShadow: [
          BoxShadow(color: Colors.black12, offset: Offset(0, 3), blurRadius: 4),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Demensions.radius10),
              color: color.withValues(alpha: 0.1),
            ),
            child: Icon(icon, color: color, size: Demensions.iconSize20 / 1.2),
          ),
          SizedBox(height: Demensions.height5),
          SmallText(text: title),
          SizedBox(height: Demensions.height5),
          BigText(text: value),
          SizedBox(height: Demensions.height5),
          SmallText(
            text: subtitle,
            color: subtitle.contains('↓') ? AppColours.red : AppColours.green,
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAction() {
    return Row(
      children: [
        SizedBox(width: Demensions.height15),
        Expanded(child: _quickAction(icon: Icons.add_circle, text: 'Add meal')),
        SizedBox(width: Demensions.height15),
        Expanded(
          child: _quickAction(icon: Icons.view_list, text: 'View Orders'),
        ),
        SizedBox(width: Demensions.height15),
      ],
    );
  }

  Widget _quickAction({required IconData icon, required String text}) {
    return ElevatedButton.icon(
      onPressed: () {},
      label: Text(text),
      icon: Icon(icon),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(Demensions.width15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Demensions.radius10),
        ),
      ),
    );
  }

  Widget _buildRecentOrderSection({
    required BuildContext context,
    required List<dynamic> recentOrders,
  }) {
    return Container(
      margin: EdgeInsets.all(Demensions.width15),
      decoration: BoxDecoration(
        color: AppColours.white,
        borderRadius: BorderRadius.circular(Demensions.radius15),
        boxShadow: [
          BoxShadow(color: Colors.black12, offset: Offset(0, 3), blurRadius: 4),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: Demensions.width15,
              top: Demensions.height10 * 2,
              bottom: Demensions.height10 * 2,
            ),
            child: Row(
              children: [
                Icon(Icons.inventory, color: AppColours.blue),
                SizedBox(width: Demensions.width10 / 2),
                BigText(text: 'Recent Orders'),
                SizedBox(width: Demensions.width15 * 2.9),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text('See All'),
                      Icon(Icons.arrow_forward_ios_outlined),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ...recentOrders.map((order) => _buildOrderItems(order)),
        ],
      ),
    );
  }

  Widget _buildOrderItems(Order order) {
    Color statusColor = Colors.blue;
    IconData statusIcon = Icons.schedule;

    if (order.status.toLowerCase() == 'completed') {
      statusColor = Colors.green;
      statusIcon = Icons.check_circle;
    }
    return  Container(
      decoration: BoxDecoration(
        border: Border( top: BorderSide(width: 1, color: Colors.grey.shade200))
      ),
      padding: EdgeInsets.symmetric(horizontal: Demensions.width15, vertical: Demensions.height15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(Demensions.width15 / 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Demensions.radius10),
                color: statusColor.withValues(alpha: 0.1),
              ),
              child: Icon(statusIcon, color: statusColor, size: Demensions.iconSize20/ 1.4,),
            ),
            Column(
              children: [
                BigText(text: order.mealName, size: Demensions.fontSize10 * 1.3 ,),
                Row(
                  children: [Icon(Icons.schedule, size: Demensions.iconSize24 / 2, color: Colors.grey,),
                  SizedBox(width: Demensions.width10 / 2,),
                   SmallText(text: order.time)],
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(Demensions.radius15 /2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Demensions.radius15),
                color: statusColor.withValues(alpha: 0.1)
              ),
              child: Text(
                order.status.toUpperCase(),
                style: TextStyle(color: statusColor, fontSize: Demensions.fontSize10),
              ),
            ),
          ],
        ),
      );
    
  }
}
