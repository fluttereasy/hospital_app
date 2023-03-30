import 'dart:convert';
import 'package:hospital_app/Constant/constant.dart';
import 'package:hospital_app/PHARMACY/pharmacy_model.dart';
import 'package:http/http.dart' as http;

class PharmacyServices {
  Future getPharmacyData(String phoneNumber) async {
    const endPoint = 'PharmacyBilling?MobileNo=';
    try {
      final response = await http
          .get(Uri.parse('${ConstantApi.baseUrl}$endPoint$phoneNumber'));
      final jsonData = jsonDecode(response.body);
      final data = PharmacyModel.fromJson(jsonData);
      return data.PharmacyBillList;
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
