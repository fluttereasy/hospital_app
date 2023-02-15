import 'dart:convert';

import 'package:hospital_app/Constant/constant.dart';
import 'package:hospital_app/Doctor/HospitalServices/hospital_model.dart';
import 'package:http/http.dart' as http;

class HospitalServices {
  List<HospitalModel>? data;
  String endPoint = 'AllHospital';
  Future<List<HospitalModel>> getHospitalList() async {
    final response = await http.get(Uri.parse(ConstantApi.baseUrl + endPoint));
    if (response.statusCode == 200) {
      List jsonData = jsonDecode(response.body);
      var data = jsonData.map((e) => HospitalModel.fromJson(e)).toList();
      // print(data.toString());
      return data;
    }
    throw Exception(response.reasonPhrase);
  }
}
