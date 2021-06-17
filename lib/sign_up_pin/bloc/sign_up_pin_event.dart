part of 'sign_up_pin_bloc.dart';

@freezed
class SignUpPinEvent with _$SignUpPinEvent {
  const factory SignUpPinEvent.pinFormChanged(String pinNumber) =
      PinFormChanged;
  const factory SignUpPinEvent.pinConfirmationFormChanged(String pinNumber) =
      PinConfirmationFormChanged;
}
