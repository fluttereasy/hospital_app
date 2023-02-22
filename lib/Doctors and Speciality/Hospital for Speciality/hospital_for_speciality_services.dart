import 'dart:convert';

import 'package:hospital_app/Constant/constant.dart';
import 'package:hospital_app/Doctors%20and%20Speciality/Hospital%20for%20Speciality/hospitals_for_model.dart';
import 'package:http/http.dart' as http;

class HospitalForSpecialityServices {
  String endPoint = 'BindUnit?SearchText=';
  Future getHospitalsForSpeciality(String searchText) async {
    try {
      final response = await http
          .get(Uri.parse(ConstantApi.baseUrl + endPoint + searchText));
      if (response.statusCode == 200) {
        final jsondata = jsonDecode(response.body.toString());

        // final data = HospitalModelForSpeciality.fromJson(jsondata);
        print(jsondata[1]['UnitName']);
        return jsondata;
      }
    } catch (e) {
      e.toString();
    }
  }
}
