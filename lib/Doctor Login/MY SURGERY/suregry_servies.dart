import 'dart:convert';

import 'package:hospital_app/Constant/constant.dart';
import 'package:hospital_app/Doctor%20Login/MY%20SURGERY/surgery_model.dart';
import 'package:http/http.dart' as http;

class SurgryServices {
  SurgeryModel surgeryModel = SurgeryModel();
  Future getDoctorSurgeries(String doctorID, String dateofSurgery) async {
    String endPoint = 'TodayDoctorSurgery?DrId=$doctorID&Date=$dateofSurgery';
    try {
      print('inside try SERVICE Catch');
      final response = await http.get(Uri.parse(ConstantApi.baseUrl + endPoint));
      final json = jsonDecode(response.body);
      final data = SurgeryModel.fromJson(json);
      return data.todayDoctorSurgery;
    } on Exception catch (e) {
      // TODO
    }
  }
}
