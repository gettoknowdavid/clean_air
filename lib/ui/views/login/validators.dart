import 'package:clean_air/ui/common/app_strings.dart';

class LoginValidators {
  static String? validateEmail(String? input) {
    if (input == null || input.isEmpty == true) {
      return 'Email cannot be empty';
    }

    if (RegExp(emailRegex).hasMatch(input)) {
      return null;
    }

    return 'Please provide a valid email';
  }

  static String? validatePassword(String? input) {
    if (input == null || input.isEmpty == true) {
      return 'Password cannot be empty';
    }

    return null;
  }
}
