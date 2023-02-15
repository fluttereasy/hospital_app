


import 'hospital_model.dart';

abstract class HospitalListState {}

class HospitalListInitial extends HospitalListState {}

class HospitalListLoadedState extends HospitalListState {
  List<HospitalModel>? nameOfHospital;
  HospitalListLoadedState(this.nameOfHospital);
}

class HospitalListShowState extends HospitalListState{
  bool showList;
  HospitalListShowState(this.showList);
}