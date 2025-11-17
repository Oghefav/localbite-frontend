import 'package:locabite/data/models/payment_model.dart';

class Order {
  final String orderId;
  final DateTime orderDate;
  final List<OrderItem> items;
  final double subtotal;
  final double deliveryFee;
  final String orderStatus;
  final double total;
  // final String time;

  Order({
    required this.orderId,
    required this.orderDate,
    required this.items,
    required this.subtotal,
    required this.deliveryFee,
    required this.orderStatus,
    required this.total,
    // required this.time,
  });
}
