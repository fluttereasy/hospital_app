part of 'optical_bloc.dart';

@immutable
abstract class OpticalState {}

class OpticalInitial extends OpticalState {}

class OpticalBillLoadingState extends OpticalState {}

class OpticalBillLoadedState extends OpticalState {
  var opticalData;
  OpticalBillLoadedState({this.opticalData});
}

class OpticalBillFailedState extends OpticalState {}
