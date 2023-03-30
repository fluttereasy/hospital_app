import 'package:bloc/bloc.dart';
import 'package:hospital_app/PHARMACY/pharmacy_servces.dart';
import 'package:meta/meta.dart';

part 'pharmacy_event.dart';
part 'pharmacy_state.dart';

class PharmacyBloc extends Bloc<PharmacyEvent, PharmacyState> {
  PharmacyBloc() : super(PharmacyInitial()) {
    PharmacyServices pharmacyServices = PharmacyServices();
    on<PharmacyDataFetchEvent>((event, emit) async {
      emit(PharmacyDataLoadingState());
      try {
        final pharmacyData =
            await pharmacyServices.getPharmacyData(event.phoneNumer.toString());
        emit(PharmacyDataLoadedState(pharmacyData: pharmacyData));
      } on Exception catch (e) {
        emit(PharmacyDataFailedState());
      }
    });
  }
}
