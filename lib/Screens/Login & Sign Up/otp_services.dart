import 'dart:convert';

import 'package:hospital_app/Constant/constant.dart';
import 'package:http/http.dart' as http;

class OtpServices {
  static var otpReceived;
  static var otpNotSent;

  //Function to Send Otp
  static Future<void> sendOtp(String mobileNumber) async {
    try {
      const String endPoint = 'GenrateOTPByNumber?MobileNumber=';

      var response = await http
          .post(Uri.parse("${'${ConstantApi.baseUrl}$endPoint'}$mobileNumber"));
      if (response.statusCode == 200) {
        var jsondata = jsonDecode(response.body.toString());
        otpReceived = (jsondata[0]);
      } else {
        otpNotSent = jsonDecode(response.body.toString());
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
