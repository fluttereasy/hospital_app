import 'dart:convert';
import 'package:hospital_app/Constant/constant.dart';
import 'package:hospital_app/Doctor/HospitalServices/hospital_model.dart';
import 'package:http/http.dart' as http;

class HospitalServices {
  List<String>? hospitalNameList = [];
  String? endPoint = 'AllHospital';
  Future getHospitalList() async {
    final response = await http.get(Uri.parse(ConstantApi.baseUrl + endPoint!));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body.toString());
      final data = jsonData.map((e) => HospitalModel.fromJson(e)).toList();
      data.forEach((element) {
        hospitalNameList?.add('${element.rowId} ${element.hospitalName}');
      });
      // print(hospitalNameList);
      return hospitalNameList;
    }
    throw Exception(response.reasonPhrase);
  }
}
