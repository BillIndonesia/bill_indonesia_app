part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    required String phoneNumber,
    required String pinNumber,
    required String name,
    required String email,
    required String token,
    required String firebaseToken,
    required String bornPlace,
    required DateTime bornDate,
    required double balance,
  }) = _UserState;

  factory UserState.initial() => UserState(
        phoneNumber: '',
        pinNumber: '',
        name: '',
        email: '',
        token: '',
        firebaseToken: '',
        bornPlace: '',
        bornDate: DateTime.now(),
        balance: 0.0,
      );
}
