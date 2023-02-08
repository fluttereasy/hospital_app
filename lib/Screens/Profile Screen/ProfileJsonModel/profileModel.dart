class ProfileModel {
  int? ok;
  var data;
  DataInfo? dataInfo;

  ProfileModel({this.data, this.ok, this.dataInfo});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    final datalist = json['Data'][0];
    final userData = DataInfo.fromJson(datalist);

    return ProfileModel(
      ok: json['OK'],
      data: json['Data'][0],
      dataInfo: userData,
    );
  }
}

class DataInfo {
  String? patientName;
  var dob;
  String? mobileNo;
  String? email;
  String? gender;

  DataInfo(
      {this.patientName, this.dob, this.mobileNo, this.email, this.gender});

  factory DataInfo.fromJson(Map<String, dynamic> json) {
    return DataInfo(
        patientName: json['PatientName'],
        dob: json['DOB'],
        mobileNo: json['MobileNo'],
        email: json['Email']);
  }
}
