part of 'select_doctor_profile_bloc.dart';

@immutable
abstract class SelectDoctorProfileEvent {}

class DoctorSelectEvent extends SelectDoctorProfileEvent {
  String? unitID;
  String? doctorId;
  DoctorSelectEvent({this.unitID, this.doctorId});
}
