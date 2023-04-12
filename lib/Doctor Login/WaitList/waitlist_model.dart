class WaitListModel {
  int? ok;
  List<dynamic>? waitList;
  WaitListModel({this.ok, this.waitList});
  factory WaitListModel.fromJson(Map<String, dynamic> json) {
    return WaitListModel(ok: json['OK'], waitList: json['PatientWaitingList']);
  }
}
