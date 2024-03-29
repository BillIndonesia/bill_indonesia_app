part of 'edit_profile_bloc.dart';

@freezed
class EditProfileEvent with _$EditProfileEvent {
  const factory EditProfileEvent.initial(Map<dynamic, String> data) =
      EditProfileInitialData;
  const factory EditProfileEvent.nameFormChanged(String name) = NameFormChanged;
  const factory EditProfileEvent.bornPlaceFormChanged(String bornPlace) =
      BornPlaceFormChanged;
  const factory EditProfileEvent.knowUsFromChanged(String knowUsFrom) =
      KnowUsFromChanged;
  const factory EditProfileEvent.bornDateFormChanged(DateTime bornDate) =
      BornDateFormChanged;
  const factory EditProfileEvent.imageChanged(String image) = ImageChanged;
  const factory EditProfileEvent.formSubmitted({
    required String phoneNumber,
    required String password,
  }) = FromSubmitted;
}
