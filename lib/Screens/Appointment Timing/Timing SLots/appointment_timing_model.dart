class AppointmentModel {
  String? morning;
  String? afternoon;
  String? evening;

  AppointmentModel(
      {this.morning, this.afternoon, this.evening, required});

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
        afternoon: json['Afternoon'],
        morning: json['Morning'],
        evening: json['Evening'],);
  }
}
