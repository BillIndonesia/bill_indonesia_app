part of 'sign_up_bloc.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState({
    required String phoneNumber,
    required String otpCode,
    required String otpCodeGenerated,
    required String errorMessages,
    required bool showErrorMessages,
    required int waitingTimer,
    required bool isFormValid,
  }) = _SignUpState;

  factory SignUpState.initial() => SignUpState(
        phoneNumber: '',
        otpCode: '',
        otpCodeGenerated: '',
        showErrorMessages: false,
        isFormValid: true,
        waitingTimer: 0,
        errorMessages: '',
      );
  const SignUpState._();
  bool get isPinFormValid {
    return otpCode != 'abcd';
  }
}
