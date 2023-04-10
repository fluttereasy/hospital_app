import 'dart:convert';
import 'package:hospital_app/Constant/constant.dart';
import 'package:hospital_app/Doctor%20Login/Doctor%20Login%20Details/doctor_login_model.dart';
import 'package:http/http.dart' as http;

class DoctorLoginServices {
  Future getDoctorLoginDetails(String phoneNumber) async {
    String endPoint = 'Patient/CheckUserType?MobileNo=$phoneNumber';
    try {
      final response = await http.get(Uri.parse(
          '${ConstantApi.baseUrl}Patient/CheckUserType?MobileNo=$phoneNumber'));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final doctorData = DoctorLogin.fromJson(jsonData);
        return doctorData.doctorLoginDetails;
      } else {
        print('failed api');
      }
    } on Exception catch (e) {
      // TODO
    }
  }
}
