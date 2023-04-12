import 'dart:convert';

import 'package:hospital_app/Constant/constant.dart';
import 'package:hospital_app/Doctor%20Login/WaitList/waitlist_model.dart';
import 'package:http/http.dart' as http;

class WaitlistServices {
  Future getWaitingList(String doctorId, String date) async {
    final endPoint = 'ShowPatientWaittingList?DrId=$doctorId&Date=$date';
    try {
      final response =
          await http.get(Uri.parse(ConstantApi.baseUrl + endPoint));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final data = WaitListModel.fromJson(jsonData);

        return data.waitList;
      } else {
        print('API Failed');
      }
    } catch (e) {}
  }
}
