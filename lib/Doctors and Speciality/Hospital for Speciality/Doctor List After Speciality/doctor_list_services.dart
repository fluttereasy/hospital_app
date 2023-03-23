import 'dart:convert';

import 'package:hospital_app/Constant/constant.dart';
import 'package:http/http.dart' as http;

class DoctorListServices {
  Future getDoctorList(int id, String specialityOrDoctor) async {
    try {
      final response = await http.get(Uri.parse(
          '${ConstantApi.baseUrl}ViewDoctor?UnitId=$id&SearchText=$specialityOrDoctor'));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        return jsonData;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
