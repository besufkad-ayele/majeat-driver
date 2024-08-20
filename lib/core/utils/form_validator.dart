


import '../constants/regex_constants.dart';

class FormValidator {
  static String? validateValue({required String inputValue}) {
    if (inputValue.trim().isEmpty) {
      return 'Value is required.';
    }

    if (!RegExp(RegexConstants.nameRegex).hasMatch(inputValue)) {
      return 'Invalid value.';
    }

    return null;
  }

  static String? validateNationalId({required String inputValue}) {
    if (inputValue.trim().isEmpty) {
      return 'National Id is required.';
    }

    if (!RegExp(RegexConstants.nationalIdRegex).hasMatch(inputValue)) {
      return 'Invalid National ID. Please make sure you are using the FCN number.';
    }

    return null;
  }

  static String? validateBranch({required String inputValue}) {
    if (inputValue.trim().isEmpty || inputValue.trim() == "hint.tapToSelect") {
      return 'Branch is required.';
    }

    return null;
  }

  static String? validateConfirmPassword({required String inputValue, required String originalinput}) {
    if (inputValue.trim().isEmpty || originalinput.trim().isEmpty) {
      return 'This field is required.';
    }
    if (!RegExp(RegexConstants.passwordRegex).hasMatch(inputValue)) {
      return 'Password must be at least 4 characters long';
    }
    if (inputValue != originalinput) {
      return 'Passwords must match';
    }

    return null;
  }

  static String? validateRegion({required String inputValue}) {
    if (inputValue.trim().isEmpty || inputValue.trim() == "hint.tapToSelect") {
      return 'Region is required.';
    }

    return null;
  }

  static String? validateSecurityQuestion({required String inputValue}) {
    if (inputValue.trim().isEmpty || inputValue.trim() == "hint.tapToSelect") {
      return 'Security Question is required.';
    }

    return null;
  }

  static String? validateAccountNumber({required String inputValue}) {
    if (inputValue.trim().isEmpty) {
      return 'Account number is required.';
    }

    if (!RegExp(RegexConstants.accountNumberRegex).hasMatch(inputValue)) {
      return 'Invalid account number.';
    }

    return null;
  }

  static String? validateName({required String inputValue}) {
    if (inputValue.trim().isEmpty) {
      return 'Name is required.';
    }

    if (!RegExp(RegexConstants.nameRegex).hasMatch(inputValue)) {
      return 'Invalid name value.';
    }

    return null;
  }

  static String? validateHexColor({required String inputValue}) {
    if (inputValue.trim().isEmpty) {
      return 'Color is required.';
    }

    if (!RegExp(RegexConstants.hexColorRegex).hasMatch(inputValue)) {
      return 'Color value is invalid.';
    }

    return null;
  }

  static String? validateEmailAddress({required String inputValue}) {
    if (inputValue.trim().isEmpty) {
      return 'Email address is required.';
    }

    if (!RegExp(RegexConstants.emailRegex).hasMatch(inputValue)) {
      return 'Invalid email address.';
    }

    return null;
  }

  static String? validatePhoneNumber({required String inputValue}) {
    if (inputValue.trim().isEmpty) {
      return 'Mobile number is required.';
    }
    if (!RegExp(RegexConstants.phoneNumberRegex).hasMatch(inputValue)) {
      return 'Mobile number must start with 09 or 07';
    }

    return null;
  }

  static String? validateTelePhoneNumber({required String inputValue}) {
    if (inputValue.trim().isEmpty) {
      return 'Mobile number is required.';
    }
    if (!RegExp(r'^[09]\d{9}$').hasMatch(inputValue)) {
      return 'Mobile number must start with 09 and be 9 digits';
    }

    return null;
  }

  static String? validateSafaricomPhoneNumber({required String inputValue}) {
    if (inputValue.trim().isEmpty) {
      return 'Mobile number is required.';
    }
    if (!RegExp(r'^[07]\d{9}$').hasMatch(inputValue)) {
      return 'Mobile number must start with 07 and be 9 digits';
    }

    return null;
  }

  static String? validatePassword({required String inputValue}) {
    if (inputValue.trim().isEmpty) {
      return 'Password is required.';
    }
    if (!RegExp(RegexConstants.passwordRegex).hasMatch(inputValue)) {
      return 'Password must be at least 4 characters long';
    }

    return null;
  }

  static String? validateURL({required String inputValue}) {
    if (inputValue.trim().isEmpty) {
      return 'URL is required.';
    }
    if (!RegExp(RegexConstants.urlRegex).hasMatch(inputValue)) {
      return 'Invalid URL';
    }

    return null;
  }

  static String? validateOTP({required String inputValue}) {
    if (inputValue.trim().isEmpty) {
      return 'OTP is required.';
    }

    if (!RegExp(RegexConstants.otpRegex).hasMatch(inputValue)) {
      return 'Invalid OTP value.';
    }

    return null;
  }

  static String? validateSecurityAnswer(String securityanswer) {
    if (securityanswer.trim().isEmpty) {
      return 'Can not be empty';
      // return getTranslated(context, "validation.answerCanNotBeEmpty");
    }
    return null;
  }

  static String? validateImei({required String inputValue}) {
    if (inputValue.trim().isEmpty) {
      return 'IMEI is required.';
    }

    if (!RegExp(RegexConstants.imeiRegex).hasMatch(inputValue)) {
      return 'Invalid 15 digit IMEI value.';
    }

    return null;
  }

  static String? validateLoanAmount({required String inputValue, required double maxLimit, required double minimimLimit}) {
    if (inputValue.trim().isEmpty) {
      return 'Loan amount is required.';
    }

    if (double.tryParse(inputValue) == null) {
      return 'Amount can only be a number';
    }

    if (double.parse(inputValue) > maxLimit) {
      return 'Loan amount can not be more than poroduct limit or credit score';
    }

    if (double.parse(inputValue) < minimimLimit) {
      return 'Loan amount can not be less than poroduct limit';
    }

    return null;
  }

  static String? validateAirtimeAmount({required String inputValue, required double maxLimit}) {
    if (inputValue.trim().isEmpty) {
      return 'Recharge amount is required.';
    }

    if (double.tryParse(inputValue) == null) {
      return 'Amount can only be a number';
    }

    if (double.parse(inputValue) > maxLimit) {
      return 'Recharge amount can not be more than credit score';
    }

    if (double.parse(inputValue) < 5) {
      return 'Loan amount can not be less than poroduct limit';
    }

    return null;
  }
}
