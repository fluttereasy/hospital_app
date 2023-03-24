part of 'upcoming_bloc.dart';

@immutable
abstract class UpcomingState {}

class UpcomingInitial extends UpcomingState {}

class UpcomingAppoinmentLoadingState extends UpcomingState{}
class UpcomingAppoinmentLoadedState extends UpcomingState{
  var upComingList;
  UpcomingAppoinmentLoadedState({this.upComingList});
}
class UpcomingAppoinmentFailedState extends UpcomingState{}
