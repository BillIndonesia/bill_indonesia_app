part of 'sign_up_pin_bloc.dart';

@freezed
class SignUpPinState with _$SignUpPinState {
  const factory SignUpPinState({
    required String pinNumber,
    required String pinNumberConfirmation,
    required bool showErrorMessages,
    required FormSubmissionStatus formStatus,
  }) = _SignUpPinState;

  factory SignUpPinState.initial() => SignUpPinState(
        pinNumber: '',
        pinNumberConfirmation: '',
        showErrorMessages: false,
        formStatus: InitialFormStatus(),
      );
  const SignUpPinState._();
}
