part of 'doctor_bloc.dart';

@immutable
abstract class DoctorState {}

class DoctorInitial extends DoctorState {}

class DoctorLoadingState extends DoctorState {}

class DoctorLoadedState extends DoctorState {
 List<String> doctorList;
 DoctorLoadedState(this.doctorList);
}

class DoctorDetailsFetchState extends DoctorState {}

class DoctorFailedState extends DoctorState {}
