class ConstantApi {
  static String getUserDetails =
      "http://192.168.1.50:84/api/Patient/CheckUserType?MobileNo=";

  static String doctorandSpecialityList =
      'gtech.easysolution.asia:91/api/SpclOrDctr';

  static String doctorDetails =
      "http://gtech.easysolution.asia:91//api/ViewDoctor?UnitId=&SearchText=";

  static String patientDetails =
      'http://gtech.easysolution.asia:91/api/Patient/CheckUserType?MobileNo=';

  static String baseUrl = 'http://gtech.easysolution.asia:91/api/';

  static String getUserdetailsApi =
      'http://192.168.1.50:84/api/Patient/CheckUserType?MobileNo=9892008442';

  static String hospitalList =
      'http://gtech.easysolution.asia:91/api/AllHospital';

  static String doctorDetailsforAppointment =
      'http://gtech.easysolution.asia:91/api/ViewDoctor?UnitId=1&SearchText=2358';

  static String fetchingHospitalsFromSPeciality =
      'gtech.easysolution.asia:91/api/BindUnit?SearchText=CATARACT';
//http://gtech.easysolution.asia:91/api/Patient/InsertNewPatientDetails?DateOfBirth=2000-03-03&Gender=Male&MobileNo=8888888898&Email=na@gmail.com&PatientName=naaa
  static String getPatientDetails =
      'http://gtech.easysolution.asia:91/api/Patient/InsertNewPatientDetails?DateOfBirth=04-03-2002&Gender=Male&MobileNo=7982208767&Email=sawan@gmail.com&PatientName=Sawan&UserType=';

  static String appoinmentTimings =
      "http://gtech.easysolution.asia:91/api/CreateAppointSchedule?DoctorId=2306&UnitId=1&Date=03-03-2023";

  static String sendDatatoAppointment =
      'http://localhost:1666/api/BookAppointment?Title=&FirstName=Testor&MiddleName&LastName&Gender=Male&Age=24&MobileNo=4443335554&WhatsappNo&Email=testor@gmail.com&Address&Promocode&Remark&Charge=400&ChargeType=PAID&UnitId=1&DrId=2306&App_Date_Time=2023-03-03 08:33:00.000';

  //gtech.easysolution.asia:91/api/ViewDoctor?UnitId=1&SearchText=2358
}
