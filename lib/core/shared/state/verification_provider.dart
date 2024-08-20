// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:alegnta_mobile/core/constants/api_config.dart';
// import 'package:alegnta_mobile/core/services/dio_service.dart';
// import 'package:alegnta_mobile/core/utils/error/api_failure.dart';
// import 'package:alegnta_mobile/core/utils/helpers/logger.dart';
// import 'package:alegnta_mobile/features/profile/data/otp/otp_request_model.dart';
// import 'package:alegnta_mobile/features/profile/data/otp/resend_otp_request_model.dart';
// import 'package:alegnta_mobile/features/profile/data/verifications/verification.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter/material.dart';

// import 'package:alegnta_mobile/core/shared/state/button_provider.dart';
// import 'package:alegnta_mobile/core/utils/helpers/local_calls.dart';
// import 'package:alegnta_mobile/core/utils/typedef.dart';
// import 'package:alegnta_mobile/features/authentication/state/authentication_provider.dart';

// class VerificationProvider with ChangeNotifier {
//   ButtonProvider buttonProvider;

//   AuthenticationProvider authenticationProvider;

//   Verification? _activeVerificationType;

//   Verification? get activeVerificationType => _activeVerificationType;

//   set activeVerificationType(Verification? value) {
//     _activeVerificationType = value;
//   }

//   VerificationProvider({
//     required this.buttonProvider,
//     required this.authenticationProvider,
//   });

//   FutureResult<bool> verifyOtp({
//     required OtpRequestModel otpRequestModel,
//   }) async {
//     try {
//       otpRequestModel = otpRequestModel.copyWith(
//         verificationTypeId: activeVerificationType?.verificationTypeId,
//         userId: authenticationProvider.loginResponse?.userId,
//       );

//       final verifyOtpApiResponse = await DioService.post(
//         path: "${APIConfig.verifyOtpRequestPath}",
//         data: otpRequestModel.toMap(),
//       );

//       return verifyOtpApiResponse.fold(
//         (l) {
//           return Left(ApiFailure(message: l.message));
//         },
//         (response) async {
//           if (response['status']) {
//             return Right(true);
//           } else {
//             return Left(
//               ApiFailure(message: "Unable to verify OTP. Please try again!"),
//             );
//           }
//         },
//       );
//     } catch (e) {
//       AppLogger.logError(
//         "Verify OTP",
//         "Authentication Provider",
//         e.toString(),
//       );

//       return Left(ApiFailure(message: e.toString()));
//     }
//   }

//   FutureResult<bool> resendOtp() async {
//     try {
//       final getDeviceIdResponse = await LocalCalls.getDeviceId(
//         authenticationProvider.phoneNumber ?? "",
//       );

//       return getDeviceIdResponse.fold(
//         (l) => Left(ApiFailure(message: "Unable to get device ID")),
//         (id) async {
//           //
//           final resendOtpApiResponse = await DioService.post(
//             path: "${APIConfig.resendOtpRequestPath}",
//             data: ResendOtpRequestModel(
//               deviceId: id,
//             ).toMap(),
//           );

//           return resendOtpApiResponse.fold(
//             (l) => Left(ApiFailure(message: l.message)),
//             (r) => Right(true),
//           );
//         },
//       );
//     } catch (e) {
//       AppLogger.logError(
//         "Resend OTP",
//         "Authentication Provider",
//         e.toString(),
//       );

//       return Left(ApiFailure(message: e.toString()));
//     }
//   }
// }
