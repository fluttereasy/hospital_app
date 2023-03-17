import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hospital_app/constants/strings.dart';
class Utility {
  static void hideKeyboard({required BuildContext context}) {
    final FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  //Get current date
  /*static String getCurrentDate() {
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    final String currentDate = dateFormat.format(DateTime.now());
    return currentDate;
  }*/

  //Get current date and time
  /*static String getCurrentDateTime() {
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    final String currentDate = dateFormat.format(DateTime.now());
    return currentDate;
  }*/

  /// Shows alert messages to the user
  static void showSnackBarMessage(
      {required ScaffoldState state, required String message}) {
    final SnackBar snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(milliseconds: 2000),
    );
    ScaffoldMessenger.of(state.context)
        .removeCurrentSnackBar(reason: SnackBarClosedReason.remove);
    if (message.isNotEmpty) {
      ScaffoldMessenger.of(state.context).showSnackBar(snackBar);
    }
  }


  static Future<bool> isNetworkAvailable() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        debugPrint('connected');
        return true;
      } else {
        return false;
      }
    } on SocketException catch (e) {
      debugPrint('not connected: $e');
      return false;
    }
  }

  static Future<void> ackAlert(BuildContext context, String message) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(StringConstants.app_name),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}