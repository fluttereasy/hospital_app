import 'dart:convert';
import 'package:hospital_app/Constant/constant.dart';
import 'package:http/http.dart' as http;
import 'doctor_login_appointment_model.dart';

class MyOpdAppointmentServices {
  Future getDoctorLoginAppointment(String doctorID, String dateTime) async {
    String endPoint = 'DoctorWiseAppointment?DrId=$doctorID&Date=$dateTime';
    try {
      final response =
          await http.get(Uri.parse('${ConstantApi.baseUrl}$endPoint'));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final appointmentData = DoctorLoginOpdAppointment.fromJson(jsonData);
        return appointmentData.doctorLoginDetails;
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
