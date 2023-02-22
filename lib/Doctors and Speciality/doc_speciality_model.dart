class DoctorSpecialityModel {
  int? rowId;
  String? speciality;
  String? type;

  DoctorSpecialityModel({this.rowId, this.speciality, this.type});
  factory DoctorSpecialityModel.fromJson(Map<String, dynamic> json) {
    return DoctorSpecialityModel(
        rowId: json["RowId"],
        speciality: json["Speciality"],
        type: json["Type"]);
  }
}
