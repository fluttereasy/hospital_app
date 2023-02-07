// import 'package:http/http.dart' as http;
//
// class OtpServices {
//   static String baseUrl =
//       "http://japi.instaalerts.zone/httpapi/QueryStringReceiver?ver=1.0&key=RlRFQVNZOnoodUBLJEIk&encrpt=0&dlt_entity_id=1001679250000012430&dest=8447659609&send=EASYIN&text=OTP for Login is 985632 and valid till 30mins.Do not share this 123456 to anyone. Easy Solution";
//
//   Future<void> sendOtp(String dest) async {
//     print(dest);
//     var response = await http.get(Uri.parse(
//         "http://japi.instaalerts.zone/httpapi/QueryStringReceiver?ver=1.0&key=RlRFQVNZOnoodUBLJEIk&encrpt=0&dlt_entity_id=1001679250000012430&dest=$dest&send=EASYIN&text=OTP for login on Nirvana Club Check In is 985632 and valid till 30mins.Do not share this OTP to anyone. Easy Solution"));
//     if (response.statusCode == 200) {
//       print(dest);
//       print("success");
//     } else {
//       print("failed");
//     }
//     print("out");
//   }
// }
