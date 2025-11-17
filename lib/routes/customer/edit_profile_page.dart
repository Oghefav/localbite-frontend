import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:locabite/controller/customer_controller.dart';

class EditProfileScreen extends StatelessWidget {
  const  EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        actions: [
          TextButton(
            onPressed: () {
              // Save profile changes
              Navigator.pop(context);
            },
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
      body: GetBuilder<CustomerController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _buildEditField(
                  label: 'First Name',
                  controller: controller.firstNameController,
                  icon: Icons.person,
                ),
                const SizedBox(height: 16),
                _buildEditField(
                  label: 'Last Name',
                  controller: controller.lastNameController,
                  icon: Icons.person,
                ),
                const SizedBox(height: 16),
                _buildEditField(
                  label: 'Phone Number',
                  controller: controller.phoneController,
                  icon: Icons.phone,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 16),
                _buildEditField(
                  label: 'Email Address',
                  controller: controller.emailController,
                  icon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                ),
              ],
            ),
          );
        }
      ),
    );
  }

  Widget _buildEditField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}