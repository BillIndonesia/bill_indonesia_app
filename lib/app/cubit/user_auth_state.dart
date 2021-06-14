part of 'user_auth_cubit.dart';

enum AuthStatus { initial, loading, success, failure }

@freezed
class UserAuthState with _$UserAuthState {
  const factory UserAuthState({
    required String userToken,
    required AuthStatus authStatus,
  }) = _UserAuthState;

  factory UserAuthState.initial() => const UserAuthState(
        userToken: '',
        authStatus: AuthStatus.initial,
      );
  const UserAuthState._();
}
