import 'dart:convert';
import 'package:hospital_app/Constant/constant.dart';
import 'package:hospital_app/Screens/Profile%20Screen/ProfileJsonModel/profileModel.dart';
import 'package:http/http.dart' as http;

class ProfileDetailsServices {
  Future<ProfileModel> getUserDetails(String mobileNumber) async {

    final endPoint='Patient/CheckUserType?MobileNo=';
    var response = await http.get(Uri.parse(
        '${ConstantApi.baseUrl}$endPoint$mobileNumber'));
    try {
      final jsonData = jsonDecode(response.body);
      return ProfileModel.fromJson(jsonData);
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }
}
