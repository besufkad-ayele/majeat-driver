// import 'package:alegnta_mobile/core/constants/api_config.dart';
// import 'package:alegnta_mobile/core/constants/app_constants.dart';
// import 'package:alegnta_mobile/core/constants/button_constants.dart';
// import 'package:alegnta_mobile/core/services/dio_service.dart';
// import 'package:alegnta_mobile/core/shared/models/loan_estimation_model/loan_estimation_model.dart';
// import 'package:alegnta_mobile/core/shared/state/button_provider.dart';
// import 'package:alegnta_mobile/core/utils/error/api_failure.dart';
// import 'package:alegnta_mobile/core/utils/helpers/logger.dart';
// import 'package:alegnta_mobile/core/utils/typedef.dart';
// import 'package:alegnta_mobile/features/authentication/state/authentication_provider.dart';
// import 'package:alegnta_mobile/features/dashboard/data/active_loans_model/loan.dart';
// import 'package:alegnta_mobile/features/dashboard/state/dashboard_provider.dart';
// import 'package:alegnta_mobile/features/cash_loan/state/products_provider.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter/material.dart';
// import 'package:logger/logger.dart';

// class LoanProvider with ChangeNotifier {
//   LoanEstimationModel? _loanEstimationModel;

//   LoanEstimationModel? get loanEstimationModel => _loanEstimationModel;

//   set loanEstimationModel(LoanEstimationModel? value) {
//     _loanEstimationModel = value;
//   }

//   ButtonProvider buttonProvider;
//   AuthenticationProvider authenticationProvider;
//   ProductsProvider productsProvider;
//   DashboardProvider dashboardProvider;
//   LoanProvider({
//     required this.buttonProvider,
//     required this.authenticationProvider,
//     required this.productsProvider,
//     required this.dashboardProvider,
//   });

//   FutureResult<bool> getLoanEstimation({required double loanAmount, bool loading = true}) async {
//     try {
//       if (loading) {
//         buttonProvider.setButtonState(
//           ButtonConstants.getEstimationButton,
//           ButtonState.loading,
//         );
//       } else {
//         buttonProvider.setButtonState(
//           ButtonConstants.nextButton,
//           ButtonState.loading,
//         );
//       }

//       final getLoanEstimationResponse = await DioService.post(
//         accessToken: authenticationProvider.loginResponse?.accessToken,
//         path: "${APIConfig.getEstimationPath}",
//         data: {
//           "originatedAmount": loanAmount,
//           "productId": productsProvider.activeProduct?.id,
//         },
//       );

//       return getLoanEstimationResponse.fold(
//         (l) {
//           if (loading) {
//             buttonProvider.setButtonState(
//               ButtonConstants.getEstimationButton,
//               ButtonState.active,
//             );
//           } else {
//             buttonProvider.setButtonState(
//               ButtonConstants.nextButton,
//               ButtonState.active,
//             );
//           }

//           return Left(ApiFailure(message: l.message));
//         },
//         (response) {
//           _loanEstimationModel = LoanEstimationModel.fromMap(response);

//           if (loading) {
//             buttonProvider.setButtonState(
//               ButtonConstants.getEstimationButton,
//               ButtonState.active,
//             );
//           } else {
//             buttonProvider.setButtonState(
//               ButtonConstants.nextButton,
//               ButtonState.active,
//             );
//           }

//           return Right(true);
//         },
//       );
//     } catch (e) {
//       AppLogger.logError(
//         "Get Loan Estimation",
//         "Loan Provider",
//         e.toString(),
//       );

//       if (loading) {
//         buttonProvider.setButtonState(
//           ButtonConstants.getEstimationButton,
//           ButtonState.active,
//         );
//       } else {
//         buttonProvider.setButtonState(
//           ButtonConstants.nextButton,
//           ButtonState.active,
//         );
//       }

//       return Left(ApiFailure(message: e.toString()));
//     }
//   }

//   FutureResult<bool> payForLoan({
//     required List<Loan> loans,
//     required double amount,
//     required bool isAll,
//   }) async {
//     try {
//       buttonProvider.setButtonState(
//         ButtonConstants.payLoanButton,
//         ButtonState.loading,
//       );

//       for (Loan loan in loans) {
//         // Logger().d({
//         //   "loanId": loan.loanId,
//         //   "amount": amount,
//         // });

//         // buttonProvider.setButtonState(
//         //   ButtonConstants.payLoanButton,
//         //   ButtonState.active,
//         // );

//         // return Left(ApiFailure(message: "something"));

