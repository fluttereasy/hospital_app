import 'package:equatable/equatable.dart';

import 'ProfileJsonModel/profileModel.dart';

abstract class ProfileState extends Equatable {}

class ProfileInitialState extends ProfileState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProfileLoadingState extends ProfileState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProfileLoadedState extends ProfileState {
  ProfileModel details;
  ProfileLoadedState(this.details);
  @override
  // TODO: implement props
  List<Object?> get props => [details];
}

class ProfileFailedState extends ProfileState {
  String? error;
  ProfileFailedState(this.error);
  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
