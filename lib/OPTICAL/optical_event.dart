part of 'optical_bloc.dart';

@immutable
abstract class OpticalEvent {}

class OpticalBillFetchEvent extends OpticalEvent {
  String? phoneNumber;
  OpticalBillFetchEvent({this.phoneNumber});
}
