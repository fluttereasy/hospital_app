part of 'pharmacy_bloc.dart';

@immutable
abstract class PharmacyState {}

class PharmacyInitial extends PharmacyState {}
class PharmacyDataLoadingState extends PharmacyState{}
class PharmacyDataLoadedState extends PharmacyState{
  var pharmacyData;
  PharmacyDataLoadedState({this.pharmacyData});
}

class PharmacyDataFailedState extends PharmacyState{}