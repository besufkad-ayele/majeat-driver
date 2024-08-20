import 'package:flutter/material.dart';
import 'package:majeat_driver/feature/MainOrder/view/mainpage.dart';
import 'package:majeat_driver/feature/profile/presentation/pages/profile.dart';
import 'package:majeat_driver/feature/search/view/searchpage.dart';
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    Mainpage(),
    Searchpage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.grey,size: 30),
            label: 'Home',
           
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.content_paste_search_rounded,color: Colors.grey,size: 30),
            label: 'order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,color: Colors.grey,size: 30),
            label: 'Profile' ,
          ),
        ],
      ),
      body: _pages[_currentIndex],
    );
  }
}
