

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:majeat_driver/core/utils/error/api_failure.dart';
import 'package:majeat_driver/core/utils/error/failure.dart';
import 'package:majeat_driver/core/utils/typedef.dart';


class LocalCalls {
  static Color getContrastingTextColor(Color backgroundColor) {
    // Calculate the luminance of the background color
    double luminance = backgroundColor.computeLuminance();

    // Return black text color for light backgrounds, and white for dark backgrounds
    return luminance > 0.5 ? Colors.black : Colors.white;
  }



  // static final NumberFormat currencyFormatterWithCode = NumberFormat.currency(
  //   locale: "en_US",
  //   symbol: "ETB ",
  // );
  
  static FutureResult<String> readFilesFromAssets(String path) async {
    FutureResult<String> getFile(String path) async {
      var file = await rootBundle.loadString(path);
      if (file != "") {
        return Right(file);
      } else {
        return const Left(ApiFailure(message: "file is empty") as Failure);
      }
    }

    var fetchedfile = await getFile(path);
    return fetchedfile.fold((l) {
      return Left(ApiFailure(message: l.message) as Failure);
    }, (r) {
      return Right(r);
    });
  }

  // static FutureResult<String> getDeviceId(String phoneNumber) async {
  //   DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  //   String deviceIdBase64 = '';

  //   try {
  //     if (Platform.isAndroid) {
  //       var androidInfo = await deviceInfoPlugin.androidInfo;
  //       deviceIdBase64 =
  //           base64.encode(utf8.encode('${phoneNumber}_${androidInfo.id}'));
  //       Logger().d(
  //           'Phone number $phoneNumber\nId ${androidInfo.id}\n\nDevice Id $deviceIdBase64');
  //     } else if (Platform.isWindows || Platform.isLinux) {
  //       var windowsInfo = await deviceInfoPlugin.windowsInfo;
  //       deviceIdBase64 = base64
  //           .encode(utf8.encode('${phoneNumber}_${windowsInfo.computerName}'));
  //       Logger().d(
  //           'Phone number $phoneNumber}\nId ${windowsInfo.computerName}\n\nDevice Id $deviceIdBase64');
  //     } else if (Platform.isIOS) {
  //       var iosInfo = await deviceInfoPlugin.iosInfo;
  //       deviceIdBase64 = base64.encode(
  //           utf8.encode('${phoneNumber}_${iosInfo.identifierForVendor}'));
  //       Logger().d(
  //           'Phone number $phoneNumber}\nId ${iosInfo.identifierForVendor}\n\nDevice Id $deviceIdBase64');
  //     } else {
  //       return Left(ApiFailure(message: "Unable to get Device ID"));
  //     }

  //     return Right(deviceIdBase64);
  //   } catch (e) {
  //     Logger().d('LocalCalls.getDeviceId error\n\n$e');
  //     return Left(ApiFailure(message: e.toString()));
  //   }
  // }

  // static String generateMd5(String input) {
  //   return md5.convert(utf8.encode(input)).toString();
  // }

  // static Color getStatucColor(String status) {
  //   if (status == "PROCESSING" || status == "UNREDEEMED") {
  //     return ThemeConstants.warningColor;
  //   }

  //   if (status == "ACTIVE") {
  //     return ThemeConstants.successColor;
  //   }

  //   if (status == "DEFAULT") {
  //     return ThemeConstants.errorColor;
  //   }

  //   return Colors.black;
  // }

}
