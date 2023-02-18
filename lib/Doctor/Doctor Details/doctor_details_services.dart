import 'dart:convert';

import 'package:hospital_app/Constant/constant.dart';
import 'package:hospital_app/Doctor/DoctorServices/doctor_model.dart';
import 'package:http/http.dart' as http;

class DoctorDetailsServices {
  Future<String> getDoctorDetails(int id, String docName) async {
    final response = await http.get(Uri.parse(
        "http://gtech.easysolution.asia:91//api/ViewDoctor?UnitId=$id&SearchText=$docName"));
    if (response.statusCode == 200) {
      List jsonData = jsonDecode(response.body);
      final data = jsonData.map((e) => DoctorModel.fromJson(e)).toList();
      docName = (data[0].doctorName)!;
      print(docName);
      return docName;
    }
    throw Exception(response.reasonPhrase);
  }

}
