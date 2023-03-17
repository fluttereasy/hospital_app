import 'package:connectivity/connectivity.dart';
import 'dart:io';

class InternetConnectivity {
  static Future<bool> isInternetAvailable = checkInternetAvailability();

  static Future<bool> checkInternetAvailability() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      //print("Connected to Mobile Network");
      try {
        final result = await InternetAddress.lookup('example.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          //print('connected');
          return true;
        }
      } on SocketException catch (_) {
        //print('not connected');
        return false;
      }
    } else if (connectivityResult == ConnectivityResult.wifi) {
      //print("Connected to WiFi");
      try {
        final result = await InternetAddress.lookup('example.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          //print('connected');
          return true;
        }
      } on SocketException catch (_) {
        //print('not connected');
        return false;
      }
    } else {
      //print("Unable to connect. Please Check Internet Connection");
      return false;
    }
    return false;
  }

  Future<bool> isInternetConnectivityAvailable() async {
    Future<bool> isInternetAvailable = checkInternetAvailability();
    return isInternetAvailable;
  }
}