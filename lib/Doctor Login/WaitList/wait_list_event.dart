part of 'wait_list_bloc.dart';

@immutable
abstract class WaitListEvent {}

class FetchWaitingList extends WaitListEvent{
  String? doctorID;
  String? date;
  FetchWaitingList({this.doctorID, this.date});
}
