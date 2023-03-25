import 'package:flutter/cupertino.dart';
import '../constants/strings.dart';

/// Class used to validate different input fields like email address, number validation
class Validator {
  static const Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static const Pattern validNumberPattern = r'^[0-9-]\d*(\.\d+)?$';
  static const Pattern validMobileNumberPattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  static const Pattern validUpiIdPattern =
      r'[a-zA-Z0-9.\-_]{2,256}@[a-zA-Z]{2,64}';
  static const int passwordMinLength = 8;

  static String? validateEmailAddress({@required String? email}) {
    final RegExp regex = RegExp(pattern.toString());
    if (email!.isEmpty) {
      return StringConstants.email_empty_msg;
    }
    if (!regex.hasMatch(email))
      return StringConstants.valid_email_msg;
    else
      return null;
  }

  static String? validatePassword({@required String? password}) {
    if (password!.isEmpty) {
      return ValidatorStringConstants.password_empty_msg;
    } else if (password.length < 8) {
      return ValidatorStringConstants.password_min_length_msg;
    }

    bool hasUppercase = password.contains(new RegExp(r'[A-Z]'));
    bool hasDigits = password.contains(new RegExp(r'[0-9]'));
    bool hasLowercase = password.contains(new RegExp(r'[a-z]'));
    bool hasSpecialCharacters =
        password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    if (hasDigits & hasUppercase & hasLowercase & hasSpecialCharacters) {
      return null;
    } else {
      return ValidatorStringConstants.password_contains_character_msg;
    }
  }

  static String? validateMobileNumber({@required String? number}) {
    RegExp regExp = new RegExp(validMobileNumberPattern.toString());
    if (number!.isEmpty) {
      return StringConstants.mobile_empty_msg;
    } else if (!regExp.hasMatch(number)) {
      return StringConstants.valid_mobile_msg;
    }
    return null;
  }

  static String? validateUpiId({@required String? upiId}) {
    final RegExp regex = RegExp(validUpiIdPattern.toString());
    if (upiId!.isEmpty) {
      return StringConstants.upi_empty_msg;
    } else if (!regex.hasMatch(upiId)) {
      return StringConstants.valid_upi_msg;
    }
    return null;
  }

  static bool validateVpa(String? upiId) {
    final RegExp regex = RegExp(validUpiIdPattern.toString());
    if (regex.hasMatch(upiId.toString())) {
      return true;
    }
    return false;
  }

  static String? alertInputNumberValidation({@required String? number}) {
    final RegExp regExp = RegExp(validNumberPattern.toString());
    if (number!.isEmpty) {
      return ValidatorStringConstants.empty_value_message;
    }
    if (!regExp.hasMatch(number)) {
      return ValidatorStringConstants.invalid_value_msg;
    }
    return null;
  }
}

class ValidatorStringConstants {
  static const String invalid_email_msg = 'Please enter email in valid format';
  static const String email_empty_msg = 'Please enter email';
  static const String mobile_empty_msg = 'Please enter mobile number';
  static const String invalid_mobile_msg = 'Please enter valid mobile number';
  static const String empty_value_message = 'Value can not be empty';
  static const String invalid_value_msg = 'Invalid value format';
  static const String password_empty_msg = 'Please enter password';
  static const String password_min_length_msg =
      'Password should have min ${Validator.passwordMinLength} character length';
  static const String password_contains_character_msg =
      'Password should contain at least 1 capital letter, 1 small letter, 1 numeric value and 1 special character';
}
