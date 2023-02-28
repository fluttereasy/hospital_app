import 'dart:convert';
import 'package:hospital_app/Constant/constant.dart';
import 'package:http/http.dart' as http;

class AppointmentServices {
  List timingList = [];

  Future getAppointmentTiming(
      String doctotID, String unitID, String date) async {
    final response = await http.get(Uri.parse(
        "${ConstantApi.baseUrl}CreateAppointSchedule?DoctorId=$doctotID&UnitId=$unitID&Date=$date"));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print(jsonData);
      return jsonData;
    }
    throw Exception(response.reasonPhrase);
  }
}
