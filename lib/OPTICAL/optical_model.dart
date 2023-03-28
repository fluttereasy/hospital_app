class OpticalModel {
  int? ok;
  List<dynamic>? salesOrder;
  OpticalModel({this.ok, this.salesOrder});
  factory OpticalModel.fromJson(Map<String, dynamic> json) {
    return OpticalModel(ok: json['OK'], salesOrder: json['salesOrder']);
  }
}

class SalesOrder {
  String? recieptNo;
  String? recieptDate;
  String? recieptTime;
  String? patientId;
  String? patientName;
  String? mobileNumber;
  String? age;
  String? gender;
  String? optomName;
  String? deliveryDate;
  String? deliveryStatus;
  Null? pType;
  String? advance;
  String? balance;
  String? totalAmount;

  SalesOrder(
      {this.recieptNo,
      this.recieptDate,
      this.recieptTime,
      this.patientId,
      this.patientName,
      this.mobileNumber,
      this.age,
      this.gender,
      this.optomName,
      this.deliveryDate,
      this.deliveryStatus,
      this.pType,
      this.advance,
      this.balance,
      this.totalAmount});

  SalesOrder.fromJson(Map<String, dynamic> json) {
    recieptNo = json['RecieptNo'];
    recieptDate = json['RecieptDate'];
    recieptTime = json['recieptTime'];
    patientId = json['PatientId'];
    patientName = json['PatientName'];
    mobileNumber = json['MobileNumber'];
    age = json['Age'];
    gender = json['Gender'];
    optomName = json['OptomName'];
    deliveryDate = json['DeliveryDate'];
    deliveryStatus = json['DeliveryStatus'];
    pType = json['PType'];
    advance = json['Advance'];
    balance = json['Balance'];
    totalAmount = json['TotalAmount'];
  }
}
