part of 'otp_bloc.dart';

abstract class OtpEvent extends Equatable {
  const OtpEvent();
}

class ButtonClickedEvent extends OtpEvent {
  String? mobileNumber;
  ButtonClickedEvent({this.mobileNumber});
  @override
  // TODO: implement props
  List<Object?> get props => [mobileNumber];
}


class VerifyEvent extends OtpEvent{
  String? otpCodeEneter;
  VerifyEvent(this.otpCodeEneter);

  @override
  // TODO: implement props
  List<Object?> get props => [otpCodeEneter];
}