part of 'hospital_for_speciality_bloc.dart';

@immutable
abstract class HospitalForSpecialityEvent {}

class HospitalsForspecialityLoadingEvent extends HospitalForSpecialityEvent {
  String? searchText;
  HospitalsForspecialityLoadingEvent(this.searchText);
}

class HospitalsForspecialitySendEvent extends HospitalForSpecialityEvent {}
