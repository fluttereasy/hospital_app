class PastComingAppointmentModel{
  int? ok;
  List<dynamic>?patient;
  PastComingAppointmentModel({this.ok, this.patient});
  factory PastComingAppointmentModel.fromJson(Map<String , dynamic>json){
    return PastComingAppointmentModel(
        ok: json['OK'],
        patient: json['PatUpcomingAppt']
    );
  }
}

class Patient{
  String ?patientName;
  String ?mObileNo;
  String ?bookingDate;
  String ?bookingTime;
  String ?appDate;
  String ?appTime;
  String ?charge;
  String ?chargeType;
  String ?drName;
  String ?dRID;

  Patient(
      {this.patientName,
        this.mObileNo,
        this.bookingDate,
        this.bookingTime,
        this.appDate,
        this.appTime,
        this.charge,
        this.chargeType,
        this.drName,
        this.dRID});

  Patient.fromJson(Map<String, dynamic> json) {
    patientName = json['PatientName'];
    mObileNo = json['MObileNo'];
    bookingDate = json['Booking_Date'];
    bookingTime = json['Booking_Time'];
    appDate = json['App_date'];
    appTime = json['App_Time'];
    charge = json['charge'];
    chargeType = json['ChargeType'];
    drName = json['Dr_Name'];
    dRID = json['DR_ID'];
  }
}