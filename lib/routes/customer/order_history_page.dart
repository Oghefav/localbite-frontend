import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:locabite/data/models/order.dart';
import 'package:locabite/data/models/payment_model.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Order History',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          // Summary Cards
          _buildSummarySection(),
          const SizedBox(height: 16),
          
          // Order List
          Expanded(
            child: _buildOrderList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSummarySection() {
    final orders = _getSampleOrders();
    final totalOrders = orders.length;
    final completedOrders = orders.where((order) => order.orderStatus.toLowerCase() == 'completed').length;
    final pendingOrders = orders.where((order) => order.orderStatus.toLowerCase() == 'pending').length;

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: _buildSummaryCard(
              title: 'Total Orders',
              value: totalOrders.toString(),
              color: Colors.blue,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildSummaryCard(
              title: 'Completed',
              value: completedOrders.toString(),
              color: Colors.green,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildSummaryCard(
              title: 'Pending',
              value: pendingOrders.toString(),
              color: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard({
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildOrderList() {
    final orders = _getSampleOrders();
    
    if (orders.isEmpty) {
      return _buildEmptyState();
    }
    
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: orders.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final order = orders[index];
        return _buildOrderCard(order);
      },
    );
  }

  Widget _buildOrderCard(Order order) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Order Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order #${order.orderId}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      DateFormat('MMM dd, yyyy • HH:mm').format(order.orderDate),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: _getStatusColor(order.orderStatus).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    order.orderStatus.toUpperCase(),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: _getStatusColor(order.orderStatus),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            
            // Order Items
            Column(
              children: order.items.map((item) => _buildOrderItem(item)).toList(),
            ),
            const SizedBox(height: 12),
            
            // Price Breakdown
            const SizedBox(height: 12),
            
            // Total Amount
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Amount',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  '\$${order.total.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            
            // Action Button for Completed Orders
          
          ],
        ),
      ),
    );
  }

  Widget _buildOrderItem(OrderItem item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.shopping_bag_outlined,
              color: Colors.grey[500],
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Qty: ${item.quantity}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Text(
            '\$${item.price.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }




  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_bag_outlined,
            size: 80,
            color: Colors.grey[300],
          ),
          const SizedBox(height: 16),
          Text(
            'No orders yet',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Your order history will appear here',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              // Navigate to products screen
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            ),
            child: const Text('Start Shopping'),
          ),
        ],
      ),
    );
  }

  // Helper methods
  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  void _reorderItems(Order order) {
    // Implement reorder functionality
    print('Reordering items from order: ${order.orderId}');
  }

  // Sample Data using your Order model
  List<Order> _getSampleOrders() {
    return [
      Order(
        orderId: '7842',
        orderDate: DateTime.now().subtract(const Duration(hours: 2)),
        items: [
          OrderItem(name: 'Okpa and Bread', quantity: 1, price: 99.99),
          OrderItem(name: 'Beans and Platain', quantity: 2, price: 15.99),
        ],
        subtotal: 131.97,
        deliveryFee: 5.99,
        orderStatus: 'completed',
        total: 137.96,
      ),
      Order(
        orderId: '7831',
        orderDate: DateTime.now().subtract(const Duration(days: 1)),
        items: [
          OrderItem(name: 'Rice and Stew', quantity: 1, price: 49.99),
          OrderItem(name: 'Spaghetti and Fries', quantity: 3, price: 12.99),
        ],
        subtotal: 88.96,
        deliveryFee: 0.00, // Free delivery
        orderStatus: 'pending',
        total: 88.96,
      ),
      Order(
        orderId: '7815',
        orderDate: DateTime.now().subtract(const Duration(days: 3)),
        items: [
          OrderItem(name: 'Yam and Beans', quantity: 1, price: 199.99),
          OrderItem(name: 'Potato pepperSoup', quantity: 1, price: 9.99),
        ],
        subtotal: 209.98,
        deliveryFee: 8.99,
        orderStatus: 'completed',
        total: 218.97,
      ),
      Order(
        orderId: '7798',
        orderDate: DateTime.now().subtract(const Duration(days: 5)),
        items: [
          OrderItem(name: 'Banga Soup and Starch', quantity: 1, price: 79.99),
          OrderItem(name: 'Okra soup', quantity: 1, price: 8.99),
        ],
        subtotal: 88.98,
        deliveryFee: 4.99,
        orderStatus: 'pending',
        total: 93.97,
      ),
    ];
  }
}
