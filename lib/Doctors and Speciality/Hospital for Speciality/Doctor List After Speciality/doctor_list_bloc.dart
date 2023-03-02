import 'package:bloc/bloc.dart';
import 'package:hospital_app/Doctors%20and%20Speciality/Hospital%20for%20Speciality/Doctor%20List%20After%20Speciality/doctor_list_services.dart';
import 'package:meta/meta.dart';

import '../../../Screens/Appointment Timing/selectDoctorprofile_services.dart';

part 'doctor_list_event.dart';
part 'doctor_list_state.dart';

class DoctorListBloc extends Bloc<DoctorListEvent, DoctorListState> {
  static var dataForList;
  DoctorListServices doctorListServices = DoctorListServices();
  SelectDoctorSeervices selectDoctorSeervices = SelectDoctorSeervices();

  DoctorListBloc() : super(DoctorListInitial()) {
    on<DoctorListFetchingEvent>((event, emit) async {
      emit(DoctorListLoadingState());
      try {
        // for fetching Doctor List
        final doctorListData = await doctorListServices.getDoctorList(
            event.id as int, event.doctorOrSpeciality.toString());
        emit(DoctorListScreenState(doctorListData));

      } catch (e) {
        print(e.toString());
        emit(DoctorListNotLoadedState());
      }
    });
  }
}
