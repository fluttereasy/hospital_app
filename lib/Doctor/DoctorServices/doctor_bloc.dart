import 'package:bloc/bloc.dart';
import 'package:hospital_app/Doctor/DoctorServices/doctor_services.dart';
import 'package:meta/meta.dart';

part 'doctor_event.dart';
part 'doctor_state.dart';

class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {
  DoctorServices doctorServices = DoctorServices();
  List<String> doctorList = [];
  DoctorBloc() : super(DoctorInitial()) {
    on<DoctorLoadingEvent>((event, emit) async {
      try {
        print('inside doctor list try catch');

        print(event.rowID);

        doctorList =
            await doctorServices.getDoctorList(event.rowID) as List<String>;

        print('bloc list $doctorList');

        emit(DoctorLoadedState(doctorList));

        print('emitted Doctrorloaded');

        on<AppointmentButtonCLicked>((event, emit) =>
            {emit(DoctorDetailsFetchState()), print('buttonClickedEvent')});
      } catch (e) {
        emit(DoctorFailedState());
      }
    });
  }
}
