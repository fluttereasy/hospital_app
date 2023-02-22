import 'package:bloc/bloc.dart';
import 'package:hospital_app/Doctors%20and%20Speciality/Hospital%20for%20Speciality/hospital_for_speciality_services.dart';
import 'package:meta/meta.dart';

part 'hospital_for_speciality_event.dart';
part 'hospital_for_speciality_state.dart';

class HospitalForSpecialityBloc
    extends Bloc<HospitalForSpecialityEvent, HospitalForSpecialityState> {
  HospitalForSpecialityServices hospitalForSpecialityServices =
      HospitalForSpecialityServices();
  HospitalForSpecialityBloc() : super(HospitalForSpecialityInitial()) {
    on<HospitalsForspecialityLoadingEvent>((event, emit) async{
      try {
        final data = await hospitalForSpecialityServices
            .getHospitalsForSpeciality(event.searchText.toString());
        emit(HospitalsLoadedState(data));
      } catch (error) {
        emit(HospitalsNotLoaded(error.toString()));
      }
    });
  }
}
