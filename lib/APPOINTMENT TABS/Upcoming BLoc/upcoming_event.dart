part of 'upcoming_bloc.dart';

@immutable
abstract class UpcomingEvent {}

class UpComingAppointmentFetch extends UpcomingEvent {
  String? phoneNumber;
  UpComingAppointmentFetch({this.phoneNumber});
}
