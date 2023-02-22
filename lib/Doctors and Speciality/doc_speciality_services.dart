import 'dart:convert';

import 'package:hospital_app/Constant/constant.dart';
import 'package:http/http.dart' as http;

class DoctorSpecialityServices {
  final String endPoint = "SpclOrDctr";

  Future getDoctorSpecialityList() async {
    try {
      print('in service try catch');
      final response =
          await http.get(Uri.parse(ConstantApi.baseUrl + endPoint));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body.toString());
        // var data = DoctorSpecialityModel.fromJson(jsonData);
        return jsonData;
      }
    } catch (e) {
      e.toString();
    }
  }
}
