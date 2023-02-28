import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hospital_app/Patient%20Details/patient_details_services.dart';
import 'package:meta/meta.dart';

part 'patient_details_event.dart';
part 'patient_details_state.dart';

class PatientDetailsBloc extends Bloc<PatientDetailsEvent, PatientDetailsState> {
  PatientDetailServices pateintDetailsServices = PatientDetailServices();
  PatientDetailsBloc() : super(PatientDetailsInitial()) {
    on<SendPatientDetailsEvent>((event, emit) {
      PatientDetailsInserting();
      try{
        pateintDetailsServices.postPatientDetails(event.patientName.toString(), event.age.toString(), event.phoneNumber.toString(), event.gender.toString(), event.emailID.toString());
        print('Details Inserted bloc heree');
        emit(PatientDetailsInserted());
      }catch(e){
        print(e.toString());
      }
    });
  }
}
