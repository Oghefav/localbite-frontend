import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:locabite/utility/big_text.dart';

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

  Future<void> checkLocation(BuildContext context) async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // var location = await Geolocator.getCurrentPosition();
    print('my location is');

    if (!serviceEnabled) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder:
            (context) => AlertDialog(
              title: BigText(text: 'Location Required'),
              content: Text(
                'Please turn on your location to have a better experience',
                softWrap: true,
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Geolocator.openLocationSettings();
                    Get.back();
                  },
                  child: BigText(text: 'Turn Location on'),
                ),
              ],
            ),
      );
    }
  }
}
