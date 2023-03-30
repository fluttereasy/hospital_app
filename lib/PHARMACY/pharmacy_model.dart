class PharmacyModel {
  int? ok;
  List<dynamic>? PharmacyBillList;
  PharmacyModel({this.ok, this.PharmacyBillList});
  factory PharmacyModel.fromJson(Map<String, dynamic> json) {
    return PharmacyModel(ok: json['OK'], PharmacyBillList: json['PharmacyBill']);
  }
}


class PharmacyBill {
  String ?receiptDate;
  String ?recieptNo;
  String ?patientId;
  String ?patientName;
  String ?mobileNumber;
  String ?amount;
  String ?recieptPayMode;
  String ?ptype;

  PharmacyBill({this.receiptDate,
    this.recieptNo,
    this.patientId,
    this.patientName,
    this.mobileNumber,
    this.amount,
    this.recieptPayMode,
    this.ptype});

  PharmacyBill.fromJson(Map<String, dynamic> json) {
    receiptDate = json['receipt_date'];
    recieptNo = json['reciept_no'];
    patientId = json['patient_id'];
    patientName = json['patient_name'];
    mobileNumber = json['mobile_number'];
    amount = json['amount'];
    recieptPayMode = json['reciept_pay_mode'];
    ptype = json['Ptype'];
  }
}