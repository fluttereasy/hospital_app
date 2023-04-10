class SurgeryModel {
  int? ok;
  List<dynamic>? todayDoctorSurgery;
  SurgeryModel({this.ok, this.todayDoctorSurgery});
  factory SurgeryModel.fromJson(Map<String, dynamic> json) {
    return SurgeryModel(ok: json['OK'], todayDoctorSurgery: json['todaydoctorSurgery']);
  }
}


// class TodaydoctorSurgery {
//   String ?eMRID;
//   String ?cONSID;
//   String ?oPDID;
//   String ?mRDNO;
//   String? pATIENTNAME;
//   String ?mobileNumber;
//   String ?bOOKINGDATE;
//   String ?sURGDATE;
//   String ?sURName;
//   String? surgDr1;
//   String? sTATUS;
//   String? consName;
//   String ?age;
//   String ?registrationType;
//   String ?unitName;
//   String? side;
//   String ?surgName;
//   String ?surgTime;
//   String ?netAmount;
//
//   TodaydoctorSurgery({this.eMRID,
//     this.cONSID,
//     this.oPDID,
//     this.mRDNO,
//     this.pATIENTNAME,
//     this.mobileNumber,
//     this.bOOKINGDATE,
//     this.sURGDATE,
//     this.sURName,
//     this.surgDr1,
//     this.sTATUS,
//     this.consName,
//     this.age,
//     this.registrationType,
//     this.unitName,
//     this.side,
//     this.surgName,
//     this.surgTime,
//     this.netAmount});
//
//   TodaydoctorSurgery.fromJson(Map<String, dynamic> json) {
//     eMRID = json['EMR_ID'];
//     cONSID = json['CONS_ID'];
//     oPDID = json['OPD_ID'];
//     mRDNO = json['MRD_NO'];
//     pATIENTNAME = json['PATIENT_NAME'];
//     mobileNumber = json['MobileNumber'];
//     bOOKINGDATE = json['BOOKING_DATE'];
//     sURGDATE = json['SURG_DATE'];
//     sURName = json['SURName'];
//     surgDr1 = json['Surg_Dr1'];
//     sTATUS = json['STATUS'];
//     consName = json['Cons_Name'];
//     age = json['Age'];
//     registrationType = json['Registration_Type'];
//     unitName = json['UnitName'];
//     side = json['Side'];
//     surgName = json['Surg_Name'];
//     surgTime = json['SurgTime'];
//     netAmount = json['Net_Amount'];
//   }
// }