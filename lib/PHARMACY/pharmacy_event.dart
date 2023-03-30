part of 'pharmacy_bloc.dart';

@immutable
abstract class PharmacyEvent {}
class PharmacyDataFetchEvent extends PharmacyEvent{
  String ?phoneNumer;
  PharmacyDataFetchEvent({this.phoneNumer});
}