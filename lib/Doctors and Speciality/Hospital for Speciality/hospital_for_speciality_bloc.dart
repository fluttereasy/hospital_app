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
    on<HospitalsForspecialityLoadingEvent>((event, emit) async {
      try {
        final data = await hospitalForSpecialityServices
            .getHospitalsForSpeciality(event.searchText.toString());
        print("${'This is Bloc ='}${data}");
        emit(HospitalsLoadedState(data));
      } catch (error) {
        emit(HospitalsNotLoaded(error.toString()));
        print('Hospital not loaded state emitted');
      }
    });
  }
}

// return TextField(
//                               controller: hosptalListController,
//                               onChanged: (value) =>
//                                   _runFilterForHospital(value),
//                               decoration: const InputDecoration(
//                                   fillColor: Colors.white,
//                                   filled: true,
//                                   hintText: 'Choose Hospital',
//                                   suffixIcon: Icon(
//                                     Icons.search,
//                                     color: Colors.black,
//                                   )),
//                               onTap: () {
//                                 setState(() {
//                                   showHospitalList = true;
//                                   showSpecialList = false;
//                                 });
//                               },
//                             );

// BlocBuilder<HospitalForSpecialityBloc,
//                             HospitalForSpecialityState>(
//                           builder: (context, state) {
//                             if (state is HospitalsLoadedState) {
//                               allHospitalUser = state.data;
//                               print(allHospitalUser![0]['UnitName']);
//                             }
//
//                           },
//                         ),
