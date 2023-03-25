part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class ProfileLoadingEvent extends ProfileEvent{
  String? mobileNumber;
  ProfileLoadingEvent({this.mobileNumber});
}

class FetchProfileEvent extends ProfileEvent{

}

class ProfileLoadedEvent extends ProfileEvent{}

class ProfileFailedEvent extends ProfileEvent{}