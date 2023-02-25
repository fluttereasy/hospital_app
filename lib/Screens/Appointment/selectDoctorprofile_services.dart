import 'dart:convert';
import 'package:http/http.dart' as http;

class SelectDoctorSeervices {
  Future selectDoctorService(String? unitID, String doctorID) async {
    final response = await http.get(Uri.parse(
        "http://gtech.easysolution.asia:91/api/ViewDoctor?UnitId=$unitID&SearchText=$doctorID"));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      // final data = DoctorListModel.fromJson(jsonData);
      // print(data.doctorName![1].toString());
      return jsonData;
    }
    throw Exception(response.reasonPhrase);
  }
}
