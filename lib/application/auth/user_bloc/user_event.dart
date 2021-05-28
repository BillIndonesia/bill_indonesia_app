part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.getUserData(
    Map<String, dynamic> deviceData,
    String simData,
  ) = GetUserData;
}
