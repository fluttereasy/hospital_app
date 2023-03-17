library constants;

import 'package:flutter/material.dart';

///Class used to save color constants
class UIConstants {
  static const double headerHeight = 180;

  static const Color primaryColor = Color(0xFFd9e7f7);
  static const Color iconBackColor = Color(0xFFd9e7f7);
  static const Color buttonBackgroundColor = Color(0xFF2196f3);

  // We can not set const to primary dark colors as const variable must be assign
  // with constant value but we are assigning primary color shade to dark
  static Color? primaryColorDark = primaryColor;
  static Color? accentColor = primaryColor;
  static Color dividerColor = const Color(0x1F000000);
  static Color scaffoldBackgroundColor = Colors.white;
  static Color textFieldBorderColor = Colors.grey;
  static Color textColorPrimary = Colors.black;
  static Color textColorSecondary = Colors.black54;

  //Button text colors
  static Color elevatedButtonTextColor = Colors.white;
  static Color? textButtonTextColor = accentColor;
  static Color outlinedButtonTextColor = Colors.black;
}

const String SUCCESS_MESSAGE = " You will be contacted by us very soon.";
const int PURPLE_COLOR = 0xFF444284;
const Color textFieldBorderColor = Color(0xFF687982);

const String SUCCESS = "Success";
const String FAILURE = "Failure";
const String ERROR = "Error";
const String OK = "OK";
const String EMAIL = "Email";
const String USERNAME = "UserName";

const String INVALID_EMAIL_MESSAGE = 'Email can\'t be empty';
const String INVALID_FULLNAME_MESSAGE = 'Full Name can\'t be empty';
const String ENTER_VALID_EMAIL_MESSAGE = "Please enter a valid email";
const String ENTER_PHONE_NUMBER = "Please enter a phone Number";
const String ENTER_VALIDE_PHONE_NUMBER = "Please enter a phone Number";
const String INTERNET_CONNECTIVITY_ERROR_MESSAGE =
    "Please check your internet connection and try again later.";
