part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class ProfileLoadingEvent extends ProfileEvent{}

class ProfileLoadedEvent extends ProfileEvent{}

class ProfileFailedEvent extends ProfileEvent{}