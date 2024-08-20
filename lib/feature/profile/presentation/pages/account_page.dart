import 'package:flutter/material.dart';
import 'package:majeat_driver/core/constants/theme_constants.dart';
import 'package:majeat_driver/feature/login/controller/login_controller.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {

        LoginController loginController = Provider.of<LoginController>(context);

     String avatarUrl =loginController.signedinUser.image ??'https://images.pexels.com/photos/4029925/pexels-photo-4029925.jpeg?auto=compress&cs=tinysrgb&w=600';

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Account Settings'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to app settings or show a settings modal
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32,vertical: 50),
          child: Column(
            children: [
              // User Profile Section
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: ThemeConstants.primaryColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child:  Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(avatarUrl), // Replace with actual profile image URL
                      backgroundColor: Color.fromARGB(255, 236, 205, 29),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          loginController.signedinUser.name ?? 'name place', // Replace with actual user name
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          loginController.signedinUser.email ??'johndoe@example.com', // Replace with actual user email
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // List of Settings
              Expanded(
                child: ListView(
                  children: [
                    _buildListTile(
                      context,
                      title: 'Name',
                      subtitle: loginController.signedinUser.email?? 'John Doe', // Replace with actual user name
                      icon: Icons.person,
                      onTap: () {
                        // Navigate to name edit screen or show modal dialog
                      },
                    ),
                    _buildListTile(
                      context,
                      title: 'Email',
                      subtitle: loginController.signedinUser.email?? 'johndoe@example.com', // Replace with actual user email
                      icon: Icons.email,
                      onTap: () {
                        // Navigate to email edit screen or show modal dialog
                      },
                    ),
                    _buildListTile(
                      context,
                      title: 'Password',
                      icon: Icons.lock,
                      onTap: () {
                        // Navigate to password change screen or show modal dialog
                      },
                    ),
                    _buildListTile(
                      context,
                      title: 'Change Profile Image',
                      icon: Icons.image,
                      onTap: () {
                        // Navigate to profile image change screen or show modal dialog
                      },
                    ),
                    _buildListTile(
                      context,
                      title: 'Change Location',
                      icon: Icons.location_on,
                      onTap: () {
                        // Navigate to location change screen or show modal dialog
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListTile _buildListTile(BuildContext context, {required String title, String? subtitle, required IconData icon, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: ThemeConstants.primaryColor),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
