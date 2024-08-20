// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:alegnta_mobile/core/shared/models/language_model.dart';
// import 'package:flutter/material.dart';

// class LocalizationProvider with ChangeNotifier {
//   final List<LanguageModel> _systemLanguages = [
//     LanguageModel(
//         name: 'English', code: 'en', country: 'US', color: Colors.white.value),
//     LanguageModel(
//         name: 'አማርኛ', code: 'am', country: 'ET', color: Colors.white70.value),
//     LanguageModel(
//         name: 'Afaan\nOromo',
//         code: 'or',
//         country: 'ET',
//         color: Colors.white70.value),
//     LanguageModel(
//         name: 'ትግርኛ', code: 'tg', country: 'ET', color: Colors.white70.value),
//     // Language(name: 'Somali', code: 'sm', country: 'ET', color: Colors.white70.value),
//   ];

//   Locale _locale = const Locale('en', 'US');
//   late LanguageModel _activeLanguage;

//   Locale get getLocale => _locale;
//   LanguageModel get activeLanguage => _activeLanguage;

//   List<LanguageModel> get systemLanguages => _systemLanguages;

//   LocalizationProvider() {
//     _activeLanguage = _systemLanguages.first;
//   }

//   set setLanguageLocale(LanguageModel language) {
//     _locale = Locale(language.code ?? "en", language.country);
//     notifyListeners();
//   }

//   set activeLanguage(LanguageModel selectedLanguage) {
//     for (int i = 0; i < _systemLanguages.length; i++) {
//       if (_systemLanguages[i].code == selectedLanguage.code) {
//         _systemLanguages[i] =
//             _systemLanguages[i].copyWith(color: Colors.white.value);
//         _activeLanguage = _systemLanguages[i];
//       } else {
//         _systemLanguages[i] =
//             _systemLanguages[i].copyWith(color: Colors.white70.value);
//       }
//     }

//     notifyListeners();
//   }
// }
