import 'dart:convert';

import 'package:hospital_app/Constant/constant.dart';
import 'package:hospital_app/Doctor/HospitalServices/hospital_model.dart';
import 'package:http/http.dart' as http;

class HospitalServices {
  var data;
  String endPoint = 'AllHospital';
  Future<List<HospitalModel>> getHospitalList() async {
    final response = await http.get(Uri.parse(ConstantApi.baseUrl + endPoint));

    if (response.statusCode == 200) {
      List jsonData = jsonDecode(response.body);
      return data = jsonData.map((e) => HospitalModel.fromJson(e)).toList();
    }
    throw Exception(response.reasonPhrase);
  }
}
