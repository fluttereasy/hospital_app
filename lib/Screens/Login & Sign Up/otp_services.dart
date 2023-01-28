import 'package:http/http.dart' as http;

class OtpServices{

  void otpApi(String phoneNumber){
    http.get(Uri.parse('"http://japi.instaalerts.zone/httpapi/QueryStringReceiver?ver=1.0&key= mHjjbZhkavuion3c6YPtaA==&encrpt=0&dest=" + mob + "&send=ISHANE&text=" + msg;'));}
}