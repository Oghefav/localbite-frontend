import 'package:flutter/material.dart';
import 'package:locabite/utility/app_colours.dart';
import 'package:locabite/utility/big_text.dart';
import 'package:locabite/utility/demensions.dart';
import 'package:locabite/utility/small_text.dart';
import 'package:locabite/widgets/app_icon.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.cream,
      appBar: AppBar(
        title: BigText( text: "My Account", size: Demensions.fontSize10 * 2.5,),
        centerTitle: true,
        backgroundColor: AppColours.cream,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // User Info
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(text: 'Oghene favour'),
              SmallText(text: 'favouroghen@gmail.com', color: AppColours.lightBrown,)
            ]
          ),
          const SizedBox(height: 30),

          // Account Options
          ListTile(
            leading: AppIcon(icon: Icons.person,),
            title: SmallText(text: "View Profile"),
            trailing: AppIcon(icon: Icons.arrow_forward_ios,),
            onTap: () {
              // Navigate to profile page
            },
          ),
          Divider(),

          ListTile(
            leading: AppIcon(icon: Icons.receipt_long,),
            title: SmallText(text: "Transaction History"),
            trailing: AppIcon(icon: Icons.arrow_forward_ios,),
            onTap: () {
              // Navigate to transaction history page
            },
          ),
          Divider(),

          ListTile(
            leading: AppIcon(icon: Icons.lock_reset,),
            title: SmallText( text: "Reset Password"),
            trailing: AppIcon(icon: Icons.arrow_forward_ios,),
            onTap: () {
              // Navigate to reset password page
            },
          ),
          Divider(),

          ListTile(
            leading: AppIcon(icon: Icons.logout,),
            title: Text("Logout"),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Logout"),
                  content: Text("Are you sure you want to logout?"),
                  actions: [
                    TextButton(
                      child: Text("Cancel"),
                      onPressed: () => Navigator.pop(context),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: Text("Logout"),
                      onPressed: () {
                        Navigator.pop(context);
                        // Add logout logic here
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
