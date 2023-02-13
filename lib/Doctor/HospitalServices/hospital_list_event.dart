part of 'hospital_list_bloc.dart';

abstract class HospitalListEvent {}

class HospitalListLoadingEvent extends HospitalListEvent {}

class HospitalListLoaded extends HospitalListEvent {}

class HospitalListShowEvent extends HospitalListEvent {
  bool showList = false;
  HospitalListShowEvent(this.showList);
}
