import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../constants/api_config.dart';
import '../utils/error/api_failure.dart';
import '../utils/error/failure.dart';
import '../utils/typedef.dart';


class DioService {
  static final Dio _dioInstance = Dio(
    BaseOptions(
      baseUrl: APIConfig.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(minutes: 3),
      receiveTimeout: const Duration(minutes: 3),
    ),
  );

  static void _initializeInterceptors({
    bool isFormUrl = false,
    String? accessToken,
  }) {
    // Clear existing interceptors
    _dioInstance.interceptors.clear();

    // Add new interceptor with provided parameters
    _dioInstance.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.headers['accept'] = 'application/json';
          options.headers['Content-Type'] = isFormUrl
              ? 'application/x-www-form-urlencoded;charset=utf-8'
              : 'application/json;charset=utf-8';
          if (accessToken != null) {
            options.headers['Authorization'] = 'Bearer $accessToken';
          }

          options.headers['X-Content-Type-Options'] = 'nosniff';
          options.headers['X-Frame-Options'] = 'DENY';
          options.headers['X-XSS-Protection'] = '1; mode=block';

          return handler.next(options);
        },
        // Add onResponse and onError if needed
        // onResponse: (options, handler){
        //   if(options.statusCode == 401){
        //     DioService.post(path: "refreshPath", data: { //here the refresh path will be changed to real working api path
        //       "refreshToken": "refresh",   //here the refresh token will be sent from the sharedPrefernce
        //     });
        //   }
        //   return handler.next(options);
        // }
      ),
    );
  }

  static FutureResult<Map<String, dynamic>> post({
    required String path,
    Object? data,
    bool isFormUrl = false,
    String? accessToken,
  }) async {
    try {
      _initializeInterceptors(isFormUrl: isFormUrl, accessToken: accessToken);
      Logger().d("${_dioInstance.options.baseUrl}$path\nSent data - $data");
      final response = await _dioInstance.post(path, data: data);
      Logger().d(response.data);
      if (response.statusCode == 200) {
        return Right(
          response.data != null
              ? response.data != ""
                  ? response.data as Map<String, dynamic>
                  : {}
              : {},
        );
      } else {
        return Left(ApiFailure(message: response.data["message"]));
      }
    } on DioException catch (e) {
      Logger().e(
          "Method - ${e.requestOptions.method}\nPath - ${e.requestOptions.path}\nData Sent - ${jsonEncode(e.requestOptions.data)}\nResponse code - ${e.response?.statusCode}\nResponse - ${e.response}\nException Type - ${e.type}");

      return Left(
        ApiFailure(
          message: e.response?.data['message'] != null
              ? e.response!.data['message'].toString()
              : "Unable to process your request. Please try again!",
        ),
      );
    } catch (e) {
      Logger().e(e);

      return Left(ApiFailure(message: e.toString()) as Failure);
    }
  }

  static FutureResult<Map<String, dynamic>> put({
    required String path,
    Map<String, dynamic>? data,
    bool isFormUrl = false,
    String? accessToken,
  }) async {
    try {
      _initializeInterceptors(isFormUrl: isFormUrl, accessToken: accessToken);
      Logger().d("${_dioInstance.options.baseUrl}$path");
      Logger().d(data);
      final response = await _dioInstance.put(path, data: data);
      Logger().d(response.data);

      return Right(
        response.data != null
            ? response.data != ""
                ? response.data as Map<String, dynamic>
                : {}
            : {},
      );
    } on DioException catch (e) {
      Logger().e(
          "Method - ${e.requestOptions.method}\nPath - ${e.requestOptions.path}\nData Sent - ${jsonEncode(e.requestOptions.data)}\nResponse code - ${e.response?.statusCode}\nResponse - ${e.response}\nException Type - ${e.type}");

      return Left(
        ApiFailure(
          message: e.response?.data['errors'] != null
              ? e.response!.data['errors'][0].toString()
              : "Unable to process your request. Please try again!",
        ) as Failure,
      );
    } catch (e) {
      Logger().e(e);

      return Left(ApiFailure(message: e.toString()) as Failure);
    }
  }

  static FutureResult<Map<String, dynamic>> get({
    required String path,
    Map<String, dynamic>? queryParameter,
    bool isFormUrl = false,
    String? accessToken,
  }) async {
    try {
      _initializeInterceptors(isFormUrl: isFormUrl, accessToken: accessToken);
      Logger().d("${_dioInstance.options.baseUrl}$path");

      if (queryParameter != null) {
        Logger().d(queryParameter);
      }

      final response =
          await _dioInstance.get(path, queryParameters: queryParameter);
      Logger().d(response.data);

      Map<String, dynamic> data = {};
      if (response.data is List) {
        data["responseContent"] = response.data;
      }

      return Right(
        response.data != null
            ? response.data != ""
                ? response.data as Map<String, dynamic>
                : {}
            : {},
      );
    } on DioException catch (e) {
      Logger().e(
          "Method - ${e.requestOptions.method}\nPath - ${e.requestOptions.path}\nData Sent - ${jsonEncode(e.requestOptions.data)}\nResponse code - ${e.response?.statusCode}\nResponse - ${e.response}\nException Type - ${e.type}");

      return Left(
        ApiFailure(
          message: e.response?.data['errors'] != null
              ? e.response!.data['errors'][0].toString()
              : "Unable to process your request. Please try again!",
        ) as Failure,
      );
    } catch (e) {
      Logger().e(e);

      return Left(ApiFailure(message: e.toString()) as Failure);
    }
  }

  static FutureResult<Map<String, dynamic>> delete({
    required String path,
    Map<String, dynamic>? queryParameters,
    bool isFormUrl = false,
    String? accessToken,
  }) async {
    try {
      _initializeInterceptors(isFormUrl: isFormUrl, accessToken: accessToken);
      Logger().d("${_dioInstance.options.baseUrl}$path");

      if (queryParameters != null) {
        Logger().d(queryParameters);
      }

      final response =
          await _dioInstance.delete(path, queryParameters: queryParameters);
      Logger().d(response.data);

      return Right(
        response.data != null
            ? response.data != ""
                ? response.data as Map<String, dynamic>
                : {}
            : {},
      );
    } on DioException catch (e) {
      Logger().e(
          "Method - ${e.requestOptions.method}\nPath - ${e.requestOptions.path}\nResponse code - ${e.response?.statusCode}\nResponse - ${e.response}\nException Type - ${e.type}");

      return Left(
        ApiFailure(
          message: e.response?.data['errors'] != null
              ? e.response!.data['errors'][0].toString()
              : "Unable to process your request. Please try again!",
        ) as Failure,
      );
    } catch (e) {
      Logger().e(e);

      return Left(ApiFailure(message: e.toString()) as Failure);
    }
  }
}
