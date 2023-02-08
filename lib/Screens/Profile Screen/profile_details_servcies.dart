import 'dart:convert';
import 'package:hospital_app/Screens/Profile%20Screen/ProfileJsonModel/profileModel.dart';
import 'package:http/http.dart' as http;

class ProfileDetailsServices {
  Future<ProfileModel> getUserDetails(String mobileNumber) async {
    var response = await http.get(Uri.parse(
        'http://192.168.1.50:84/api/Patient/CheckUserType?MobileNo=$mobileNumber'));
    final jsonData = jsonDecode(response.body);
    return ProfileModel.fromJson(jsonData);
  }
}

