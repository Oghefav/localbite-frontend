import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:locabite/data/models/chef.dart';
import 'package:locabite/data/models/meal.dart';
import 'package:locabite/data/repositories/meals.dart';

class ChefController extends GetxController {
  File? _image;
  XFile? _pickedImage;
  XFile? get pickedImage => _pickedImage;
  File? get image => _image;

  /// Current chef (could be dynamic later)
  final Chef chef = chefs.first;
  final List<Meal> chefMeals = meals;

  /// Reactive profile data
  late RxString firstName;
  late RxString lastName;
  late RxString accountName;
  late RxInt accountNo;
  late RxString brandName;
  late RxString email;
  late RxString phone;
  late RxString bio;
  //  RxString image = ''.obs;
  // late RxBool isOnline;

  @override
  void onInit() {
    super.onInit();

    // Initialize reactive values with chef model
    firstName = chef.firstName!.obs;
    email = chef.email!.obs;
    phone = chef.phoneNumber!.obs;
    lastName = chef.lastName!.obs;
    accountName = chef.accountName!.obs;
    brandName = chef.brandName!.obs;
    accountNo = chef.accountNo!.obs;
    bio = chef.bio!.obs;

    // Prefill text controllers
    firstNameController.text = chef.firstName!;
    lastNameController.text = chef.lastName!;
    brandNameController.text = chef.brandName!;
    bioController.text = chef.bio!;
    emailController.text = chef.email!;
    phoneController.text = chef.phoneNumber!;
    accountNameController.text = chef.accountName!;
    accountNoController.text = chef.accountNo!.toString();
  }

  /// UI text controllers
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController brandNameController = TextEditingController();
  final TextEditingController accountNoController = TextEditingController();
  final TextEditingController accountNameController = TextEditingController();

  // void toggleOnlineStatus() {
  //   isOnline.value = !isOnline.value;
  //   Get.snackbar(
  //     isOnline.value ? 'You\'re Online' : 'You\'re Offline',
  //     isOnline.value
  //         ? 'Ready to accept deliveries'
  //         : 'Not accepting deliveries',
  //     snackPosition: SnackPosition.BOTTOM,
  //   );
  // }

  Future<void> uploadProfileImage() async {
    final ImagePicker picker = ImagePicker();
    _pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (_pickedImage != null) {
      _image = File(_pickedImage!.path);
      Get.snackbar(
        'Success',
        'Profile image updated',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    update();
  }

  void updateProfile() {
    firstName.value = firstName.value;
    email.value = email.value;
    phone.value = phone.value;
    brandName.value = brandName.value;
    lastName.value = lastName.value;
    accountName.value = accountName.value;
    accountNo.value = accountNo.value;
    bio.value = bio.value;

    Get.snackbar(
      'Profile Updated',
      'Your profile has been updated successfully',
      snackPosition: SnackPosition.BOTTOM,
    );
    update();
  }
}
