part of 'sign_up_bloc.dart';

@freezed
class SignUpEvent with _$SignUpEvent {
  const factory SignUpEvent.getOtpScreenInit(String phoneNumber) =
      GetOtpScreenInit;
  const factory SignUpEvent.otpFormChanged(String otpCode) = OTPFormChanged;
  const factory SignUpEvent.otpTimer(int otpClock) = OTPTimer;
  const factory SignUpEvent.resendOtp(String phoneNumber) = ResendOtp;
  const factory SignUpEvent.cleanCache() = CleanChace;
}
