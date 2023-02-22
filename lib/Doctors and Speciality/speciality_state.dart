part of 'speciality_bloc.dart';

@immutable
abstract class SpecialityState {}

class SpecialityInitial extends SpecialityState {}

class SpecialityLoadedState extends SpecialityState {
  List doctorSPecialityList;
  SpecialityLoadedState(this.doctorSPecialityList);
}

class SpecialityFailedToloadState extends SpecialityState{
  String? error;
  SpecialityFailedToloadState(this.error);
}