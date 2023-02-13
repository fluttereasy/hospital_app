import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hospital_app/Doctor/HospitalServices/hospital_Services.dart';
import 'package:meta/meta.dart';

import 'hospital_model.dart';

part 'hospital_list_event.dart';
part 'hospital_list_state.dart';

class HospitalListBloc extends Bloc<HospitalListEvent, HospitalListState> {
  HospitalServices hospitalServices = HospitalServices();

  HospitalListBloc() : super(HospitalListInitial()) {
    on<HospitalListEvent>((event, emit) async {
      try {
        final hospitalList = await hospitalServices.getHospitalList();
        print(hospitalList[1].hospitalName);
        emit(HospitalListLoadedState(hospitalList));
        on<HospitalListShowEvent>((event, emit) {
          print('in list show Event');
          emit(HospitalListShowState(event.showList));
        });
      } catch (e) {
        print(e.toString());
      }
    });
  }
}
