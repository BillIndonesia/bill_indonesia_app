part of 'sign_up_profile_bloc.dart';

@freezed
class SignUpProfileEvent with _$SignUpProfileEvent {
  const factory SignUpProfileEvent.nameFormChanged(String name) =
      NameFormChanged;
  const factory SignUpProfileEvent.bornPlaceFormChanged(String bornPlace) =
      BornPlaceFormChanged;
  const factory SignUpProfileEvent.knowUsFromChanged(String knowUsFrom) =
      KnowUsFromChanged;
  const factory SignUpProfileEvent.bornDateFormChanged(DateTime bornDate) =
      BornDateFormChanged;
  const factory SignUpProfileEvent.imageChanged(File imagePath) = ImageChanged;
  const factory SignUpProfileEvent.formSubmitted({
    required String phoneNumber,
    required String password,
  }) = FromSubmitted;
}
