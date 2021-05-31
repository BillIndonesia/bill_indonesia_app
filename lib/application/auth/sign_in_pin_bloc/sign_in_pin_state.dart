part of 'sign_in_pin_bloc.dart';

@freezed
class SignInPinState with _$SignInPinState {
  const factory SignInPinState({
    required String pinNumber,
    required FormSubmissionStatus formStatus,
    required int suspendedTimer,
    required int failedSubmittingPin,
    required String errorMessages,
    required bool showErrorMessages,
    required bool isFormValid,
  }) = _SignInPinState;

  factory SignInPinState.initial() => SignInPinState(
        pinNumber: '',
        showErrorMessages: false,
        isFormValid: true,
        failedSubmittingPin: 0,
        suspendedTimer: 0,
        errorMessages: '',
        formStatus: InitialFormStatus(),
      );
  const SignInPinState._();
  bool get isPinFormValid => pinNumber.length == 6;
  bool get isUserSuspended => failedSubmittingPin >= 3;
}
