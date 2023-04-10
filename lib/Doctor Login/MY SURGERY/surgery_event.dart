part of 'surgery_bloc.dart';

@immutable
abstract class SurgeryEvent {}

class SurgeryFetchEvent extends SurgeryEvent{
  String? doctorID;
  String? dateOfSurgery;
  SurgeryFetchEvent({this.doctorID, this.dateOfSurgery});
}
