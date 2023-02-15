import 'dart:convert';
import 'package:hospital_app/Constant/constant.dart';
import 'package:hospital_app/Doctor/HospitalServices/hospital_model.dart';
import 'package:http/http.dart' as http;

class HospitalServices {
  List<HospitalModel>? data;
  List<String>? hospitalList = [];

  String endPoint = 'AllHospital';
  Future<List<String>?> getHospitalList() async {
    final response = await http.get(Uri.parse(ConstantApi.baseUrl + endPoint));
    if (response.statusCode == 200) {
      List jsonData = jsonDecode(response.body);
      data = jsonData.map((e) => HospitalModel.fromJson(e)).toList();
      data?.forEach((element) {
        hospitalList!.add(element.hospitalName.toString());
      });
      return hospitalList;
    }
    throw Exception(response.reasonPhrase);
  }
}
