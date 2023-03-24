import 'dart:convert';
import 'package:hospital_app/APPOINTMENT%20TABS/PAST%20APPOINTMENT/past_appointment_model.dart';
import 'package:hospital_app/Constant/constant.dart';
import 'package:http/http.dart' as http;

class PastAppoinmentServices {
  Future getPastAppointment(
      String phoneNumber) async {
    String endPoint = 'ShowPastApptointment?MobileNo=';
    try {
      final response = await http
          .get(Uri.parse('${ConstantApi.baseUrl}$endPoint${phoneNumber}'));
      final json = jsonDecode(response.body);
      final data = PastComingAppointmentModel.fromJson(json);
      return data.patient;
    } catch (e) {
      print(e.toString());
    }
  }
}
