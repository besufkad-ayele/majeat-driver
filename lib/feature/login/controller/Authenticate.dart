import 'package:flutter/material.dart';
import 'package:majeat_driver/feature/MainOrder/view/homepage.dart';
import 'package:majeat_driver/feature/login/view/login_page.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Directory extends StatelessWidget {
  const Directory({super.key});

  Future<void> _checkAccessToken(BuildContext context) async {
    print('access token check'); 

    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');
    final userId = prefs.getString('data');
    print('access token: $accessToken');
    if (accessToken != null && accessToken.isNotEmpty) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const Homepage()));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const Loginpage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    
    // Check the access token as soon as the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkAccessToken(context);
    });

    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}



























// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:majeat/feature/home_page/data_model/food.dart';

// class FoodScreen extends StatefulWidget {
//   const FoodScreen({super.key});

//   @override
//   _FoodScreenState createState() => _FoodScreenState();
// }

// class _FoodScreenState extends State<FoodScreen> {
//   Future<List<Food>>? _newFoodList;

//   @override
//   void initState() {
//     super.initState();
//     _newFoodList = loadNewFoodList();
//   }
// //show me all the neccessary steps i needed


//   Future<List<Food>> loadNewFoodList() async {
//     final List<dynamic> jsonData =
//         json.decode(await rootBundle.loadString('assets/data/food.json'));
//     List<Food> foodList = [];
//     foodList = jsonData
//         .map((item) => Food.fromMap(item as Map<String, dynamic>))
//         .toList();
//     return foodList;
//   }
// // which is better

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Food Details'),
//       ),
//       body: FutureBuilder<List<Food>>(
//         future: _newFoodList,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (snapshot.hasData) {
//             final foodList = snapshot.data!;
//             return ListView.builder(
//               itemCount: foodList.length,
//               itemBuilder: (context, index) {
//                 final food = foodList[index];
//                 return Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         width: 100,
//                         height:100,
//                         child: Image.network(food.imageUrl),
//                       ),
//                       const SizedBox(height: 16),
//                       Text(
//                         food.name,
//                         style: const TextStyle(
//                             fontSize: 24, fontWeight: FontWeight.bold),
//                       ),
//                       const SizedBox(height: 8),
//                       Text('Category: ${food.category.name}'),
//                       const SizedBox(height: 8),
//                       Text('Description: ${food.description}'),
//                       const SizedBox(height: 8),
//                       Text('Price: \$${food.price}'),
//                       const SizedBox(height: 8),
//                       Text('Calories: ${food.calories} kcal'),
//                       const SizedBox(height: 8),
//                       Text(
//                           'Discount: ${food.discount != null ? '${food.discount! * 100}%' : 'None'}'),
//                     ],
//                   ),
//                 );
//               },
//             );
//           } else {
//             return const Center(child: Text('No data'));
//           }
//         },
//       ),
//     );
//   }
// }
