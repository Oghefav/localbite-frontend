import 'package:get/get.dart';
import 'package:locabite/core/utility/check_location.dart';

class SplashController extends GetxController implements GetxService {
  @override
  void onInit() {
    super.onInit();

    Future.delayed(Duration.zero, () {
      if (Get.context != null) {
        checkLocation(Get.context!);
      }
    });
  }


}
