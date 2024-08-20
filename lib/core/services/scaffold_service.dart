import 'package:flutter/material.dart';

import '../constants/theme_constants.dart';

/// `ScaffoldService` is a utility class that provides static methods to display
/// different types of SnackBars in a Flutter application.
///
/// This class contains methods for showing error, warning, and success messages
/// through SnackBars, each with appropriate background colors defined in
/// `ThemeConstants`.
class ScaffoldService {
  /// Shows an error SnackBar with a custom message.
  ///
  /// [context] is the BuildContext where the SnackBar will be displayed.
  /// [message] is the String content to be displayed in the SnackBar.
  /// The SnackBar will have an error color background from
  /// `ThemeConstants.errorColor`.
  static void showErrorSnackbarWithMessage({
    required BuildContext context,
    required String message,
    int? duration,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: ThemeConstants.errorColor,
        duration: duration != null
            ? Duration(
                days: duration,
              )
            : const Duration(
                seconds: 4,
              ),
      ),
    );
  }

  /// Shows a warning SnackBar with a custom message.
  ///
  /// [context] is the BuildContext where the SnackBar will be displayed.
  /// [message] is the String content to be displayed in the SnackBar.
  /// The SnackBar will have a warning color background from
  /// `ThemeConstants.warningColor`.
  static void showWarningSnackbarWithMessage({
    required BuildContext context,
    required String message,
    int? duration,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: ThemeConstants.warningColor,
        duration: duration != null
            ? Duration(
                days: duration,
              )
            : const Duration(
                seconds: 4,
              ),
      ),
    );
  }

  /// Shows a success SnackBar with a custom message.
  ///
  /// [context] is the BuildContext where the SnackBar will be displayed.
  /// [message] is the String content to be displayed in the SnackBar.
  /// The SnackBar will have a success color background from
  /// `ThemeConstants.successColor`.
  static void showSuccessSnackbarWithMessage({
    required BuildContext context,
    required String message,
    int? duration,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: ThemeConstants.successColor,
        duration: duration != null
            ? Duration(
                days: duration,
              )
            : const Duration(
                seconds: 4,
              ),
      ),
    );
  }
}
