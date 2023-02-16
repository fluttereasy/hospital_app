import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'doctor_list_event.dart';
part 'doctor_list_state.dart';

class DoctorListBloc extends Bloc<DoctorListEvent, DoctorListState> {
  DoctorListBloc() : super(DoctorListInitial()) {
    on<DoctorListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
