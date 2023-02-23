part of 'doctor_list_bloc.dart';

@immutable
abstract class DoctorListEvent {}

class DoctorListFetchingEvent extends DoctorListEvent {
  String? id;
  String? doctorOrSpeciality;
  DoctorListFetchingEvent({this.id, this.doctorOrSpeciality});
}

class DoctorListScreenEvent extends DoctorListEvent {}