//         if (loan.status == AppConstants.activeLoan) {
//           final loanRepaymentApiResponse = await DioService.post(
//             accessToken: authenticationProvider.loginResponse?.accessToken,
//             path: "${APIConfig.loanRepaymentPath}",
//             data: {
//               "loanId": loan.id,
//               "amount": isAll ? loan.totalOutstandingAmount : amount,
//             },
//           );

//           return loanRepaymentApiResponse.fold(
//             (l) {
//               buttonProvider.setButtonState(
//                 ButtonConstants.payLoanButton,
//                 ButtonState.active,
//               );

//               return Left(ApiFailure(message: l.message));
//             },
//             (response) {
//               buttonProvider.setButtonState(
//                 ButtonConstants.payLoanButton,
//                 ButtonState.active,
//               );

//               return Right(true);
//             },
//           );
//         }
//       }

//       return Left(ApiFailure(message: "Something went wrong. Please try again"));
//     } catch (e) {
//       AppLogger.logError(
//         "Create Loan",
//         "Loan Provider",
//         e.toString(),
//       );

//       buttonProvider.setButtonState(
//         ButtonConstants.payLoanButton,
//         ButtonState.active,
//       );

//       return Left(ApiFailure(message: e.toString()));
//     }
//   }

//   FutureResult<bool> applyForCashLoan() async {
//     try {
//       buttonProvider.setButtonState(
//         ButtonConstants.applyForLoanButton,
//         ButtonState.loading,
//       );

//       // Logger().d({
//       //   "originatedAmount": loanEstimationModel?.loanInfo?.originatedAmount,
//       //   "loanCategoryId": dashboardProvider.activeCategory?.id,
//       //   "productId": productsProvider.activeProduct?.id,
//       // });

//       // return Left(ApiFailure(message: "something"));

//       final createLoanApiResponse = await DioService.post(
//         accessToken: authenticationProvider.loginResponse?.accessToken,
//         path: "${APIConfig.createCashLoanPath}",
//         data: {
//           "originatedAmount": loanEstimationModel?.loan?.originatedAmount,
//           "loanCategoryId": dashboardProvider.activeCategory?.id,
//           "productId": productsProvider.activeProduct?.id,
//         },
//       );

//       return createLoanApiResponse.fold(
//         (l) {
//           buttonProvider.setButtonState(
//             ButtonConstants.applyForLoanButton,
//             ButtonState.active,
//           );

//           return Left(ApiFailure(message: l.message));
//         },
//         (response) {
//           _loanEstimationModel = LoanEstimationModel.fromMap(response);

//           buttonProvider.setButtonState(
//             ButtonConstants.applyForLoanButton,
//             ButtonState.active,
//           );

//           return Right(true);
//         },
//       );
//     } catch (e) {
//       AppLogger.logError(
//         "Create Loan",
//         "Loan Provider",
//         e.toString(),
//       );

//       buttonProvider.setButtonState(
//         ButtonConstants.applyForLoanButton,
//         ButtonState.active,
//       );

//       return Left(ApiFailure(message: e.toString()));
//     }
//   }

//   FutureResult<bool> applyAirtimeLoan({required String recipient, required int airtimeAmount}) async {
//     try {
//       // Logger().d({
//       //   "originatedAmount": airtimeAmount,
//       //   "loanCategoryId": dashboardProvider.activeCategory?.id,
//       //   "productId": productsProvider.activeProduct?.id,
//       //   "airtimeRecipient": recipient,
//       // });

//       // buttonProvider.setButtonState(
//       //   ButtonConstants.applyForLoanButton,
//       //   ButtonState.active,
//       // );

//       // return Left(ApiFailure(message: "something"));

//       final createLoanApiResponse = await DioService.post(
//         accessToken: authenticationProvider.loginResponse?.accessToken,
//         path: "${APIConfig.createVasLoanPath}",
//         data: {
//           "originatedAmount": airtimeAmount,
//           "loanCategoryId": dashboardProvider.activeCategory?.id,
//           "productId": productsProvider.activeProduct?.id,
//           "airtimeRecipient": recipient,
//         },
//       );

//       return createLoanApiResponse.fold(
//         (l) {
//           return Left(ApiFailure(message: l.message));
//         },
//         (response) {
//           _loanEstimationModel = LoanEstimationModel.fromMap(response);

//           return Right(true);
//         },
//       );
//     } catch (e) {
//       AppLogger.logError(
//         "Create Loan",
//         "Loan Provider",
//         e.toString(),
//       );

//       buttonProvider.setButtonState(
//         ButtonConstants.applyForLoanButton,
//         ButtonState.active,
//       );

//       return Left(ApiFailure(message: e.toString()));
//     }
//   }

