// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserEventTearOff {
  const _$UserEventTearOff();

  GetUserData getUserData(Map<String, dynamic> deviceData, String simData) {
    return GetUserData(
      deviceData,
      simData,
    );
  }
}

/// @nodoc
const $UserEvent = _$UserEventTearOff();

/// @nodoc
mixin _$UserEvent {
  Map<String, dynamic> get deviceData => throw _privateConstructorUsedError;
  String get simData => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic> deviceData, String simData)
        getUserData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> deviceData, String simData)?
        getUserData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetUserData value) getUserData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUserData value)? getUserData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserEventCopyWith<UserEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEventCopyWith<$Res> {
  factory $UserEventCopyWith(UserEvent value, $Res Function(UserEvent) then) =
      _$UserEventCopyWithImpl<$Res>;
  $Res call({Map<String, dynamic> deviceData, String simData});
}

/// @nodoc
class _$UserEventCopyWithImpl<$Res> implements $UserEventCopyWith<$Res> {
  _$UserEventCopyWithImpl(this._value, this._then);

  final UserEvent _value;
  // ignore: unused_field
  final $Res Function(UserEvent) _then;

  @override
  $Res call({
    Object? deviceData = freezed,
    Object? simData = freezed,
  }) {
    return _then(_value.copyWith(
      deviceData: deviceData == freezed
          ? _value.deviceData
          : deviceData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      simData: simData == freezed
          ? _value.simData
          : simData // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class $GetUserDataCopyWith<$Res> implements $UserEventCopyWith<$Res> {
  factory $GetUserDataCopyWith(
          GetUserData value, $Res Function(GetUserData) then) =
      _$GetUserDataCopyWithImpl<$Res>;
  @override
  $Res call({Map<String, dynamic> deviceData, String simData});
}

/// @nodoc
class _$GetUserDataCopyWithImpl<$Res> extends _$UserEventCopyWithImpl<$Res>
    implements $GetUserDataCopyWith<$Res> {
  _$GetUserDataCopyWithImpl(
      GetUserData _value, $Res Function(GetUserData) _then)
      : super(_value, (v) => _then(v as GetUserData));

  @override
  GetUserData get _value => super._value as GetUserData;

  @override
  $Res call({
    Object? deviceData = freezed,
    Object? simData = freezed,
  }) {
    return _then(GetUserData(
      deviceData == freezed
          ? _value.deviceData
          : deviceData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      simData == freezed
          ? _value.simData
          : simData // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetUserData implements GetUserData {
  const _$GetUserData(this.deviceData, this.simData);

  @override
  final Map<String, dynamic> deviceData;
  @override
  final String simData;

  @override
  String toString() {
    return 'UserEvent.getUserData(deviceData: $deviceData, simData: $simData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GetUserData &&
            (identical(other.deviceData, deviceData) ||
                const DeepCollectionEquality()
                    .equals(other.deviceData, deviceData)) &&
            (identical(other.simData, simData) ||
                const DeepCollectionEquality().equals(other.simData, simData)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(deviceData) ^
      const DeepCollectionEquality().hash(simData);

  @JsonKey(ignore: true)
  @override
  $GetUserDataCopyWith<GetUserData> get copyWith =>
      _$GetUserDataCopyWithImpl<GetUserData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic> deviceData, String simData)
        getUserData,
  }) {
    return getUserData(deviceData, simData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> deviceData, String simData)?
        getUserData,
    required TResult orElse(),
  }) {
    if (getUserData != null) {
      return getUserData(deviceData, simData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetUserData value) getUserData,
  }) {
    return getUserData(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUserData value)? getUserData,
    required TResult orElse(),
  }) {
    if (getUserData != null) {
      return getUserData(this);
    }
    return orElse();
  }
}

abstract class GetUserData implements UserEvent {
  const factory GetUserData(Map<String, dynamic> deviceData, String simData) =
      _$GetUserData;

  @override
  Map<String, dynamic> get deviceData => throw _privateConstructorUsedError;
  @override
  String get simData => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $GetUserDataCopyWith<GetUserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$UserStateTearOff {
  const _$UserStateTearOff();

  _UserState call(
      {required String phoneNumber,
      required String pinNumber,
      required String name,
      required String email,
      required String token,
      required String firebaseToken,
      required String bornPlace,
      required DateTime bornDate,
      required double balance}) {
    return _UserState(
      phoneNumber: phoneNumber,
      pinNumber: pinNumber,
      name: name,
      email: email,
      token: token,
      firebaseToken: firebaseToken,
      bornPlace: bornPlace,
      bornDate: bornDate,
      balance: balance,
    );
  }
}

/// @nodoc
const $UserState = _$UserStateTearOff();

/// @nodoc
mixin _$UserState {
  String get phoneNumber => throw _privateConstructorUsedError;
  String get pinNumber => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  String get firebaseToken => throw _privateConstructorUsedError;
  String get bornPlace => throw _privateConstructorUsedError;
  DateTime get bornDate => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserStateCopyWith<UserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res>;
  $Res call(
      {String phoneNumber,
      String pinNumber,
      String name,
      String email,
      String token,
      String firebaseToken,
      String bornPlace,
      DateTime bornDate,
      double balance});
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res> implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  final UserState _value;
  // ignore: unused_field
  final $Res Function(UserState) _then;

  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? pinNumber = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? token = freezed,
    Object? firebaseToken = freezed,
    Object? bornPlace = freezed,
    Object? bornDate = freezed,
    Object? balance = freezed,
  }) {
    return _then(_value.copyWith(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      pinNumber: pinNumber == freezed
          ? _value.pinNumber
          : pinNumber // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      firebaseToken: firebaseToken == freezed
          ? _value.firebaseToken
          : firebaseToken // ignore: cast_nullable_to_non_nullable
              as String,
      bornPlace: bornPlace == freezed
          ? _value.bornPlace
          : bornPlace // ignore: cast_nullable_to_non_nullable
              as String,
      bornDate: bornDate == freezed
          ? _value.bornDate
          : bornDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$UserStateCopyWith<$Res> implements $UserStateCopyWith<$Res> {
  factory _$UserStateCopyWith(
          _UserState value, $Res Function(_UserState) then) =
      __$UserStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String phoneNumber,
      String pinNumber,
      String name,
      String email,
      String token,
      String firebaseToken,
      String bornPlace,
      DateTime bornDate,
      double balance});
}

/// @nodoc
class __$UserStateCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$UserStateCopyWith<$Res> {
  __$UserStateCopyWithImpl(_UserState _value, $Res Function(_UserState) _then)
      : super(_value, (v) => _then(v as _UserState));

  @override
  _UserState get _value => super._value as _UserState;

  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? pinNumber = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? token = freezed,
    Object? firebaseToken = freezed,
    Object? bornPlace = freezed,
    Object? bornDate = freezed,
    Object? balance = freezed,
  }) {
    return _then(_UserState(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      pinNumber: pinNumber == freezed
          ? _value.pinNumber
          : pinNumber // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      firebaseToken: firebaseToken == freezed
          ? _value.firebaseToken
          : firebaseToken // ignore: cast_nullable_to_non_nullable
              as String,
      bornPlace: bornPlace == freezed
          ? _value.bornPlace
          : bornPlace // ignore: cast_nullable_to_non_nullable
              as String,
      bornDate: bornDate == freezed
          ? _value.bornDate
          : bornDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_UserState implements _UserState {
  const _$_UserState(
      {required this.phoneNumber,
      required this.pinNumber,
      required this.name,
      required this.email,
      required this.token,
      required this.firebaseToken,
      required this.bornPlace,
      required this.bornDate,
      required this.balance});

  @override
  final String phoneNumber;
  @override
  final String pinNumber;
  @override
  final String name;
  @override
  final String email;
  @override
  final String token;
  @override
  final String firebaseToken;
  @override
  final String bornPlace;
  @override
  final DateTime bornDate;
  @override
  final double balance;

  @override
  String toString() {
    return 'UserState(phoneNumber: $phoneNumber, pinNumber: $pinNumber, name: $name, email: $email, token: $token, firebaseToken: $firebaseToken, bornPlace: $bornPlace, bornDate: $bornDate, balance: $balance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserState &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.pinNumber, pinNumber) ||
                const DeepCollectionEquality()
                    .equals(other.pinNumber, pinNumber)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)) &&
            (identical(other.firebaseToken, firebaseToken) ||
                const DeepCollectionEquality()
                    .equals(other.firebaseToken, firebaseToken)) &&
            (identical(other.bornPlace, bornPlace) ||
                const DeepCollectionEquality()
                    .equals(other.bornPlace, bornPlace)) &&
            (identical(other.bornDate, bornDate) ||
                const DeepCollectionEquality()
                    .equals(other.bornDate, bornDate)) &&
            (identical(other.balance, balance) ||
                const DeepCollectionEquality().equals(other.balance, balance)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(pinNumber) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(token) ^
      const DeepCollectionEquality().hash(firebaseToken) ^
      const DeepCollectionEquality().hash(bornPlace) ^
      const DeepCollectionEquality().hash(bornDate) ^
      const DeepCollectionEquality().hash(balance);

  @JsonKey(ignore: true)
  @override
  _$UserStateCopyWith<_UserState> get copyWith =>
      __$UserStateCopyWithImpl<_UserState>(this, _$identity);
}

abstract class _UserState implements UserState {
  const factory _UserState(
      {required String phoneNumber,
      required String pinNumber,
      required String name,
      required String email,
      required String token,
      required String firebaseToken,
      required String bornPlace,
      required DateTime bornDate,
      required double balance}) = _$_UserState;

  @override
  String get phoneNumber => throw _privateConstructorUsedError;
  @override
  String get pinNumber => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get email => throw _privateConstructorUsedError;
  @override
  String get token => throw _privateConstructorUsedError;
  @override
  String get firebaseToken => throw _privateConstructorUsedError;
  @override
  String get bornPlace => throw _privateConstructorUsedError;
  @override
  DateTime get bornDate => throw _privateConstructorUsedError;
  @override
  double get balance => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserStateCopyWith<_UserState> get copyWith =>
      throw _privateConstructorUsedError;
}
