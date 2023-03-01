import 'package:bloc/bloc.dart';
import 'package:hospital_app/Screens/Appointment%20Timing/Timing%20SLots/appopintment_services.dart';
import 'package:meta/meta.dart';

part 'appointment_event.dart';
part 'appointment_state.dart';

class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {
  AppointmentServices appointmentServices = AppointmentServices();
  AppointmentBloc() : super(AppointmentInitial()) {
    on<AppointmentLoadingEvent>((event, emit) async {
      try {
        emit(AppointmentLoadingState());
        var timeList = await appointmentServices.getAppointmentTiming(
            event.doctorID.toString(),
            event.unitID.toString(),
            event.date!.toString());
        emit(AppointmentLoadedState(timeList));
      } catch (exception) {
        emit(AppointmentFailedLoadState());
      }
    });
  }
}
