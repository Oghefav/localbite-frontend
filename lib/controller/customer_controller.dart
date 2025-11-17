import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:locabite/data/models/customer.dart';

class CustomerController extends GetxController {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final Customer customer = Customer(
    firstname: 'favour',
    lastname: 'Oghene',
    email: 'favouroghenevwole@gmail.come',
    phoneNumber: '08086179473',
  );

  late RxString firstName;
  late RxString lastName;
  late RxString email;
  late RxString phoneNumber;

  @override
  void onIint() {
    super.onInit();
    firstNameController.text = customer.firstname!;
    lastNameController.text = customer.lastname!;
    emailController.text = customer.email!;
    phoneController.text = customer.phoneNumber!;

    firstName = customer.firstname!.obs;
    lastName = customer.lastname!.obs;
    email = customer.email!.obs;
    phoneNumber = customer.phoneNumber!.obs;
  }
}
