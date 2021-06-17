part of 'sign_up_profile_bloc.dart';

@freezed
class SignUpProfileState with _$SignUpProfileState {
  const factory SignUpProfileState({
    required String name,
    required String bornPlace,
    required DateTime bornDate,
    required String knowUsFrom,
    required bool showErrorMessages,
    File? imagePath,
    required FormSubmissionStatus formStatus,
  }) = _SignUpProfileState;

  factory SignUpProfileState.initial() => SignUpProfileState(
        name: '',
        bornPlace: '',
        knowUsFrom: 'Dari mana anda tau Bill ?',
        bornDate: DateTime.now(),
        showErrorMessages: false,
        formStatus: InitialFormStatus(),
      );
  const SignUpProfileState._();

  bool get isFormValid {
    bool validIf = name != '' &&
        bornPlace != '' &&
        knowUsFrom != 'Dari mana anda tau Bill ?';
    return validIf;
  }
}
