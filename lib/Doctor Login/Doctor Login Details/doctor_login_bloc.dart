import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'doctot_login_services.dart';

part 'doctor_login_event.dart';
part 'doctor_login_state.dart';

class DoctorLoginBloc extends Bloc<DoctorLoginEvent, DoctorLoginState> {
  DoctorLoginServices doctorLoginServices = DoctorLoginServices();
  DoctorLoginBloc() : super(DoctorLoginInitial()) {
    on<DoctorLoginFetch>((event, emit) async {
      try {
        emit(DoctorLoginLoadingState());
        final doctorLogin = await doctorLoginServices
            .getDoctorLoginDetails(event.phoneNumber.toString());
        emit(DoctorLoginLoadedState(isDoctor: doctorLogin));
      } on Exception catch (e) {
        emit(DoctorLoginFailedState());
      }
    });
  }
}
