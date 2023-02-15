class DoctorModel {
  int? id;
  String? doctorName;

  DoctorModel({this.doctorName, this.id});
  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(id: json['ID'], doctorName: json['Name']);
  }
}
