
import 'package:bloc/bloc.dart';
import 'package:hospital_app/Doctor/HospitalServices/hospital_Services.dart';
import 'package:hospital_app/Doctor/HospitalServices/hospital_model.dart';
import 'package:meta/meta.dart';

part 'hospital_event.dart';
part 'hospital_state.dart';

class HospitalBloc extends Bloc<HospitalEvent, HospitalState> {
  HospitalServices hospitalServices = HospitalServices();
  List<String>? doctoList;
  HospitalBloc() : super(HospitalInitial()) {
    on<HospitalLoadingEvent>((event, emit) async {
      emit(HospitalLoadingState());
      try {
        doctoList = await hospitalServices.getHospitalList();
        // print(doctoList);
        emit(HospitalLoadedState(doctoList!));
      } catch (exception) {
        print(exception.toString());
      }
    });
  }
}
