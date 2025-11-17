import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locabite/controller/chef_controller.dart';
import 'package:locabite/core/utility/big_text.dart';
import 'package:locabite/core/utility/demensions.dart';

class ChefEditProfilePage extends StatelessWidget {
  const ChefEditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BigText(text: 'Edit Profile'),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: GetBuilder<ChefController>(
          builder: (controller) {
            return Column(
              children: [
                const SizedBox(height: 39),
                Obx(() => _buildProfileImageSection(controller, context)),
                const SizedBox(height: 20),

                // Profile Form
                _buildProfileForm(controller, context),
                const SizedBox(height: 32),

                _buildActionButtons(controller),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildProfileImageSection(
    ChefController controller,
    BuildContext context,
  ) {
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage:
                  controller.image != null
                      ? FileImage(File(controller.image!.path)) as ImageProvider
                      : null,
              child:
                  controller.image == null
                      ? const Icon(Icons.person, size: 50, color: Colors.white)
                      : null,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: 20,
                  ),
                  onPressed: controller.uploadProfileImage,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          controller.firstName.value,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  // Widget _buildOnlineStatusToggle(ChefController controller) {
  // return Obx(
  //     () => Card(
  //       child: Padding(
  //         padding: const EdgeInsets.all(16),
  //         child: Row(
  //           children: [
  //             Icon(
  //               Icons.circle,
  //               color: controller.isOnline.value ? Colors.green : Colors.red,
  //               size: 12,
  //             ),
  //             const SizedBox(width: 12),
  //             Expanded(
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text(
  //                     controller.isOnline.value ? 'Online' : 'Offline',
  //                     style: const TextStyle(fontWeight: FontWeight.bold),
  //                   ),
  //                   Text(
  //                     controller.isOnline.value
  //                         ? 'Ready to accept deliveries'
  //                         : 'Not accepting deliveries',
  //                     style: TextStyle(fontSize: 12, color: Colors.grey[600]),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             Switch(
  //               value: controller.isOnline.value,
  //               onChanged: (value) => controller.toggleOnlineStatus(),
  //               activeColor: Colors.green,
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildProfileForm(ChefController controller, BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Profile Information',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildFormField(
              'First Name',
              Icons.person_outline,
              controller.firstNameController,
            ),
            const SizedBox(height: 16),
            _buildFormField(
              'Last Name',
              Icons.person,
              controller.lastNameController,
            ),
            const SizedBox(height: 16),
            _buildFormField(
              'Brand Name',
              Icons.restaurant,
              controller.brandNameController,
            ),

            const SizedBox(height: 16),
            _buildFormField('Bio', Icons.info, controller.bioController),

            const SizedBox(height: 16),
            _buildFormField('Email', Icons.email, controller.emailController),

            const SizedBox(height: 16),
            _buildFormField('Phone', Icons.phone, controller.phoneController),

            const SizedBox(height: 16),
            _buildFormField(
              'Bank Account Number',
              Icons.credit_card,
              controller.accountNoController,
            ),

            const SizedBox(height: 16),
            _buildFormField(
              'Bank Account Name',
              Icons.account_balance,
              controller.accountNameController,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildFormField(
    String label,
    IconData icon,
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: const OutlineInputBorder(),
      ),
    );
  }

  // Widget _buildStatisticsSection(BuildContext context) {
  //   return Card(
  //     child: Padding(
  //       padding: const EdgeInsets.all(16),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(
  //             'Delivery Statistics',
  //             style: Theme.of(
  //               context,
  //             ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
  //           ),
  //           const SizedBox(height: 16),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceAround,
  //             children: [
  //               _buildStatItem(
  //                 '156',
  //                 'Total Deliveries',
  //                 Icons.delivery_dining,
  //               ),
  //               _buildStatItem(
  //                 '₦245,800',
  //                 'Total Earnings',
  //                 Icons.attach_money,
  //               ),
  //               _buildStatItem('4.8', 'Rating', Icons.star),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildStatItem(String value, String label, IconData icon) {
  //   return Column(
  //     children: [
  //       Container(
  //         padding: const EdgeInsets.all(12),
  //         decoration: BoxDecoration(
  //           color: Colors.blue.withOpacity(0.1),
  //           shape: BoxShape.circle,
  //         ),
  //         child: Icon(icon, color: Colors.blue, size: 24),
  //       ),
  //       const SizedBox(height: 8),
  //       Text(
  //         value,
  //         style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
  //       ),
  //       Text(
  //         label,
  //         style: TextStyle(fontSize: 12, color: Colors.grey[600]),
  //         textAlign: TextAlign.center,
  //       ),
  //     ],
  //   );
  // }

  Widget _buildActionButtons(ChefController controller) {
    return Column(
      children: [
        FilledButton.icon(
          onPressed: controller.updateProfile,
          icon: const Icon(Icons.save),
          label: const Text('Save Changes'),
          style: FilledButton.styleFrom(
            minimumSize: Size(Demensions.width100 * 2, 50),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
