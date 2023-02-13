import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hospital_app/OTP%20Directories/otp_services.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpServices otpServices = OtpServices();

  OtpBloc() : super(OtpInitial()) {
    on<ButtonClickedEvent>((event, emit) async {
      try {
        print('in try catch');
        final otpCode =
            await otpServices.sendOtp(event.mobileNumber.toString());
        print(otpCode);
        emit(OtpSentState(otpCode.toString()));

      } catch (e) {}
    });
  }
}
