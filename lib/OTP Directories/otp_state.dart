part of 'otp_bloc.dart';

abstract class OtpState extends Equatable {
  const OtpState();
}

class OtpInitial extends OtpState {
  @override
  List<Object> get props => [];
}

class OtpSentState extends OtpState{
  String?  otpCode;
  OtpSentState(this.otpCode);
  @override
  List<Object> get props => [otpCode.toString()];
}

class OtpVerifyingState extends OtpState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}