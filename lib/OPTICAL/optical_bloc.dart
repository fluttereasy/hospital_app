import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:hospital_app/OPTICAL/optical_services.dart';
import 'package:meta/meta.dart';

part 'optical_event.dart';
part 'optical_state.dart';

class OpticalBloc extends Bloc<OpticalEvent, OpticalState> {
  OpticalServices opticalServices = OpticalServices();
  OpticalBloc() : super(OpticalInitial()) {
    on<OpticalBillFetchEvent>((event, emit) async {
      emit(OpticalBillLoadingState());
      try {
        final opticalData =
            await opticalServices.getOpticalBill(event.phoneNumber.toString());
        emit(OpticalBillLoadedState(opticalData: opticalData));
      } catch (e) {
        emit(OpticalBillFailedState());
        print(e.toString());
      }
    });
  }
}
