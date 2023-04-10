import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'doctor_login_appointment_services.dart';
part 'doctor_login_opd_appointment_event.dart';
part 'doctor_login_opd_appointment_state.dart';

class DoctorLoginOpdAppointmentBloc extends Bloc<DoctorLoginOpdAppointmentEvent,
    DoctorLoginOpdAppointmentState> {
  DoctorLoginOpdAppointmentBloc() : super(DoctorLoginOpdAppointmentInitial()) {
    MyOpdAppointmentServices myOpdAppointmentServices =
        MyOpdAppointmentServices();
    on<DoctorOpdFetchEvent>((event, emit) async {
      emit(DoctorLoginOpdAppointmentLoadingState());
      try {
        final appointmentData =
            await myOpdAppointmentServices.getDoctorLoginAppointment(
                event.doctorID.toString(), event.date.toString());
        emit(DoctorLoginOpdAppointmentLoadedState(
            apppointmentData: appointmentData));
      } catch (e) {
        emit(DoctorLoginOpdAppointmentFailedState());
      }
    });
  }
}
