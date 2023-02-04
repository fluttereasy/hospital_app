import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:hospital_app/Internet/internet_event.dart';
import 'internet_states.dart';

class InternetBLoc extends Bloc<InternetEvent, InternetStates> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitysubscrpition;

  InternetBLoc() : super(InternetInitialState()) {
    on<InternetLostEvent>((event, emit) => emit(InternetLostState()));
    on<InternetGainedEvent>((event, emit) => emit(InternetGainedState()));

    _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(InternetGainedEvent());
      } else {
        add(InternetLostEvent());
      }
    });
  }
  @override
  Future<void> close() {
    connectivitysubscrpition?.cancel();
    return super.close();
  }
}
