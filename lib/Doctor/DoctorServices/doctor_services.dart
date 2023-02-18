import 'dart:convert';
import 'package:hospital_app/Constant/constant.dart';
import 'package:hospital_app/Doctor/DoctorServices/doctor_model.dart';
import 'package:http/http.dart' as http;

class DoctorServices {
  String endPoint = 'BindSpclOrDctr/?UnitId=';
  List<String>? docList = [];

  Future getDoctorList(int? unitId) async {
    final response =
        await http.get(Uri.parse('${ConstantApi.baseUrl}$endPoint$unitId'));
    if (response.statusCode == 200) {
      List jsonData = jsonDecode(response.body);
      final data = jsonData.map((e) => DoctorModel.fromJson(e)).toList();
      data.forEach((element) {
        docList?.add('${element.doctorName}');
      });
      return docList;
    }
    throw Exception(response.reasonPhrase);
  }
}