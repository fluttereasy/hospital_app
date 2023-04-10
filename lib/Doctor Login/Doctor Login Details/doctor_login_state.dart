part of 'doctor_login_bloc.dart';

@immutable
abstract class DoctorLoginState {}

class DoctorLoginInitial extends DoctorLoginState {}

class DoctorLoginLoadingState extends DoctorLoginState {}

class DoctorLoginLoadedState extends DoctorLoginState {
  var isDoctor;
  DoctorLoginLoadedState({this.isDoctor});
}

class DoctorLoginFailedState extends DoctorLoginState {}
