//[
//     {
//         "EmpID": 0,
//         "Name": "DR. SMITESH  SHAH",
//         "Speciality": "CATARACT,RETINA",
//         "Title": "",
//         "AboutUs": null,
//         "Department": null,
//         "Designation": null,
//         "Image": "1-27-2020-55010-PM.png",
//         "HospitalId": 0,
//         "VisitDays": "| THU | SAT | TUE",
//         "dr_id": "1439",
//         "ConsultantCharges": "800",
//         "ChargesType": "BELOW AGE 30"
//     }
// ]

class DoctorListModel {
  int? empId;
  String? title;
  String? abooutUs;
  String? doctorName;
  String? department;
  String? imageUrl;
  int? hospitalId;
  int? doctorId;
  int? fee;
  String? chargesType;

  DoctorListModel(
      {this.empId,
        this.title,
        this.abooutUs,
        this.doctorName,
        this.department,
        this.imageUrl,
        this.hospitalId,
        this.doctorId,
        this.fee,
        this.chargesType});

  factory DoctorListModel.fromJson(Map<String, dynamic> json) {
    return DoctorListModel(
        empId: json['EmpID'],
        title: json['Title'],
        abooutUs: json['AboutUs'],
        doctorName: json['Name'],
        department: json['department'],
        hospitalId: json['HospitalId'],
        doctorId: json['dr_id'],
        fee: json['ConsultantCharges'],
        chargesType: json['ChargesType']);
  }
}
