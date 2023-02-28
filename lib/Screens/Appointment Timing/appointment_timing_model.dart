class AppointmentModel {
  String? morning;
  String? afternoon;
  String? evening;

  AppointmentModel({this.morning, this.afternoon, this.evening});

  AppointmentModel.fromJson(Map<String, dynamic> json) {
    morning = json['Morning'];
    afternoon = json['Afternoon'];
    evening = json['Evening'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Morning'] = this.morning;
    data['Afternoon'] = this.afternoon;
    data['Evening'] = this.evening;
    return data;
  }
}