//   FutureResult<bool> applyForMerchantLoan({
//     required String merchantUserId,
//     required double billAmount,
//   }) async {
//     try {
//       // Logger().i({
//       //   "merchantUserId": merchantUserId,
//       //   "amount": billAmount,
//       //   "productId": productsProvider.activeProduct?.id,
//       // });

//       // buttonProvider.setButtonState(
//       //   ButtonConstants.applyForLoanButton,
//       //   ButtonState.active,
//       // );

//       // return Left(ApiFailure(message: "something"));

//       final createLoanApiResponse = await DioService.post(
//         accessToken: authenticationProvider.loginResponse?.accessToken,
//         path: "${APIConfig.createCreditPayLoanPath}",
//         data: {
//           "merchantUserId": merchantUserId,
//           "amount": billAmount,
//           "productId": productsProvider.activeProduct?.id,
//         },
//       );

//       return createLoanApiResponse.fold(
//         (l) {
//           return Left(ApiFailure(message: l.message));
//         },
//         (response) {
//           _loanEstimationModel = LoanEstimationModel.fromMap(response);

//           return Right(true);
//         },
//       );
//     } catch (e) {
//       AppLogger.logError(
//         "Pay Merchant Loan",
//         "Loan Provider",
//         e.toString(),
//       );

//       buttonProvider.setButtonState(
//         ButtonConstants.applyForLoanButton,
//         ButtonState.active,
//       );

//       return Left(ApiFailure(message: e.toString()));
//     }
//   }

//   FutureResult<bool> applyForDeviceQR() async {
//     try {
//       // Logger().i({
//       //   "merchantUserId": merchantUserId,
//       //   "amount": billAmount,
//       //   "productId": productsProvider.activeProduct?.id,
//       // });

//       // buttonProvider.setButtonState(
//       //   ButtonConstants.applyForLoanButton,
//       //   ButtonState.active,
//       // );

//       // return Left(ApiFailure(message: "something"));

//       final createLoanApiResponse = await DioService.get(
//         accessToken: authenticationProvider.loginResponse?.accessToken,
//         path: "${APIConfig.generateDeviceQRPath}",
//       );

//       return createLoanApiResponse.fold(
//         (l) {
//           return Left(ApiFailure(message: l.message));
//         },
//         (response) {
//           return Right(true);
//         },
//       );
//     } catch (e) {
//       AppLogger.logError(
//         "Pay Merchant Loan",
//         "Loan Provider",
//         e.toString(),
//       );

//       buttonProvider.setButtonState(
//         ButtonConstants.applyForLoanButton,
//         ButtonState.active,
//       );

//       return Left(ApiFailure(message: e.toString()));
//     }
//   }

//   FutureResult<bool> proceddBookedDeviceLoan({required String loandId, required String action}) async {
//     try {
//       // Logger().i({
//       //   "loanId": loandId,
//       //   "action": action,
//       // });

//       // return Left(ApiFailure(message: "something"));

//       final proceddBookedDeviceLoanApiResponse = await DioService.post(
//         accessToken: authenticationProvider.loginResponse?.accessToken,
//         path: "${APIConfig.processBookedDeviceLoanPath}",
//         data: {
//           "loanId": loandId,
//           "action": action,
//         },
//       );

//       return proceddBookedDeviceLoanApiResponse.fold(
//         (l) {
//           return Left(ApiFailure(message: l.message));
//         },
//         (response) {
//           return Right(true);
//         },
//       );
//     } catch (e) {
//       AppLogger.logError(
//         "Process Booked Device Loan",
//         "Loan Provider",
//         e.toString(),
//       );

//       buttonProvider.setButtonState(
//         ButtonConstants.applyForLoanButton,
//         ButtonState.active,
//       );

//       return Left(ApiFailure(message: e.toString()));
//     }
//   }

//   FutureResult<bool> cancelDeviceQr() async {
//     try {
//       final cancelDeviceQrApiResponse = await DioService.put(
//         accessToken: authenticationProvider.loginResponse?.accessToken,
//         path: "${APIConfig.getCreatedDeviceQRPath}",
//       );

//       return cancelDeviceQrApiResponse.fold(
//         (l) {
//           return Left(ApiFailure(message: l.message));
//         },
//         (response) {
//           return Right(true);
//         },
//       );
//     } catch (e) {
//       AppLogger.logError(
//         "Process Booked Device Loan",
//         "Loan Provider",
//         e.toString(),
//       );

//       buttonProvider.setButtonState(
//         ButtonConstants.applyForLoanButton,
//         ButtonState.active,
//       );

//       return Left(ApiFailure(message: e.toString()));
//     }
//   }
// }
