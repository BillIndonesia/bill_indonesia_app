// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user_auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserAuthStateTearOff {
  const _$UserAuthStateTearOff();

  _UserAuthState call(
      {required String userToken, required AuthStatus authStatus}) {
    return _UserAuthState(
      userToken: userToken,
      authStatus: authStatus,
    );
  }
}

/// @nodoc
const $UserAuthState = _$UserAuthStateTearOff();

/// @nodoc
mixin _$UserAuthState {
  String get userToken => throw _privateConstructorUsedError;
  AuthStatus get authStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserAuthStateCopyWith<UserAuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAuthStateCopyWith<$Res> {
  factory $UserAuthStateCopyWith(
          UserAuthState value, $Res Function(UserAuthState) then) =
      _$UserAuthStateCopyWithImpl<$Res>;
  $Res call({String userToken, AuthStatus authStatus});
}

/// @nodoc
class _$UserAuthStateCopyWithImpl<$Res>
    implements $UserAuthStateCopyWith<$Res> {
  _$UserAuthStateCopyWithImpl(this._value, this._then);

  final UserAuthState _value;
  // ignore: unused_field
  final $Res Function(UserAuthState) _then;

  @override
  $Res call({
    Object? userToken = freezed,
    Object? authStatus = freezed,
  }) {
    return _then(_value.copyWith(
      userToken: userToken == freezed
          ? _value.userToken
          : userToken // ignore: cast_nullable_to_non_nullable
              as String,
      authStatus: authStatus == freezed
          ? _value.authStatus
          : authStatus // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
    ));
  }
}

/// @nodoc
abstract class _$UserAuthStateCopyWith<$Res>
    implements $UserAuthStateCopyWith<$Res> {
  factory _$UserAuthStateCopyWith(
          _UserAuthState value, $Res Function(_UserAuthState) then) =
      __$UserAuthStateCopyWithImpl<$Res>;
  @override
  $Res call({String userToken, AuthStatus authStatus});
}

/// @nodoc
class __$UserAuthStateCopyWithImpl<$Res>
    extends _$UserAuthStateCopyWithImpl<$Res>
    implements _$UserAuthStateCopyWith<$Res> {
  __$UserAuthStateCopyWithImpl(
      _UserAuthState _value, $Res Function(_UserAuthState) _then)
      : super(_value, (v) => _then(v as _UserAuthState));

  @override
  _UserAuthState get _value => super._value as _UserAuthState;

  @override
  $Res call({
    Object? userToken = freezed,
    Object? authStatus = freezed,
  }) {
    return _then(_UserAuthState(
      userToken: userToken == freezed
          ? _value.userToken
          : userToken // ignore: cast_nullable_to_non_nullable
              as String,
      authStatus: authStatus == freezed
          ? _value.authStatus
          : authStatus // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
    ));
  }
}

/// @nodoc

class _$_UserAuthState extends _UserAuthState {
  const _$_UserAuthState({required this.userToken, required this.authStatus})
      : super._();

  @override
  final String userToken;
  @override
  final AuthStatus authStatus;

  @override
  String toString() {
    return 'UserAuthState(userToken: $userToken, authStatus: $authStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserAuthState &&
            (identical(other.userToken, userToken) ||
                const DeepCollectionEquality()
                    .equals(other.userToken, userToken)) &&
            (identical(other.authStatus, authStatus) ||
                const DeepCollectionEquality()
                    .equals(other.authStatus, authStatus)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userToken) ^
      const DeepCollectionEquality().hash(authStatus);

  @JsonKey(ignore: true)
  @override
  _$UserAuthStateCopyWith<_UserAuthState> get copyWith =>
      __$UserAuthStateCopyWithImpl<_UserAuthState>(this, _$identity);
}

abstract class _UserAuthState extends UserAuthState {
  const factory _UserAuthState(
      {required String userToken,
      required AuthStatus authStatus}) = _$_UserAuthState;
  const _UserAuthState._() : super._();

  @override
  String get userToken => throw _privateConstructorUsedError;
  @override
  AuthStatus get authStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserAuthStateCopyWith<_UserAuthState> get copyWith =>
      throw _privateConstructorUsedError;
}
