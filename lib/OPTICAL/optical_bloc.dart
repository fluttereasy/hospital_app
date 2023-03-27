import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'optical_event.dart';
part 'optical_state.dart';

class OpticalBloc extends Bloc<OpticalEvent, OpticalState> {
  OpticalBloc() : super(OpticalInitial()) {
    on<OpticalEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
