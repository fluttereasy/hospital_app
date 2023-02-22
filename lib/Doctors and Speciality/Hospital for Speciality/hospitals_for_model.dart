class HospitalModelForSpeciality {
  int? rowId;
  String? UnitName;

  HospitalModelForSpeciality({this.rowId, this.UnitName});
  factory HospitalModelForSpeciality.fromJson(Map<String, dynamic> json) {
    return HospitalModelForSpeciality(
        rowId: json['RowId'], UnitName: json['UnitName']);
  }
}
