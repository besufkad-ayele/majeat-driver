// import 'package:alegnta_mobile/core/shared/models/language_model.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/foundation.dart';
// import 'package:logger/logger.dart';

// class MasterProvider with ChangeNotifier {
//   String _selectedLocal = "en";

//   ConnectivityResult? _connectionStatus;

//   String get selectedLocal => _selectedLocal;

//   bool get isConnected => _connectionStatus != ConnectivityResult.none;

//   set selectedLocal(String value) {
//     _selectedLocal = value;
//     notifyListeners();
//   }

//   LanguageModel? systemLanguage;
//   get getSystemLanguage => systemLanguage;
//   set setSystemLanguage(LanguageModel language) {
//     systemLanguage = language;
//   }

//   MasterProvider() {
//     Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
//       _connectionStatus = result;
//       Logger().i(result);
//       notifyListeners();
//     });

//     // Initial check for connectivity status
//     Connectivity().checkConnectivity().then((result) {
//       _connectionStatus = result;
//       notifyListeners();
//     });
//   }
// }
