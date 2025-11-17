import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:locabite/data/models/delivery.dart';
import 'package:locabite/data/models/driver.dart';
import 'package:locabite/data/models/meal.dart';
import 'package:locabite/data/repositories/meals.dart';

class DriverController extends GetxController {
  List<Delivery> deliveries = [];
  final Driver driver = drivers.first;

  /// Reactive profile data
  late RxString firstName;
  late RxString email;
  late RxString phone;
  late RxString vehicleLicenseNo;
  late RxBool isOnline;
  late RxInt accountNo;
  late RxString lastName;
  late RxString accountName;

  @override
  void onInit() {
    super.onInit();
    _loadSampleData();

    firstNameController.text = driver.firstName!;
    lastNameController.text = driver.lastName!;
    emailController.text = driver.email!;
    phoneController.text = driver.phoneNumber!;
    vehicleController.text = driver.vehicleLicenseNo!;
    accountNameController.text = driver.accountName!;
    accountNoController.text = driver.accountNo.toString();

    firstName = driver.firstName!.obs;
    email = driver.email!.obs;
    phone = driver.phoneNumber!.obs;
    vehicleLicenseNo = driver.vehicleLicenseNo!.obs;
    accountNo = driver.accountNo!.obs;
    lastName = driver.lastName!.obs;
    accountName = driver.accountName!.obs;
    isOnline = true.obs;
  }

  void _loadSampleData() {
    deliveries = [
      Delivery(
        id: '1',
        orderId: '#DR-1284',
        customerName: 'John Doe',
        customerAddress: '123 Main St, Lagos',
        customerPhone: '+234 812 345 6789',
        deliveryFee: 500,
        totalAmount: 3000,
        status: 'new',
        orderTime: DateTime.now().subtract(Duration(minutes: 15)),
        meals: meals,
      ),
      Delivery(
        id: '2',
        orderId: '#DR-1285',
        customerName: 'Sarah Smith',
        customerAddress: '456 Oak Ave, Ikeja',
        customerPhone: '+234 807 654 3210',
        deliveryFee: 600,
        totalAmount: 4200,
        status: 'accepted',
        orderTime: DateTime.now().subtract(Duration(minutes: 45)),
        meals: meals,
      ),
    ];
  }

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController vehicleController = TextEditingController();
  final TextEditingController accountNoController = TextEditingController();
  final TextEditingController accountNameController = TextEditingController();

  List<Delivery> deliveryHistory = [
    Delivery(
      id: '3',
      orderId: '#DR-1280',
      customerName: 'Mike Johnson',
      customerAddress: '789 Palm St, VI',
      customerPhone: '+234 905 123 4567',
      deliveryFee: 700,
      totalAmount: 5200,
      status: 'delivered',
      orderTime: DateTime.now().subtract(Duration(days: 1)),
      deliveredTime: DateTime.now().subtract(Duration(days: 1)),
      meals: meals,
    ),
  ];

  // void _saveProfile() {
  //   updateProfile(
  //     nameController.text,
  //     emailController.text,
  //     phoneController.text,
  //     vehicleController.text,
  //   );
  // }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    accountNameController.dispose();
    accountNoController.dispose();
    emailController.dispose();
    phoneController.dispose();
    vehicleController.dispose();
    super.dispose();
  }

  void updateProfile(
    String firstName_,
    String email_,
    String phone_,
    String vehicleLicenseNo_,
    String lastName_,
    String accountName_,
    int accountNo_,
  ) {
    firstName.value = firstName_;
    email.value = email_;
    phone.value = phone_;
    vehicleLicenseNo.value = vehicleLicenseNo_;
    lastName.value = lastName_;
    accountName.value = accountName_;
    accountNo.value = accountNo_;

    Get.snackbar(
      'Profile Updated',
      'Your profile has been updated successfully',
      snackPosition: SnackPosition.BOTTOM,
    );
    update();
  }

  void toggleOnlineStatus() {
    isOnline.value = !isOnline.value;
    Get.snackbar(
      isOnline.value ? 'You\'re Online' : 'You\'re Offline',
      isOnline.value
          ? 'Ready to accept deliveries'
          : 'Not accepting deliveries',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void declineDelivery(int index, BuildContext context) {
    deliveries.removeAt(index);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Delivery declined'),
        backgroundColor: Colors.orange,
      ),
    );
    update();
  }

  void updateStatus(int index, String newStatus, BuildContext context) {
    deliveries[index].status = newStatus;

    if (newStatus == 'delivered') {
      deliveries[index].deliveredTime = DateTime.now();
      deliveryHistory.insert(0, deliveries[index]);
      deliveries.removeAt(index);
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Status updated to ${formatStatus(newStatus)}'),
        backgroundColor: Colors.green,
      ),
    );
    update();
  }

  String formatStatus(String status) =>
      status.replaceAll('_', ' ').toUpperCase();

  String formatMealList(List<Meal> meals) =>
      meals.map((meal) => '${meal.units}x ${meal.title}').join(', ');

  String formatDate(DateTime date) => '${date.day}/${date.month}/${date.year}';
}
