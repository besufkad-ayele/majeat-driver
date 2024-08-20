import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:majeat_driver/core/constants/api_config.dart';
import 'package:majeat_driver/core/services/dio_service.dart';
import 'package:majeat_driver/core/utils/error/api_failure.dart';
import 'package:majeat_driver/core/utils/helpers/logger.dart';
import 'package:majeat_driver/core/utils/typedef.dart';
import 'package:majeat_driver/feature/login/model/user_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends ChangeNotifier {
  User _signedinUser = User();
  User get signedinUser => _signedinUser;
  String message = "Message here";

  //get profile
    FutureResult<bool> getDriverProfile() async {
      print("getDriverProfile");
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
        print("getDriverProfile" + sharedPreferences.getString("accessToken").toString());
    var accessToken = sharedPreferences.getString("accessToken");
    try {
      // var userid = sharedPreferences.getString("userId");
      var userid = "2";
      final response = await DioService.get(
        path: "${APIConfig.baseUrl}${APIConfig.driverProfile}/${userid}",
        accessToken: "$accessToken",
      );

      return response.fold(
        (l) {
          Logger().e(l.message);
          return  Left(ApiFailure(message: l.message));
        },
        (r) {
          
          User tokenUser = User.fromMap(r["data"]);

          _signedinUser = User(
            userId: tokenUser.userId,
            name: tokenUser.name,
            email: tokenUser.email,
            phone: tokenUser.phone,
            image: tokenUser.image,
            location: tokenUser.location,
            driverType: tokenUser.driverType,
              );

          notifyListeners();
          return const Right(true);
        },
      );
    } catch (e) {
      AppLogger.logError(
        "Get User",
        "LOGIN CONTROLLER",
        e.toString(),
      );
      return Left(ApiFailure(message: e.toString()));
    }
  }
  
  
   // Method to handle login
  FutureResult<bool> login(String email, String password) async {
    try {
      final loginResponse = await DioService.post(
        path: "${APIConfig.baseUrl}${APIConfig.driverLogin}",
        data: {"email": email, "password": password},
      );

      final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

      return loginResponse.fold(
        (l) {
          print("loginResponse Left  $loginResponse");

          message = l.message;
          notifyListeners();
          Logger().e(message);
          return Left(ApiFailure(message: l.message));
        },
        (r) async {
          await sharedPreferences.setString("accessToken", r['accessToken']);
          await sharedPreferences.setStringList("data", r['data']);
          await sharedPreferences.setString("refreshToken", r['refreshToken']);

          message = r['message'];
          notifyListeners();
          return const Right(true);
        },
      );
    } catch (e) {
      AppLogger.logError(
        "Login Driver",
        "Login controller",
        e.toString(),
      );
      return Left(ApiFailure(message: e.toString()));
    }
  }
//   // Method to handle signup
//   FutureResult<bool> signup(String name, String email, String password) async {
//     try {
//       final signupResponse = await DioService.post(
//         path: "${APIConfig.baseUrl}${APIConfig.signupPath}",
//         data: {'name': name, 'email': email, 'password': password},
//       );
//       final SharedPreferences sharedPreferences =
//           await SharedPreferences.getInstance();
//       var token = sharedPreferences.getString("accessToken");
//       if (token == null) {
//         print('@@@@@@@@@1 no access token yet');
//       } else {
//         print("@@@@@@@@@@@2 access token : $token");
//       }

//       return signupResponse.fold(
//         (l) {
//           message = l.message;
//           notifyListeners();
//           Logger().e(l.message);
//           return left(ApiFailure(message: l.message));
//         },
//         (r) {
//           message = r['message'];
//           // _users =r['Data'];
//           notifyListeners();
//           return const Right(true);
//         },
//       );
//     } catch (e) {
// AppLogger.logError(
//         "signup",
//         "Login controller",
//         e.toString(),
//       );      return Left(ApiFailure(message: e.toString()));
//     }
//   }

// // Method to update user
// FutureResult<Map<String, dynamic>> updateUser(String id, Map<String, dynamic> data) async {
//   try {
//     final response = await DioService.put(
//       path: "${APIConfig.baseUrl}/users/$id",
//       data: data,
//     );
//     return response.fold(
//       (l) {
//         Logger().e(l.message);
//         return Left(ApiFailure(message: l.message));
//       },
//       (r) {
//         _signedinUser = User.fromMap(r['data']);
//         notifyListeners();
//         return Right({
//           "message": r['message'],
//           "data": _signedinUser
//         });
//       },
//     );
//   } catch (e) {
//     AppLogger.logError(
//         "update user",
//         "Login controller",
//         e.toString(),
//       );
//     return Left(ApiFailure(message: e.toString()));
//   }
// }



// // Method to delete user
// FutureResult<Map<String, dynamic>> deleteUser(String id) async {
//   try {
//     final response = await DioService.delete(
//       path: "${APIConfig.baseUrl}/users/$id",
//     );

//     return response.fold(
//       (l) {
//         Logger().e(l.message);
//         return Left(ApiFailure(message: l.message));
//       },
//       (r) {
//         _signedinUser = User();
//         notifyListeners();
//         return Right({
//           "message": r['message'],
//           "data": null
//         });
//       },
//     );
//   } catch (e) {
//     AppLogger.logError(
//         "delete user",
//         "Login controller",
//         e.toString(),
//       );
//     return Left(ApiFailure(message: e.toString()));
//   }
// }

  // FutureResult<bool> getUser() async {
  //   final SharedPreferences sharedPreferences =
  //       await SharedPreferences.getInstance();
  //   var accessToken = sharedPreferences.getString("accessToken");
  //   try {
  //     final response = await DioService.get(
  //       path: "${APIConfig.baseUrl}${APIConfig.driverLogin}",
  //       accessToken: "$accessToken",
  //     );
  //     print(response);
  //     return response.fold(
  //       (l) {
  //         Logger().e(l.message);
  //         return  Left(ApiFailure(message: l.message));
  //       },
  //       (r) {
  //         User tokenUser = User.fromMap(r["data"]);

  //         _signedinUser = User(
  //           userId: tokenUser.userId,
  //           name: tokenUser.name,
  //           email: tokenUser.email,
  //           phone: tokenUser.phone,
  //           image: tokenUser.image,
  //           location: tokenUser.location,
  //           driverType: tokenUser.driverType,
  //             );

  //         notifyListeners();
  //         return const Right(true);
  //       },
  //     );
  //   } catch (e) {
  //     AppLogger.logError(
  //       "Get User",
  //       "LOGIN CONTROLLER",
  //       e.toString(),
  //     );
  //     return Left(ApiFailure(message: e.toString()));
  //   }
  // }
  
}