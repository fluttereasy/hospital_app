class HospitalModel {
  String? hospitalName;
  int? rowId;

  HospitalModel({this.hospitalName, this.rowId});
  factory HospitalModel.fromJson(Map<String, dynamic> json) {
    return HospitalModel(hospitalName: json['UnitName'], rowId: json['RowId']);
  }
}
