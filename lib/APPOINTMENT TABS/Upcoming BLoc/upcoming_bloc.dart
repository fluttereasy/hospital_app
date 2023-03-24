import 'dart:async';
import 'package:hospital_app/APPOINTMENT%20TABS/Upcoming%20BLoc/upcoming_appointment_services.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'upcoming_event.dart';
part 'upcoming_state.dart';

class UpcomingBloc extends Bloc<UpcomingEvent, UpcomingState> {
  UpcomingBloc() : super(UpcomingInitial()) {
    on<UpComingAppointmentFetch>((event, emit) async {
      UpcomingAppointmentServices upcomingAppointmentServices =
          UpcomingAppointmentServices();
      try {
        print('inside BLoc try catch');
        emit(UpcomingAppoinmentLoadingState());
        final upcomingAppointment = await upcomingAppointmentServices
            .upCpmingAppointment(event.phoneNumber.toString());
        emit(UpcomingAppoinmentLoadedState(upComingList: upcomingAppointment));
      } catch (e) {
        emit(UpcomingAppoinmentFailedState());
      }
    });
  }
}
