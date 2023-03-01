part of 'appointment_bloc.dart';

@immutable
abstract class AppointmentState {}

class AppointmentInitial extends AppointmentState {}

class AppointmentLoadingState extends AppointmentState{}

class AppointmentLoadedState extends AppointmentState{
  var timeList;
  AppointmentLoadedState(this.timeList);
}

class AppointmentFailedLoadState extends AppointmentState{}
