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
          id: 0,
          name: '',
          email: '',
          image: '',
          phoneNumber: '',
          saldo: 0,
          bornplace: '',
          bornDate: '',
        ),
        loadingStatus: UserLoadingStatus.initial,
      );
  const UserState._();
}
