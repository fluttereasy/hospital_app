part of 'surgery_bloc.dart';

@immutable
abstract class SurgeryState {}

class SurgeryInitial extends SurgeryState {}

class SurgeryLoadingState extends SurgeryState {}

class SurgeryLoadedState extends SurgeryState {
  var surgeryData;
  SurgeryLoadedState({this.surgeryData});
}

class SurgeryFailedLoadedState extends SurgeryState {}
