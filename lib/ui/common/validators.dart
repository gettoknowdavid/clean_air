import 'app_strings.dart';

class Validators {
  static String? validateEmail(String? input) {
    if (input == null || input.isEmpty == true) {
      return 'Email cannot be empty';
    }

    if (RegExp(emailRegex).hasMatch(input)) {
      return null;
    }

    return 'Please provide a valid email';
  }

  static String? validateLoginPassword(String? input) {
    if (input == null || input.isEmpty == true) {
      return 'Password cannot be empty';
    }

    return null;
  }

  static String? validatePassword(String? input) {
    if (input == null || input.isEmpty == true) {
      return 'Password cannot be empty';
    }

    if (RegExp(passwordRegex).hasMatch(input)) {
      return null;
    }

    return 'Please provide a valid password';
  }

  static String? validateName(String? input) {
    if (input == null || input.isEmpty) {
      return 'Name cannot be empty';
    }

    return null;
  }
}
