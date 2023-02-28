import 'package:hospital_app/Constant/constant.dart';
import 'package:http/http.dart' as http;

class PatientDetailServices {
  String dob = "";
  String userType = '';
  Future postPatientDetails(String patientName, String age, String phoneNumber,
      String gender, String emailID) async {
    print('Inside services');
    print(age.runtimeType);
    final response = await http.post(Uri.parse(
        "${ConstantApi.baseUrl}Patient/InsertNewPatientDetails?DateOfBirth=$dob&Gender=$gender&MobileNo=$phoneNumber&Email=$emailID&PatientName=$patientName&UserType=$userType&Age=$age"));

    if (response.statusCode == 200) {
      print('Succesfully Inserted');
      var jsonData = response.body;
      return jsonData;
    } else {
      print('Data Not Submited');
    }
    throw Exception(response.reasonPhrase);
  }
}
