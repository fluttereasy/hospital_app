class DoctorLoginOpdAppointment {
  int? ok;
  List<dynamic>? doctorLoginDetails;
  DoctorLoginOpdAppointment({this.ok, this.doctorLoginDetails});
  factory DoctorLoginOpdAppointment.fromJson(Map<String, dynamic> json) {
    return DoctorLoginOpdAppointment(
        ok: json['OK'], doctorLoginDetails: json['doctodayAppt']);
  }
}
