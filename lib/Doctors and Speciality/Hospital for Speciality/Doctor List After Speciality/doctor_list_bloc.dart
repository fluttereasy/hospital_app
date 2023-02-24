import 'package:bloc/bloc.dart';
import 'package:hospital_app/Doctors%20and%20Speciality/Hospital%20for%20Speciality/Doctor%20List%20After%20Speciality/doctor_list_services.dart';
import 'package:meta/meta.dart';

part 'doctor_list_event.dart';
part 'doctor_list_state.dart';

class DoctorListBloc extends Bloc<DoctorListEvent, DoctorListState> {
  static var dataForList;
  DoctorListServices doctorListServices = DoctorListServices();

  DoctorListBloc() : super(DoctorListInitial()) {
    on<DoctorListFetchingEvent>((event, emit) async {
      emit(DoctorListLoadingState());
      try {
        final doctorListData = await doctorListServices.getDoctorList(
            event.id.toString(), event.doctorOrSpeciality.toString());
        DoctorListBloc.dataForList = doctorListData;
        emit(DoctorListScreenState(doctorListData));

        on<DoctorListScreenEvent>((event, emit) {
          emit(DoctorListScreenState(doctorListData));
        });
      } catch (e) {
        print(e.toString());
        emit(DoctorListNotLoadedState());
      }
    });
  }
}
