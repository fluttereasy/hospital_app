import 'package:bloc/bloc.dart';
import 'package:hospital_app/Patient%20Details/patient_details_services.dart';
import 'package:meta/meta.dart';
part 'patient_details_event.dart';
part 'patient_details_state.dart';

class PatientDetailsBloc
    extends Bloc<PatientDetailsEvent, PatientDetailsState> {
  PatientDetailServices pateintDetailsServices = PatientDetailServices();
  PatientDetailsServices2 patientDetailsServices2 = PatientDetailsServices2();
  PatientDetailsBloc() : super(PatientDetailsInitial()) {
    // First Event
    on<SendPatientDetailsEvent>((event, emit) async {
      PatientDetailsInserting();
      try {
        final details = await pateintDetailsServices.postPatientDetails(
            event.patientName.toString(),
            event.age.toString(),
            event.phoneNumber.toString(),
            event.gender.toString(),
            event.emailID.toString());
        emit(PatientDetailsInserted());
      } catch (e) {
        print(e.toString());
      }
    });
    // Second Event
    on<SendPatientDetailstoOnlineAPpointment>((event, emit) async {
      try {
        print('Inside 2 bloc event');
        emit(PatientDetailsSubmitting2());
        final data = await patientDetailsServices2.postPatientDetails2(
            event.firstName.toString(),
            event.gender.toString(),
            event.age.toString(),
            event.phoneNumber.toString(),
            event.emailID.toString(),
            event.charges.toString(),
            event.chargesType.toString(),
            event.unitID.toString(),
            event.doctorID.toString(),
            event.dateTime.toString());
        emit(PatientDetailsSubmitted2());
      } catch (e) {
        print(e.toString());
      }
    });
  }
}
