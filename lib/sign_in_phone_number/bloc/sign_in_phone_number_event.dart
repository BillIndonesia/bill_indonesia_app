part of 'sign_in_phone_number_bloc.dart';

@freezed
class SignInPhoneNumberEvent with _$SignInPhoneNumberEvent {
  const factory SignInPhoneNumberEvent.phoneNumberFormChanged(
      String phoneNumber) = PhoneNumberFormChanged;
  const factory SignInPhoneNumberEvent.pinFormSubmitted(
    String phoneNumber,
  ) = PhoneNumberSubmitted;
  const factory SignInPhoneNumberEvent.termAndConditionChecked() =
      TermAndConditionChecked;
}
