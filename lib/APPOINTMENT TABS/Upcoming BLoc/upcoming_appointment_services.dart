import 'dart:convert';
import 'package:hospital_app/APPOINTMENT%20TABS/Upcoming%20BLoc/upcoming_appointment_model.dart';
import 'package:hospital_app/Constant/constant.dart';
import 'package:http/http.dart' as http;

class UpcomingAppointmentServices {
  Future upCpmingAppointment(String phoneNumber) async {
    String endPoint = 'UpComingPatientAppt?MObileNo=';

    try {
      print('inside try catch');
      final response = await http
          .get(Uri.parse('${ConstantApi.baseUrl}$endPoint$phoneNumber'));

      final json = jsonDecode(response.body);
      final data = UpComingAppointmentModel.fromJson(json);
      return data.patient;
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
