part of 'appointment_bloc.dart';

@immutable
abstract class AppointmentEvent {}

class AppointmentLoadingEvent extends AppointmentEvent{
  String? doctorID;
  String? unitID;
  String? date;
  AppointmentLoadingEvent(this.doctorID ,this.unitID , this.date);
}
