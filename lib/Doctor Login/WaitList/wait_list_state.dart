part of 'wait_list_bloc.dart';

@immutable
abstract class WaitListState {}

class WaitListInitial extends WaitListState {}

class WaitListLoadingState extends WaitListState {}

class WaitListLoadedState extends WaitListState {
  var waitList;
  WaitListLoadedState({this.waitList});
}

class WaitListFailedState extends WaitListState {}
