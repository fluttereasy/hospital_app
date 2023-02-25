import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:hospital_app/Screens/Appointment/selectDoctorprofile_services.dart';
import 'package:meta/meta.dart';

part 'select_doctor_profile_event.dart';
part 'select_doctor_profile_state.dart';

class SelectDoctorProfileBloc
    extends Bloc<SelectDoctorProfileEvent, SelectDoctorProfileState> {
  SelectDoctorSeervices selectDoctorSeervices = SelectDoctorSeervices();
  SelectDoctorProfileBloc() : super(SelectDoctorProfileInitial()) {
    on<DoctorSelectEvent>((event, emit) async {
      // For fetching selected Doctor Profile Details
      try {
        print('inside try catch bloc');
        final selectedDoctroInfo = await selectDoctorSeervices
            .selectDoctorService(event.unitID, event.doctorId.toString());
        print('loaded');
        print(selectedDoctroInfo);
        emit(SelectDoctorProfileLoaded(selectedDoctroInfo));
      } catch (e) {
        print(e.toString());
      }
    });
  }
}
