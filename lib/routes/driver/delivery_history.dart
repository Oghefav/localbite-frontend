import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locabite/controller/driver_controller.dart';
import 'package:locabite/data/models/delivery.dart';

class DeliveryHistoryPage extends StatelessWidget {
  const DeliveryHistoryPage({super.key});
  

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DriverController()); 
    return Scaffold(
       appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('History'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
     
      body: GetBuilder<DriverController>(
        builder: (controller) => ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: controller.deliveryHistory.length,
        itemBuilder: (context, index) {
          return _buildHistoryCard(controller.deliveryHistory[index], controller);
        },
            ),
      ),
    );
  }
   Widget _buildHistoryCard(Delivery delivery, DriverController controller) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(delivery.orderId, style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Delivered', style: TextStyle(color: Colors.green)),
            ]),
            SizedBox(height: 8),
            Text(delivery.customerName),
            SizedBox(height: 4),
            Text(delivery.customerAddress,
                style: TextStyle(fontSize: 12, color: Colors.grey)),
            SizedBox(height: 8),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('₦${delivery.totalAmount.toStringAsFixed(2)}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green)),
              Text(controller.formatDate(delivery.deliveredTime!),
                  style: TextStyle(fontSize: 12, color: Colors.grey)),
            ]),
          ],
        ),
      ),
    );
  }
}