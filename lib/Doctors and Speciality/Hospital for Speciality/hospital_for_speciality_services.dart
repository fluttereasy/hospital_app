import 'dart:convert';
import 'package:hospital_app/Constant/constant.dart';
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
        return jsondata;
      }
    } catch (e) {
      e.toString();
    }
  }
}
