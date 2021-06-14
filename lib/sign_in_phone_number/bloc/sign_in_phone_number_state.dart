part of 'sign_in_phone_number_bloc.dart';

@freezed
class SignInPhoneNumberState with _$SignInPhoneNumberState {
  const factory SignInPhoneNumberState({
    required String phoneNumber,
    required String errorMessages,
    required bool showErrorMessages,
    required bool isTermAndConditionChecked,
    required FormSubmissionStatus formStatus,
  }) = _SignInPhoneNumberState;

  factory SignInPhoneNumberState.initial() => const SignInPhoneNumberState(
        phoneNumber: '',
        showErrorMessages: false,
        errorMessages: '',
        isTermAndConditionChecked: false,
        formStatus: InitialFormStatus(),
      );
  const SignInPhoneNumberState._();
  bool get isPinFormValid {
    const pattern = r'^(?:[0][8])[0-9]{7,11}$';
    var regExp = RegExp(pattern);
    if (regExp.hasMatch(phoneNumber)) {
      return true;
    }
    return false;
  }
}
