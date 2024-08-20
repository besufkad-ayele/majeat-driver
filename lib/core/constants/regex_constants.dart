class RegexConstants {
  /// ^[a-zA-Z0-9._%+-]+ : This part of the regex ensures that the email starts with any alphanumeric character (both lower and upper case), or ., _, %, +, or -. The + indicates one or  more of these characters.
  /// @ : This is the literal "at" symbol, which is a required part of any email address.
  /// [a-zA-Z0-9.-]+ : After the "at" symbol, the email address must contain one or more alphanumeric characters, or ., or -.
  /// \.[a-zA-Z]{2,}$ : This ensures that the email address ends with a period . followed by at least two alphabetic characters, representing the domain name (like .com, .org, etc.).
  static const String emailRegex = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

  /// ^ : Matches the beginning of the string.
  /// [79] : Matches either the digit 07 or 09.
  /// \d{8} : Matches any 8 digits (0-9).
  /// $ : Matches the end of the string.
  static const String phoneNumberRegex = r'^[0709]\d{9}$';

  /// ^ : Asserts the start of the string.
  /// .{4,} : Ensures that the total length is at least 4 characters.
  /// $ : Asserts the end of the string.
  static const String passwordRegex = r'^.{4,}$';

  /// ^ : Asserts the start of the string.
  /// \d{5} : Matches any 8 digits (0-9).
  /// $ : Asserts the end of the string.
  static const String otpRegex = r'^\d{5,}$';

  /// ^ : Asserts the start of the string.
  /// \d{15} : Matches any 8 digits (0-9).
  /// $ : Asserts the end of the string.
  static const String imeiRegex = r'^\d{15}$';

  /// ^ : Asserts the start of the string.
  /// \d{10} : Matches at least 10 digits (0-9).
  /// $ : Asserts the end of the string.
  static const String accountNumberRegex = r'^\d{10,}$';

  /// ^ : Asserts the start of the string.
  /// \d{10} : Matches 15 digits (0-9).
  /// $ : Asserts the end of the string.
  static const String nationalIdRegex = r'^\d{12}$';

  /// ^ asserts the start of the string.
  /// (?=.*\S) is a positive lookahead that ensures there is at least one non-whitespace character in the string.
  /// .+ matches one or more of any character.
  /// $ asserts the end of the string.
  static const String nameRegex = r'^(?=.*\S).+$';

  /// ^ asserts the start of the string.
  /// [0-9A-Fa-f] matches any hexadecimal character. This includes numbers 0-9 and letters a-f (case-insensitive due to A-Fa-f).
  /// {3} matches exactly three of the preceding tokens (hexadecimal characters).
  /// {1,2} means the previous three characters ([0-9A-Fa-f]{3}) can occur either once or twice, allowing for both short (#RGB) and full-length (#RRGGBB) hex codes.
  /// $ asserts the end of the string.
  static const String hexColorRegex = r'^([0-9A-Fa-f]{3}){1,2}$';

  /// ^(https?:\/\/)?: This part matches the beginning of the string and optionally matches "http" or "https" followed by "://".
  /// ([\da-z\.-]+): Matches the domain name, which can include any digit (\d), alphabetic character (a-z), hyphens (-), or dots (.).
  /// \.([a-z\.]{2,6}): Matches the top-level domain like .com, .org, etc. It expects between 2 to 6 alphabetic characters.
  /// ([\/\w \.-]*): Optionally matches a path which may include slashes (/), alphanumeric characters (\w), spaces ( ), dots (.), or hyphens (-).
  /// \/?$: Ensures the URL ends correctly. The \/? allows for an optional trailing slash, and $ asserts the end of the line.
  static const String urlRegex = r'^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$';
  

}
