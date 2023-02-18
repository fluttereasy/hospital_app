part of 'hospital_bloc.dart';

@immutable
abstract class HospitalState {}

class HospitalInitial extends HospitalState {}

class HospitalLoadingState extends HospitalState {}

class HospitalLoadedState extends HospitalState {
  List<String>doctoList;
  HospitalLoadedState(this.doctoList);

}


class HospitalFailedState extends HospitalState {}
