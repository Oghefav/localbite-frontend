import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locabite/controller/driver_controller.dart';

class DriverProfilePage extends StatelessWidget {
  const DriverProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        centerTitle: true,

      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: GetBuilder<DriverController>(
          builder: (controller) {
            return Column(
              children: [
            
                     // Statistics
                _buildStatisticsSection( context),
                const SizedBox(height: 32),
            
                // Online Status Toggle
                _buildOnlineStatusToggle(controller,),
                const SizedBox(height: 24),
            
                // Profile Form
                _buildProfileForm(controller, context),
                const SizedBox(height: 32),
            
            
                // Action Buttons
                _buildActionButtons(),
              ],
            );
          }
        ),
      ),
    );
  }

  Widget _buildOnlineStatusToggle(DriverController controller) {
    return Obx(() => Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(
              Icons.circle,
              color: controller.isOnline.value ? Colors.green : Colors.red,
              size: 12,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.isOnline.value ? 'Online' : 'Offline',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    controller.isOnline.value 
                        ? 'Ready to accept deliveries'
                        : 'Not accepting deliveries',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            Switch(
              value: controller.isOnline.value,
              onChanged: (value) => controller.toggleOnlineStatus(),
              activeColor: Colors.green,
            ),
          ],
        ),
      ),
    ));
  }

  Widget _buildProfileForm(DriverController controller, BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Profile Information',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildFormField('first Name', Icons.person, controller.firstNameController),
            const SizedBox(height: 16),
            _buildFormField('first Name', Icons.person, controller.lastNameController),
            const SizedBox(height: 16),
            _buildFormField('Email', Icons.email, controller.emailController),
            const SizedBox(height: 16),
            _buildFormField('Phone', Icons.phone, controller.phoneController),
            const SizedBox(height: 16),
            _buildFormField('Vehicle Info', Icons.directions_car, controller.vehicleController),
            const SizedBox(height: 16),
            _buildFormField('Account Name', Icons.account_balance, controller.accountNameController),
            const SizedBox(height: 16),
            _buildFormField('Account Number', Icons.credit_card, controller.vehicleController),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildFormField(String label, IconData icon, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: const OutlineInputBorder(),
      ),
    );
  }

  Widget _buildStatisticsSection(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delivery Statistics',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem('156', 'Total Deliveries', Icons.delivery_dining),
                _buildStatItem('₦245,800', 'Total Earnings', Icons.attach_money),
                _buildStatItem('4.8', 'Rating', Icons.star),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String value, String label, IconData icon) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.blue, size: 24),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        FilledButton.icon(
          onPressed: (){},
          icon: const Icon(Icons.save),
          label: const Text('Save Changes'),
          style: FilledButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
          ),
        ),
        const SizedBox(height: 12),
        OutlinedButton.icon(
          onPressed: () => Get.toNamed('/driver-logout'),
          icon: const Icon(Icons.logout),
          label: const Text('Logout'),
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            foregroundColor: Colors.red,
          ),
        ),
      ],
    );
  }


}