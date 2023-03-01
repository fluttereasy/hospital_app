class AppointmentModel {
  String? morning;
  String? afternoon;
  String? evening;
  bool isSelected = false;

  AppointmentModel(
      {this.morning, this.afternoon, this.evening, required this.isSelected});

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
        afternoon: json['Afternoon'],
        morning: json['Morning'],
        evening: json['Evening'],
        isSelected: false);
  }
}
