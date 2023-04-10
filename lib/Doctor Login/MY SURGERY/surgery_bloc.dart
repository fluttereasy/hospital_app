import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hospital_app/Doctor%20Login/MY%20SURGERY/suregry_servies.dart';
import 'package:meta/meta.dart';

part 'surgery_event.dart';
part 'surgery_state.dart';

class SurgeryBloc extends Bloc<SurgeryEvent, SurgeryState> {
  SurgeryBloc() : super(SurgeryInitial()) {
    SurgryServices surgeryServices = SurgryServices();

    on<SurgeryFetchEvent>((event, emit) async {
      emit(SurgeryLoadingState());
      try {
        final surgeryData = await surgeryServices.getDoctorSurgeries(
            event.doctorID.toString(), event.dateOfSurgery.toString());
        emit(SurgeryLoadedState(
          surgeryData: surgeryData,
        ));
      } catch (e) {
        emit(SurgeryFailedLoadedState());
      }
    });

  }
}
