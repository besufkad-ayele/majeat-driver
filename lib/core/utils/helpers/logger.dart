import 'package:logger/logger.dart';

class AppLogger {
  static logError(
    String titile,
    String path,
    String error,
  ) {
    Logger().e("$titile\n$path\n\n$error");
  }

  static logContent(
    String titile,
    String path,
    String data,
  ) {
    Logger().d("$titile\n$path\n\n$data");
  }
}
