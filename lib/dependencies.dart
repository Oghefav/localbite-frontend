import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/utils.dart';
import 'package:locabite/controller/Login_controller.dart';
import 'package:locabite/controller/account_setup_controller.dart';
import 'package:locabite/controller/chef_controller.dart';
import 'package:locabite/controller/customer_controller.dart';
import 'package:locabite/controller/driver_controller.dart';
import 'package:locabite/controller/meal_management_controller.dart';
import 'package:locabite/controller/payment_controller.dart';
import 'package:locabite/controller/signup_controller.dart';
import 'package:locabite/controller/splash_controller.dart';

Future<void> init() async {
  // controller
  Get.lazyPut(() => SplashController());
  Get.lazyPut(() => SignupController(), fenix: true);
  Get.lazyPut(() => LoginController(), fenix: true);
  Get.lazyPut(() => MealManagementController(), fenix: true);
  Get.lazyPut(() => DriverController(), fenix: true);
  Get.lazyPut(() => ChefController(), fenix: true);
  Get.lazyPut(() => AccountSetupController(), fenix: true);
  Get.lazyPut(() => CustomerController(), fenix: true);
  Get.lazyPut(() => PaymentController(), fenix: true);

}
