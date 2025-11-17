import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locabite/controller/driver_controller.dart';
import 'package:locabite/data/models/delivery.dart';

class DriverMainPage extends StatelessWidget {
  const DriverMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Driver Dashboard'),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
      body: GetBuilder<DriverController>(
        builder: (controller) {
          return Column(
            children: [
              _buildStatsOverview(controller),
              SizedBox(height: 16),
              Expanded(
                child:
                    controller.deliveries.isEmpty
                        ? _buildEmptyDeliveries()
                        : ListView.builder(
                          padding: EdgeInsets.all(16),
                          itemCount: controller.deliveries.length,
                          itemBuilder: (context, index) {
                            return _buildDeliveryCard(
                              controller.deliveries[index],
                              index,
                              controller,
                              context,
                            );
                          },
                        ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildStatsOverview(DriverController controller) {
    int completedToday = 8;
    double earningsToday = 12500;

    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem(
            Icons.delivery_dining,
            'Active',
            '${controller.deliveries.length}',
          ),
          _buildStatItem(Icons.check_circle, 'Completed', '$completedToday'),
          _buildStatItem(
            Icons.attach_money,
            'Earnings',
            '₦${earningsToday.toStringAsFixed(0)}',
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String label, String value) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.blue, size: 20),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(label, style: TextStyle(fontSize: 10, color: Colors.grey)),
      ],
    );
  }

  Widget _buildDeliveryCard(
    Delivery delivery,
    int index,
    DriverController controller,
    BuildContext context,
  ) {
    Color statusColor = _getStatusColor(delivery.status);
    IconData statusIcon = _getStatusIcon(delivery.status);

    return Card(
      margin: EdgeInsets.only(bottom: 12),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  delivery.orderId,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(statusIcon, size: 12, color: statusColor),
                      SizedBox(width: 4),
                      Text(
                        controller.formatStatus(delivery.status),
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: statusColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.person, size: 16, color: Colors.grey),
                SizedBox(width: 8),
                Text(
                  delivery.customerName,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.location_on, size: 16, color: Colors.grey),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    delivery.customerAddress,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              'Order: ${controller.formatMealList(delivery.meals)}',
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '₦${delivery.totalAmount.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                _buildDeliveryActions(delivery, index, controller, context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeliveryActions(
    Delivery delivery,
    int index,
    DriverController controller,
    BuildContext context,
  ) {
    switch (delivery.status) {
      case 'new':
        return Row(
          children: [
            // Decline Button
            OutlinedButton(
              onPressed: () => controller.declineDelivery(index, context),
              child: Text('Decline'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red,
                side: BorderSide(color: Colors.red),
              ),
            ),
            SizedBox(width: 8),
            // Accept Button
            ElevatedButton(
              onPressed:
                  () => controller.updateStatus(index, 'accepted', context),
              child: Text('Accept'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        );
      case 'accepted':
        return ElevatedButton(
          onPressed: () => controller.updateStatus(index, 'delivered', context),
          child: Text('Mark Delivered'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
        );
      default:
        return SizedBox();
    }
  }

  Widget _buildEmptyDeliveries() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.delivery_dining, size: 80, color: Colors.grey[300]),
          SizedBox(height: 16),
          Text(
            'No Active Deliveries',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 8),
          Text(
            'New delivery requests will appear here',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }


  Color _getStatusColor(String status) {
    switch (status) {
      case 'new':
        return Colors.orange;
      case 'accepted':
        return Colors.blue;
      case 'delivered':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status) {
      case 'new':
        return Icons.fiber_new;
      case 'accepted':
        return Icons.check_circle;
      case 'delivered':
        return Icons.verified;
      default:
        return Icons.circle;
    }
  }
}
