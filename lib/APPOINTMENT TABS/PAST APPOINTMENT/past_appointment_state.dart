part of 'past_appointment_bloc.dart';

@immutable
abstract class PastAppointmentState {}

class PastAppointmentInitial extends PastAppointmentState {}


class PastComingAppointmentLoading extends PastAppointmentState{}
class PastComingAppointmentLoaded extends PastAppointmentState{
  var pastList;
  PastComingAppointmentLoaded({this.pastList});
}
class PastComingAppointmentFailed extends PastAppointmentState{}