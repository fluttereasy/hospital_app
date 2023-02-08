import 'dart:convert';

import 'package:http/http.dart' as http;

class OtpServices {
  static var otpReceived;
  static var otpNotSent;

  //Function to Send Otp
  static Future<void> sendOtp(String mobileNumber) async {
    print(mobileNumber);
    try {
      var response = await http.post(Uri.parse(
          "http://192.168.1.50:84/api/GenrateOTPByNumber?MobileNumber=$mobileNumber"));
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
