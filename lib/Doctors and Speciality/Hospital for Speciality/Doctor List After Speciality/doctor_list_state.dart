part of 'doctor_list_bloc.dart';

@immutable
abstract class DoctorListState {}

class DoctorListInitial extends DoctorListState {}

class DoctorListLoadingState extends DoctorListState {}

class DoctorListLoadedState extends DoctorListState {
  var doctorList;
  DoctorListLoadedState(this.doctorList);
}

class DoctorListNotLoadedState extends DoctorListState {}

class DoctorListScreenState extends DoctorListState {
  var doctorListData;
  DoctorListScreenState(this.doctorListData);
}
