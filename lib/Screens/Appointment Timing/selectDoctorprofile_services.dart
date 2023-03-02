import 'dart:convert';
import 'package:hospital_app/Doctors%20and%20Speciality/Hospital%20for%20Speciality/Doctor%20List%20After%20Speciality/DoctorListModel/doctor_list_model.dart';
import 'package:http/http.dart' as http;

class SelectDoctorSeervices {
  List doctorprofileData = [];
  Future selectDoctorService(int? unitID, String doctorID) async {
    final response = await http.get(Uri.parse(
        "http://gtech.easysolution.asia:91/api/ViewDoctor?UnitId=$unitID&SearchText=$doctorID"));
    if (response.statusCode == 200) {
      List jsonData = jsonDecode(response.body);
      return jsonData;
    }
    throw Exception(response.reasonPhrase);
  }
}
