part of 'doctor_login_opd_appointment_bloc.dart';

@immutable
abstract class DoctorLoginOpdAppointmentState {}

class DoctorLoginOpdAppointmentInitial extends DoctorLoginOpdAppointmentState {}

class DoctorLoginOpdAppointmentLoadingState extends DoctorLoginOpdAppointmentState {}

class DoctorLoginOpdAppointmentLoadedState extends DoctorLoginOpdAppointmentState {
  var apppointmentData;
  DoctorLoginOpdAppointmentLoadedState({this.apppointmentData});
}

class DoctorLoginOpdAppointmentFailedState extends DoctorLoginOpdAppointmentState {}
