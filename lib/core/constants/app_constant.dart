import 'package:flutter/material.dart';

import 'theme_constants.dart';

class AppConstant {


  //Padding
  static const double defaultPadding =16;

  // Text Styles
  static const TextStyle headingStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color:ThemeConstants.accentColor,
  );   
  //food name
  static const TextStyle food_name = TextStyle(
    fontSize: 30,
    overflow: TextOverflow.fade,
    fontWeight: FontWeight.bold,
    color: ThemeConstants.bodyTextColor,
  );  
  
  static const TextStyle center_content_header = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w900,
    color: Colors.black87,
    decoration: TextDecoration.none,
      );  
      
      static  TextStyle center_content_description = const TextStyle(
    fontSize: 20,
    fontStyle: FontStyle.italic,
    textBaseline: TextBaseline.ideographic,
    fontWeight: FontWeight.normal,
    color: Colors.black54,

      );
    static const TextStyle headingsubTitle = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w700,
    color: ThemeConstants.secondaryColor,
  );   
   static const TextStyle continue_center = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w700,
    color: ThemeConstants.btnColor,
    shadows: [
      Shadow(
        blurRadius: 10.0,
        color: Color(0x00ffffff),
        offset: Offset(5.0, 5.0),
      ),
    ],
  );

  static const TextStyle bodyStyle = TextStyle(
    fontSize: 16,
    color: Colors.black,
  );

  // Strings
  static const String appName = 'Flutter Constants App';
  static const String welcomeMessage = 'Welcome to Flutter Constants App!';



  // Size
}
