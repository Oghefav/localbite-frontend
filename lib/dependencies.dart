import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/utils.dart';
import 'package:locabite/controller/Login_controller.dart';
import 'package:locabite/controller/signup_controller.dart';
import 'package:locabite/controller/splash_controller.dart';

Future<void> init() async {
  // controller
  Get.lazyPut(() => SplashController());
  Get.lazyPut(() => SignupController(), fenix: true);
  Get.lazyPut(() => LoginController(), fenix: true);
}
