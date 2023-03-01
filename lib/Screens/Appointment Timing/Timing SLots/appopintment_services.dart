import 'dart:convert';
import 'package:hospital_app/Constant/constant.dart';
import 'package:http/http.dart' as http;

import 'appointment_timing_model.dart';

class AppointmentServices {
  Future getAppointmentTiming(
      String doctotID, String unitID, String date) async {
    print('Inside services');
    print(doctotID);
    print(unitID);
    print(date);

    final response = await http.get(Uri.parse(
        "${ConstantApi.baseUrl}CreateAppointSchedule?DoctorId=$doctotID&UnitId=$unitID&Date=$date"));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body.toString());
      // var parsedJson = AppointmentModel.fromJson(jsonData[0]);
      // print(parsedJson);
      return jsonData;
    }
    throw Exception(response.reasonPhrase);
  }
}
