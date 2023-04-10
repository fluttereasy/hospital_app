class DoctorLogin {
  int? ok;
  List<dynamic>? doctorLoginDetails;
  DoctorLogin({this.ok, this.doctorLoginDetails});
  factory DoctorLogin.fromJson(Map<String, dynamic> json) {
    return DoctorLogin(
        ok: json['OK'], doctorLoginDetails: json['Data']);
  }
}
