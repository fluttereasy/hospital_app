import 'package:bloc/bloc.dart';
import 'package:hospital_app/Doctors%20and%20Speciality/doc_speciality_services.dart';
import 'package:meta/meta.dart';

part 'speciality_event.dart';
part 'speciality_state.dart';

class SpecialityBloc extends Bloc<SpecialityEvent, SpecialityState> {
  DoctorSpecialityServices doctorSpecialityServices =
      DoctorSpecialityServices();

  SpecialityBloc() : super(SpecialityInitial()) {
    on<SpecialityListFetchEvent>((event, emit) async {
      try {
        final specialitydata =
            await doctorSpecialityServices.getDoctorSpecialityList();
        emit(SpecialityLoadedState(specialitydata));
      } on Exception catch (e) {
        emit(SpecialityFailedToloadState(e.toString()));
      }
      // print(specialitydata);
    });
  }
}
