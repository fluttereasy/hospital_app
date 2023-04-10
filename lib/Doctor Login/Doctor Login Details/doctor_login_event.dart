part of 'doctor_login_bloc.dart';

@immutable
abstract class DoctorLoginEvent {}

class DoctorLoginFetch extends DoctorLoginEvent{
  String? phoneNumber;
  DoctorLoginFetch({this.phoneNumber});
}
