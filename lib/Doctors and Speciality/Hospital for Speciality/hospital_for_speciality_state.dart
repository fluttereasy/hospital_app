part of 'hospital_for_speciality_bloc.dart';

@immutable
abstract class HospitalForSpecialityState {}

class HospitalForSpecialityInitial extends HospitalForSpecialityState {}

class HospitalsLoadedState extends HospitalForSpecialityState {
  var data;
  HospitalsLoadedState(this.data);
}

class HospitalsNotLoaded extends HospitalForSpecialityState {
  String? error;
  HospitalsNotLoaded(this.error);
}