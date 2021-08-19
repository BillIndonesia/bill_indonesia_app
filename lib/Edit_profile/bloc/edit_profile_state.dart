part of 'edit_profile_bloc.dart';

@freezed
class EditProfileState with _$EditProfileState {
  const factory EditProfileState({
    required String name,
    required String bornPlace,
    required DateTime bornDate,
    required String knowUsFrom,
    required bool showErrorMessages,
    required String image,
    required Uint8List? imageBytes,
    required FormSubmissionStatus formStatus,
  }) = _EditProfileState;

  factory EditProfileState.initial() => EditProfileState(
        name: '',
        bornPlace: '',
        image: '',
        imageBytes: null,
        knowUsFrom: 'Dari mana anda tau Bill ?',
        bornDate: DateTime.now(),
        showErrorMessages: false,
        formStatus: InitialFormStatus(),
      );
  const EditProfileState._();

  bool get isFormValid {
    bool validIf = name != '' &&
        bornPlace != '' &&
        knowUsFrom != 'Dari mana anda tau Bill ?';
    return validIf;
  }
}
