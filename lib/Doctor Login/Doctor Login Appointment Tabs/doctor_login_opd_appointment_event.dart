part of 'doctor_login_opd_appointment_bloc.dart';

@immutable
abstract class DoctorLoginOpdAppointmentEvent {}

class DoctorOpdFetchEvent extends DoctorLoginOpdAppointmentEvent{
  String? doctorID;
  String? date;
  DoctorOpdFetchEvent({this.doctorID , this.date});
}