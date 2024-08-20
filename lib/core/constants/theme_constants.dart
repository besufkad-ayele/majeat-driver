import 'package:flutter/material.dart';

/// A collection of constant values related to the application's theme.
///
/// The `ThemeConstants` class contains various constant values that are
/// associated with the application's theme and design. These constants can be
/// used to ensure consistent styling and theming across the app.
class ThemeConstants {

    // Colors
  static const Color primaryColor = Color.fromARGB(255, 228, 212, 154);
  static const Color secondaryColor = Color.fromARGB(254, 142, 138, 138);
  static const Color accentColor = Color(0xffef9920);
  static const Color btnColor = Color(0xffE95322);

  static const Color blackTextColor = Color.fromARGB(255, 0, 0, 0);
  static const Color bodyTextColor = Color(0xff868686);
  static const Color inputColor = Color(0xfffbfbfb);
  static const Color bakcGroundColor = Color.fromARGB(250, 236, 235, 235);
  

  static const bgColor = Color(0xFFe3e7ec);

  /// The hint color used for the overall application forms.
  static const hintColor = Colors.black12;

  /// The success color used for the overall application notification.
  static const successColor = Colors.green;

  /// The warning color used for the overall application notification.
  static const warningColor = Colors.orangeAccent;

  /// The error color used for the overall application notification.
  static const errorColor = Colors.redAccent;

  /// The radius for custom container clippers.
  static const double customContainerClipperRadius = 75.0;

  /// The default padding value used for spacing between UI elements.
  static const double defaultPadding = 16.0;

  /// The border radius for form fields.
  static const double formFieldBorderRadius = 10.0;

  /// --------------------------------------------------------------------------
  /// FONT WEIGHT
  /// --------------------------------------------------------------------------

  /// Defines a constant for a thin font weight.
  static const thin = FontWeight.w100;

  /// Defines a constant for an extra-light font weight.
  static const extraLight = FontWeight.w200;

  /// Defines a constant for a light font weight.
  static const light = FontWeight.w300;

  /// Defines a constant for a regular (normal) font weight.
  static const regular = FontWeight.w400;

  /// Defines a constant for a medium font weight.
  static const medium = FontWeight.w500;

  /// Defines a constant for a semi-bold font weight.
  static const semiBold = FontWeight.w600;

  /// Defines a constant for a bold font weight.
  static const bold = FontWeight.w700;

  /// Defines a constant for an extra-bold font weight.
  static const extraBold = FontWeight.w800;

  /// Defines a constant for a black font weight (heaviest).
  static const black = FontWeight.w900;

  /// A `ShapeBorder` that defines a continuous rectangular border with a
  /// specific radius.
  ///
  /// The `continuousRectangleBorder` variable represents a
  /// [ContinuousRectangleBorder] with a defined border radius. This shape
  /// border is often used to clip widgets with rounded corners in a continuous
  /// manner.
  ///
  /// - [borderRadius]: The radius applied to all corners of the rectangular
  /// shape.
  static const ShapeBorder continuousRectangleBorder =
      ContinuousRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(
        ThemeConstants.customContainerClipperRadius,
      ),
    ),
  );

  static final double primaryDarkness = 1 -
      (0.299 * Color(primaryColor.value).red +
              0.587 * Color(primaryColor.value).green +
              0.114 * Color(primaryColor.value).blue) /
          255;
  static final double secondaryDarkness = 1 -
      (0.299 * Color(secondaryColor.value).red +
              0.587 * Color(secondaryColor.value).green +
              0.114 * Color(secondaryColor.value).blue) /
          255;
}
