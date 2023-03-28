import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Constant/constant.dart';
import 'optical_model.dart';

class OpticalServices {
  Future getOpticalBill(String phoneNumber) async {
    String endPoint = 'SalesOrder?MobileNo=';
    try {
      print('inside try catch');
      final response = await http
          .get(Uri.parse('${ConstantApi.baseUrl}$endPoint$phoneNumber'));
      final json = jsonDecode(response.body);
      final data = OpticalModel.fromJson(json);
      print(data.salesOrder);
      return data.salesOrder;
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
