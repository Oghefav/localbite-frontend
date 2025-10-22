import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:locabite/core/utility/big_text.dart';

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
              title: BigText(text: 'Enable Location'),
              content: Text(
                'Please turn on your location to have a better experience. We use your location to show nearby restaurants and track deliveries in real-time.',
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