part of 'user_cubit.dart';

enum UserLoadingStatus { initial, loading, success, failure }

@freezed
class UserState with _$UserState {
  const factory UserState({
    required String name,
    required UserData data,
    required UserLoadingStatus loadingStatus,
  }) = _UserState;

  factory UserState.initial() => UserState(
        name: '',
        data: UserData(
          name: '',
          email: '',
          image: '',
          phoneNumber: '',
          saldo: 0,
        ),
        loadingStatus: UserLoadingStatus.initial,
      );
  const UserState._();
}
