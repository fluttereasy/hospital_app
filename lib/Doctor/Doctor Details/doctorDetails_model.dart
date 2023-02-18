//  "EmpID": 0,
// "Name": "DR. SONAL  SHAH",
// "Speciality": "CATARACT,LASIK ,CORNEA",
// "Title": "",
// "AboutUs": "| FRI | SUN | MON | WED",
// "Department": null,
// "Designation": null,
// "Image": "11-27-2019-113005-AM.png",
// "HospitalId": 0,
// "VisitDays": null,
// "dr_id": "2306"

class DoctorDetailsModel {
  int? empID;
  String? doctorName;
  String? imageUrl;
  String? speciality;
  String? aboutUs;
  int? hospitalID;
  int? drID;
  String? designation;
  String? title;

  DoctorDetailsModel(
      {this.empID,
      this.doctorName,
      this.imageUrl,
      this.speciality,
      this.aboutUs,
      this.hospitalID,
      this.drID,
      this.designation,
      this.title});

  factory DoctorDetailsModel.fromJson(Map<String, dynamic> json) {
    return DoctorDetailsModel(
        empID: json['EmpID'],
        doctorName: json['Name'],
        speciality: json['Speciality'],
        designation: json['Designation'],
        aboutUs: json['AboutUs'],
        title: json['Title'],
        drID: json['dr_id'],
        imageUrl: json['Image'],
        hospitalID: json['HospitalId']);
  }
}
