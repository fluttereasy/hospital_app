import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hospital_app/APPOINTMENT%20TABS/PAST%20APPOINTMENT/past_appointment_servces.dart';
import 'package:meta/meta.dart';

part 'past_appointment_event.dart';
part 'past_appointment_state.dart';

class PastAppointmentBloc
    extends Bloc<PastAppointmentEvent, PastAppointmentState> {
  PastAppointmentBloc() : super(PastAppointmentInitial()) {
    on<PastAppointmentFetch>((event, emit) async {
      PastAppoinmentServices pastAppoinmentServices = PastAppoinmentServices();
      try {
        emit(PastComingAppointmentLoading());
        final pastAppointment = await pastAppoinmentServices
            .getPastAppointment(event.phoneNumber.toString());
        emit(PastComingAppointmentLoaded(pastList: pastAppointment));
      } catch (e) {
        emit(PastComingAppointmentFailed());
      }
    });
  }
}
