import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../utils/error/api_failure.dart';
import '../utils/error/failure.dart';
import '../utils/helpers/local_calls.dart';
import '../utils/helpers/logger.dart';
import '../utils/typedef.dart';



class FileService {
  static FutureResult<Map<String, dynamic>> readJSON(
      {required String path}) async {
    try {
      final getFileContent = await LocalCalls.readFilesFromAssets(path);

      return getFileContent.fold(
        (l) {
          return Left(ApiFailure(message: l.message) as Failure);
        },
        (r) {
          return Right(jsonDecode(r));
        },
      );
    } catch (e) {
      AppLogger.logError(
        "File Service",
        "Read JSON",
        e.toString(),
      );

      return Left(ApiFailure(message: e.toString()) as Failure);
    }
  }
}
