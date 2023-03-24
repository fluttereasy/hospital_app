part of 'past_appointment_bloc.dart';

@immutable
abstract class PastAppointmentEvent {}


class PastAppointmentFetch extends PastAppointmentEvent {
  String? phoneNumber;
  PastAppointmentFetch({this.phoneNumber});
}