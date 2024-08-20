import 'package:flutter/material.dart';
import 'package:majeat_driver/core/constants/theme_constants.dart';
import 'package:majeat_driver/core/shared/widgets/custom_floating_action_button.dart';
import 'package:majeat_driver/feature/login/controller/login_controller.dart';
import 'package:majeat_driver/feature/login/view/login_page.dart';
import 'package:majeat_driver/feature/profile/presentation/pages/account_page.dart';
import 'package:majeat_driver/feature/profile/presentation/pages/payment_page.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // here override init state
  @override
  void initState() {
    super.initState();
    getprofile();    
  }  

 void getprofile( ) async {
    LoginController loginController = Provider.of<LoginController>(context, listen: false);
    await loginController.getDriverProfile();
  }

  @override
  Widget build(BuildContext context) {

 
    LoginController loginController = Provider.of<LoginController>(context);

    final String name = loginController.signedinUser.name ?? "dummy";
    final String emailOrPhone =  loginController.signedinUser.email ?? 'dummy@.com';
    String avatarUrl = loginController.signedinUser.image ??'https://images.pexels.com/photos/4029925/pexels-photo-4029925.jpeg?auto=compress&cs=tinysrgb&w=600';
    return Scaffold(
      backgroundColor: ThemeConstants.primaryColor  ,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 100),
            child: Column(
              children: [
                 CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(avatarUrl),
                ),
                const SizedBox(height: 16),
        
                // Name
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
        
                // Email or Phone
                Text(
                  emailOrPhone,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 16),
        
                // List of Clickable Items
                Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.account_circle),
                      title: const Text('Account Settings'),
                      onTap: () {
                        // Navigate to Account Settings
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AccountPage()),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.payment),
                      title: const Text('Payment Methods'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PaymentPage()),
                        );
                      },
                    ),
                      const SizedBox(
                      height: 150,
                    ),
                    CustomFloatingActionButton(
                        alignment: Alignment.bottomCenter,
                        onPressed: () async{
                                 final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        var token = sharedPreferences.getString("accessToken");
        if(token == null){
          print('@@@@@@@@@ no access token yet');

        }else{
          print("@@@@@@@@@@@2 access token : $token");
        }
        sharedPreferences.remove("accessToken");
                          Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Loginpage(),
                      ),
                    );
                        },
                        BtnTitile: ' LOG OUT'),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
