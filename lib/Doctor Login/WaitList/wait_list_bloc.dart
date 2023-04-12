import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:hospital_app/Doctor%20Login/WaitList/waitlist_services.dart';
import 'package:meta/meta.dart';

part 'wait_list_event.dart';
part 'wait_list_state.dart';

class WaitListBloc extends Bloc<WaitListEvent, WaitListState> {
  WaitListBloc() : super(WaitListInitial()) {
    WaitlistServices waitlistServices = WaitlistServices();
    on<FetchWaitingList>((event, emit) async {
      emit(WaitListLoadingState());
      try {
        print('Inside waiting TC');
        var waitList = await waitlistServices.getWaitingList(
            event.doctorID.toString(), event.date.toString());
        print(waitList);
        emit(WaitListLoadedState(waitList: waitList));
      } catch (e) {
        print('failed');
        emit(WaitListFailedState());
      }
    });
  }
}
