import 'package:hospital_app/Constant/constant.dart';
import 'package:http/http.dart' as http;

class PatientDetailServices {
  String dob = "";
  String userType = '';
  Future postPatientDetails(String patientName, String age, String phoneNumber,
      String gender, String emailID) async {
    print(phoneNumber);
    print('Inside services');
    final response = await http.post(Uri.parse(
        "http://gtech.easysolution.asia:91/api/Patient/InsertNewPatientDetails?DateOfBirth=$dob&Gender=$gender&MobileNo=$phoneNumber&Email=$emailID&PatientName=$patientName"));
    if (response.statusCode == 200) {
      print('Succesfully Inserted');
      var jsonData = response.body;
      return jsonData;
    } else {
      print('Data Not Submited');
    }
    ;
  }
}

class PatientDetailsServices2 {
  String title = '';
  String charges = '';
  String chargesType = '';
  String middleName = '';
  String dateTime = '';
  String lastName = '';
  String whatsapp = '';
  String address = '';
  String promoCode = '';
  String remark = '';

  Future postPatientDetails2(
    String firstName,
    String gender,
    String age,
    String mobileNumber,
    String email,
    String charge,
    String chargeType,
    String unitID,
    String doctorID,
  ) async {
    try {
      print(doctorID);
      final response = await http.post(Uri.parse(
          'http://gtech.easysolution.asia:91/api/BookAppointment?Title=$title&FirstName=$firstName&MiddleName=$middleName&LastName=$lastName&Gender=$gender&Age=$age&MobileNo=$mobileNumber&WhatsappNo=$whatsapp&Email=$email&Address=$address&Promocode=$promoCode&Remark=$remark&Charge=$charge&ChargeType=$chargeType&UnitId=$unitID&DrId=$doctorID&App_Date_Time=$dateTime'));
      print(firstName);
      if (response.statusCode == 200) {
        print('Submitting data');
      } else {
        print('Data not usb');
      }
    } catch (e) {}
  }
}
