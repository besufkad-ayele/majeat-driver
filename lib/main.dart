import 'package:flutter/material.dart';
import 'package:majeat_driver/feature/login/controller/Authenticate.dart';
import 'package:majeat_driver/feature/login/controller/login_controller.dart';
import 'package:majeat_driver/feature/profile/presentation/pages/profile.dart';
import 'package:majeat_driver/feature/search/view/searchpage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LoginController>(
          create: (_) => LoginController(),
        ),
      ],
      child: MaterialApp(
      title: 'Bottom Navigation Example',
      initialRoute: '/',
      routes: {
        '/': (context) => Directory(),
        '/search': (context) => Searchpage(),
        '/profile': (context) => ProfilePage(),
      },
    ),
    );
  }
}
