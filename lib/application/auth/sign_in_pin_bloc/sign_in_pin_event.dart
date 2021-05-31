part of 'sign_in_pin_bloc.dart';

@freezed
class SignInPinEvent with _$SignInPinEvent {
  const factory SignInPinEvent.pinFormChanged(String pinNumber) =
      PinFormChanged;
  const factory SignInPinEvent.pinFormSubmitted({
    required String phoneNumber,
    required String pinNumber,
  }) = PinFormSubmitted;
  const factory SignInPinEvent.suspendedPinTimerClicker(
    int suspendedTimer,
  ) = SuspendedPinTimerClicker;
}
