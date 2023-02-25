part of 'select_doctor_profile_bloc.dart';

@immutable
abstract class SelectDoctorProfileState {}

class SelectDoctorProfileInitial extends SelectDoctorProfileState {}

class SelectDoctorProfileLoaded extends SelectDoctorProfileState {
  var doctorInfo;
  SelectDoctorProfileLoaded(this.doctorInfo);
}