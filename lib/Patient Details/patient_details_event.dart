part of 'patient_details_bloc.dart';

@immutable
abstract class PatientDetailsEvent {}


class SendPatientDetailsEvent extends PatientDetailsEvent {
  String? phoneNumber;
  String? emailID;
  String? patientName;
  String? age;
  String? gender;

  SendPatientDetailsEvent(
      {this.patientName,
      this.emailID,
      this.phoneNumber,
      this.gender,
      this.age});
}
