part of 'patient_details_bloc.dart';

@immutable
abstract class PatientDetailsEvent {}
abstract class PatientDetailsEvent2{}


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


class SendPatientDetailstoOnlineAPpointment extends PatientDetailsEvent {
  String? firstName;
  String? charges;
  String? chargesType;
  String? phoneNumber;
  String? emailID;
  String? age;
  String? gender;
  String? unitID;
  String? doctorID;
  String? dateTime;

  SendPatientDetailstoOnlineAPpointment(
      {this.phoneNumber,
      this.firstName,
      this.charges,
      this.chargesType,
      this.emailID,
      this.age,
      this.gender,
      this.unitID,
      this.doctorID,
      this.dateTime});
}
class SendDateTimeEvent extends PatientDetailsEvent {
  String? datTime;
  String? doctorID;
  String? unitID;
  SendDateTimeEvent({this.doctorID, this.unitID, this.datTime});
}
