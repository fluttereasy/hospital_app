part of 'patient_details_bloc.dart';

@immutable
abstract class PatientDetailsState {}

class PatientDetailsInitial extends PatientDetailsState {}

class PatientDetailsInserting extends PatientDetailsState{}

class PatientDetailsInserted extends PatientDetailsState{}

class PatientDetailsNotInserted extends PatientDetailsState{}

