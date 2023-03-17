import 'package:hospital_app/Constant/constant.dart';
import 'package:http/http.dart' as http;

class PatientDetailServices {
  String dob = " ";
  Future postPatientDetails(String patientName, String age, String gender,
      String mobileNumber, String emailID) async {
    print('Inside services');
    print(mobileNumber);
    final response = await http.post(Uri.parse(
        "${ConstantApi.baseUrl}Patient/InsertNewPatientDetails?DateOfBirth=1900-01-01&Gender=$mobileNumber&MobileNo=$gender&Email=$emailID&PatientName=$patientName&Age=$age"));
    if (response.statusCode == 200) {
      print('Succesfully Inserted');
      var jsonData = response.body;
      return jsonData;
    } else {
      print('Data Not Submited');
    }
    ;
  }
} //http://gtech.easysolution.asia:91/api/Patient/InsertNewPatientDetails?DateOfBirth=$dob&Gender=$gender&MobileNo=$phoneNumber&Email=$emailID&PatientName=$patientName&Age=$age

class PatientDetailsServices2 {
  String title = '';
  String charges = '';
  String chargesType = '';
  String middleName = '';
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
    String dateTime,
  ) async {
    try {
      print(gender);
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

  Future sendTime(String? dateTime, String doctorId, String unitId) async {
    try {
      final response = await http.post(Uri.parse(
          '${ConstantApi.baseUrl}BlockTimeSlot?DR_ID=$doctorId&App_Date_time=$dateTime&UnitId=$unitId'));
      print( '${ConstantApi.baseUrl}BlockTimeSlot?DR_ID=$doctorId&App_Date_time=$dateTime&UnitId=$unitId');
      if (response.statusCode == 200) {
        print('Success');
      }else{
        print('Failed');
      }
    } catch (e) {
      print('Failed');
    }
  }
}
