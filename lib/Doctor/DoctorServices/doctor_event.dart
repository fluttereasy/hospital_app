part of 'doctor_bloc.dart';

@immutable
abstract class DoctorEvent {}

class DoctorLoadingEvent extends DoctorEvent {
  int? rowID;
  DoctorLoadingEvent(this.rowID);
}

class DoctorReloadingEvent extends DoctorEvent {
  int? rowId;
  DoctorReloadingEvent(this.rowId);
}

class AppointmentButtonCLicked extends DoctorEvent {
  int? rowID;
  String? doctorName;
  AppointmentButtonCLicked(this.rowID, this.doctorName);
}