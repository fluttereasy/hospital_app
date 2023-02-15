import 'dart:convert';

import 'package:hospital_app/Constant/constant.dart';
import 'package:http/http.dart' as http;


class OtpServices {
  static int? getOtp;
  //Function to Send Otp
  Future<dynamic> sendOtp(String mobileNumber) async {
    try {
      const String endPoint = 'GenrateOTPByNumber?MobileNumber=';
      var response = await http
          .post(Uri.parse("${'${ConstantApi.baseUrl}$endPoint'}$mobileNumber"));
      if (response.statusCode == 200) {
        var jsondata = jsonDecode(response.body.toString());
        var otpReceived = (jsondata[0]);
        OtpServices.getOtp = otpReceived;
        return otpReceived;
      }
    } catch (e) {}
  }
}
