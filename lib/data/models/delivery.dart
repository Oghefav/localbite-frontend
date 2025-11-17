import 'package:locabite/data/models/meal.dart';

class Delivery {
  String id;
  String orderId;
  String customerName;
  String customerAddress;
  String customerPhone;
  double deliveryFee;
  double totalAmount;
  String status; // pending, accepted, picked_up, on_way, delivered, cancelled
  DateTime orderTime;
  DateTime? acceptedTime;
  DateTime? pickedUpTime;
  DateTime? deliveredTime;
  List<Meal> meals;

  Delivery({
    required this.id,
    required this.orderId,
    required this.customerName,
    required this.customerAddress,
    required this.customerPhone,
    required this.deliveryFee,
    required this.totalAmount,
    required this.status,
    required this.orderTime,
    this.acceptedTime,
    this.pickedUpTime,
    this.deliveredTime,
    required this.meals,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'orderId': orderId,
      'customerName': customerName,
      'customerAddress': customerAddress,
      'customerPhone': customerPhone,
      'deliveryFee': deliveryFee,
      'totalAmount': totalAmount,
      'status': status,
      'orderTime': orderTime.millisecondsSinceEpoch,
      'acceptedTime': acceptedTime?.millisecondsSinceEpoch,
      'pickedUpTime': pickedUpTime?.millisecondsSinceEpoch,
      'deliveredTime': deliveredTime?.millisecondsSinceEpoch,
      'meals': meals.map((meal) => meal.toMap()).toList(),
    };
  }
}
