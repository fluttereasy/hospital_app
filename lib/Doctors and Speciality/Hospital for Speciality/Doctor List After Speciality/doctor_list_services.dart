import 'dart:convert';

import 'package:http/http.dart' as http;

class DoctorListServices {
  Future getDoctorList(String id, String specialityOrDoctor) async {
    try {
      final response = await http.get(Uri.parse(
          'http://gtech.easysolution.asia:91/api/ViewDoctor?UnitId=$id&SearchText=$specialityOrDoctor'));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        return jsonData;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
