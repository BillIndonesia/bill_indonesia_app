// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'sign_up_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SignUpEventTearOff {
  const _$SignUpEventTearOff();

  GetOtpScreenInit getOtpScreenInit(String phoneNumber) {
    return GetOtpScreenInit(
      phoneNumber,
    );
  }

  OTPFormChanged otpFormChanged(String otpCode) {
    return OTPFormChanged(
      otpCode,
    );
  }

  OTPTimer otpTimer(int otpClock) {
    return OTPTimer(
      otpClock,
    );
  }

  ResendOtp resendOtp(String phoneNumber) {
    return ResendOtp(
      phoneNumber,
    );
  }

  CleanChace cleanCache() {
    return const CleanChace();
  }
}

/// @nodoc
const $SignUpEvent = _$SignUpEventTearOff();

/// @nodoc
mixin _$SignUpEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) getOtpScreenInit,
    required TResult Function(String otpCode) otpFormChanged,
    required TResult Function(int otpClock) otpTimer,
    required TResult Function(String phoneNumber) resendOtp,
    required TResult Function() cleanCache,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? getOtpScreenInit,
    TResult Function(String otpCode)? otpFormChanged,
    TResult Function(int otpClock)? otpTimer,
    TResult Function(String phoneNumber)? resendOtp,
    TResult Function()? cleanCache,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetOtpScreenInit value) getOtpScreenInit,
    required TResult Function(OTPFormChanged value) otpFormChanged,
    required TResult Function(OTPTimer value) otpTimer,
    required TResult Function(ResendOtp value) resendOtp,
    required TResult Function(CleanChace value) cleanCache,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetOtpScreenInit value)? getOtpScreenInit,
    TResult Function(OTPFormChanged value)? otpFormChanged,
    TResult Function(OTPTimer value)? otpTimer,
    TResult Function(ResendOtp value)? resendOtp,
    TResult Function(CleanChace value)? cleanCache,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpEventCopyWith<$Res> {
  factory $SignUpEventCopyWith(
          SignUpEvent value, $Res Function(SignUpEvent) then) =
      _$SignUpEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignUpEventCopyWithImpl<$Res> implements $SignUpEventCopyWith<$Res> {
  _$SignUpEventCopyWithImpl(this._value, this._then);

  final SignUpEvent _value;
  // ignore: unused_field
  final $Res Function(SignUpEvent) _then;
}

/// @nodoc
abstract class $GetOtpScreenInitCopyWith<$Res> {
  factory $GetOtpScreenInitCopyWith(
          GetOtpScreenInit value, $Res Function(GetOtpScreenInit) then) =
      _$GetOtpScreenInitCopyWithImpl<$Res>;
  $Res call({String phoneNumber});
}

/// @nodoc
class _$GetOtpScreenInitCopyWithImpl<$Res>
    extends _$SignUpEventCopyWithImpl<$Res>
    implements $GetOtpScreenInitCopyWith<$Res> {
  _$GetOtpScreenInitCopyWithImpl(
      GetOtpScreenInit _value, $Res Function(GetOtpScreenInit) _then)
      : super(_value, (v) => _then(v as GetOtpScreenInit));

  @override
  GetOtpScreenInit get _value => super._value as GetOtpScreenInit;

  @override
  $Res call({
    Object? phoneNumber = freezed,
  }) {
    return _then(GetOtpScreenInit(
      phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetOtpScreenInit implements GetOtpScreenInit {
  const _$GetOtpScreenInit(this.phoneNumber);

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'SignUpEvent.getOtpScreenInit(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GetOtpScreenInit &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(phoneNumber);

  @JsonKey(ignore: true)
  @override
  $GetOtpScreenInitCopyWith<GetOtpScreenInit> get copyWith =>
      _$GetOtpScreenInitCopyWithImpl<GetOtpScreenInit>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) getOtpScreenInit,
    required TResult Function(String otpCode) otpFormChanged,
    required TResult Function(int otpClock) otpTimer,
    required TResult Function(String phoneNumber) resendOtp,
    required TResult Function() cleanCache,
  }) {
    return getOtpScreenInit(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? getOtpScreenInit,
    TResult Function(String otpCode)? otpFormChanged,
    TResult Function(int otpClock)? otpTimer,
    TResult Function(String phoneNumber)? resendOtp,
    TResult Function()? cleanCache,
    required TResult orElse(),
  }) {
    if (getOtpScreenInit != null) {
      return getOtpScreenInit(phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetOtpScreenInit value) getOtpScreenInit,
    required TResult Function(OTPFormChanged value) otpFormChanged,
    required TResult Function(OTPTimer value) otpTimer,
    required TResult Function(ResendOtp value) resendOtp,
    required TResult Function(CleanChace value) cleanCache,
  }) {
    return getOtpScreenInit(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetOtpScreenInit value)? getOtpScreenInit,
    TResult Function(OTPFormChanged value)? otpFormChanged,
    TResult Function(OTPTimer value)? otpTimer,
    TResult Function(ResendOtp value)? resendOtp,
    TResult Function(CleanChace value)? cleanCache,
    required TResult orElse(),
  }) {
    if (getOtpScreenInit != null) {
      return getOtpScreenInit(this);
    }
    return orElse();
  }
}

abstract class GetOtpScreenInit implements SignUpEvent {
  const factory GetOtpScreenInit(String phoneNumber) = _$GetOtpScreenInit;

  String get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetOtpScreenInitCopyWith<GetOtpScreenInit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OTPFormChangedCopyWith<$Res> {
  factory $OTPFormChangedCopyWith(
          OTPFormChanged value, $Res Function(OTPFormChanged) then) =
      _$OTPFormChangedCopyWithImpl<$Res>;
  $Res call({String otpCode});
}

/// @nodoc
class _$OTPFormChangedCopyWithImpl<$Res> extends _$SignUpEventCopyWithImpl<$Res>
    implements $OTPFormChangedCopyWith<$Res> {
  _$OTPFormChangedCopyWithImpl(
      OTPFormChanged _value, $Res Function(OTPFormChanged) _then)
      : super(_value, (v) => _then(v as OTPFormChanged));

  @override
  OTPFormChanged get _value => super._value as OTPFormChanged;

  @override
  $Res call({
    Object? otpCode = freezed,
  }) {
    return _then(OTPFormChanged(
      otpCode == freezed
          ? _value.otpCode
          : otpCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OTPFormChanged implements OTPFormChanged {
  const _$OTPFormChanged(this.otpCode);

  @override
  final String otpCode;

  @override
  String toString() {
    return 'SignUpEvent.otpFormChanged(otpCode: $otpCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is OTPFormChanged &&
            (identical(other.otpCode, otpCode) ||
                const DeepCollectionEquality().equals(other.otpCode, otpCode)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(otpCode);

  @JsonKey(ignore: true)
  @override
  $OTPFormChangedCopyWith<OTPFormChanged> get copyWith =>
      _$OTPFormChangedCopyWithImpl<OTPFormChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) getOtpScreenInit,
    required TResult Function(String otpCode) otpFormChanged,
    required TResult Function(int otpClock) otpTimer,
    required TResult Function(String phoneNumber) resendOtp,
    required TResult Function() cleanCache,
  }) {
    return otpFormChanged(otpCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? getOtpScreenInit,
    TResult Function(String otpCode)? otpFormChanged,
    TResult Function(int otpClock)? otpTimer,
    TResult Function(String phoneNumber)? resendOtp,
    TResult Function()? cleanCache,
    required TResult orElse(),
  }) {
    if (otpFormChanged != null) {
      return otpFormChanged(otpCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetOtpScreenInit value) getOtpScreenInit,
    required TResult Function(OTPFormChanged value) otpFormChanged,
    required TResult Function(OTPTimer value) otpTimer,
    required TResult Function(ResendOtp value) resendOtp,
    required TResult Function(CleanChace value) cleanCache,
  }) {
    return otpFormChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetOtpScreenInit value)? getOtpScreenInit,
    TResult Function(OTPFormChanged value)? otpFormChanged,
    TResult Function(OTPTimer value)? otpTimer,
    TResult Function(ResendOtp value)? resendOtp,
    TResult Function(CleanChace value)? cleanCache,
    required TResult orElse(),
  }) {
    if (otpFormChanged != null) {
      return otpFormChanged(this);
    }
    return orElse();
  }
}

abstract class OTPFormChanged implements SignUpEvent {
  const factory OTPFormChanged(String otpCode) = _$OTPFormChanged;

  String get otpCode => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OTPFormChangedCopyWith<OTPFormChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OTPTimerCopyWith<$Res> {
  factory $OTPTimerCopyWith(OTPTimer value, $Res Function(OTPTimer) then) =
      _$OTPTimerCopyWithImpl<$Res>;
  $Res call({int otpClock});
}

/// @nodoc
class _$OTPTimerCopyWithImpl<$Res> extends _$SignUpEventCopyWithImpl<$Res>
    implements $OTPTimerCopyWith<$Res> {
  _$OTPTimerCopyWithImpl(OTPTimer _value, $Res Function(OTPTimer) _then)
      : super(_value, (v) => _then(v as OTPTimer));

  @override
  OTPTimer get _value => super._value as OTPTimer;

  @override
  $Res call({
    Object? otpClock = freezed,
  }) {
    return _then(OTPTimer(
      otpClock == freezed
          ? _value.otpClock
          : otpClock // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$OTPTimer implements OTPTimer {
  const _$OTPTimer(this.otpClock);

  @override
  final int otpClock;

  @override
  String toString() {
    return 'SignUpEvent.otpTimer(otpClock: $otpClock)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is OTPTimer &&
            (identical(other.otpClock, otpClock) ||
                const DeepCollectionEquality()
                    .equals(other.otpClock, otpClock)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(otpClock);

  @JsonKey(ignore: true)
  @override
  $OTPTimerCopyWith<OTPTimer> get copyWith =>
      _$OTPTimerCopyWithImpl<OTPTimer>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) getOtpScreenInit,
    required TResult Function(String otpCode) otpFormChanged,
    required TResult Function(int otpClock) otpTimer,
    required TResult Function(String phoneNumber) resendOtp,
    required TResult Function() cleanCache,
  }) {
    return otpTimer(otpClock);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? getOtpScreenInit,
    TResult Function(String otpCode)? otpFormChanged,
    TResult Function(int otpClock)? otpTimer,
    TResult Function(String phoneNumber)? resendOtp,
    TResult Function()? cleanCache,
    required TResult orElse(),
  }) {
    if (otpTimer != null) {
      return otpTimer(otpClock);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetOtpScreenInit value) getOtpScreenInit,
    required TResult Function(OTPFormChanged value) otpFormChanged,
    required TResult Function(OTPTimer value) otpTimer,
    required TResult Function(ResendOtp value) resendOtp,
    required TResult Function(CleanChace value) cleanCache,
  }) {
    return otpTimer(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetOtpScreenInit value)? getOtpScreenInit,
    TResult Function(OTPFormChanged value)? otpFormChanged,
    TResult Function(OTPTimer value)? otpTimer,
    TResult Function(ResendOtp value)? resendOtp,
    TResult Function(CleanChace value)? cleanCache,
    required TResult orElse(),
  }) {
    if (otpTimer != null) {
      return otpTimer(this);
    }
    return orElse();
  }
}

abstract class OTPTimer implements SignUpEvent {
  const factory OTPTimer(int otpClock) = _$OTPTimer;

  int get otpClock => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OTPTimerCopyWith<OTPTimer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResendOtpCopyWith<$Res> {
  factory $ResendOtpCopyWith(ResendOtp value, $Res Function(ResendOtp) then) =
      _$ResendOtpCopyWithImpl<$Res>;
  $Res call({String phoneNumber});
}

/// @nodoc
class _$ResendOtpCopyWithImpl<$Res> extends _$SignUpEventCopyWithImpl<$Res>
    implements $ResendOtpCopyWith<$Res> {
  _$ResendOtpCopyWithImpl(ResendOtp _value, $Res Function(ResendOtp) _then)
      : super(_value, (v) => _then(v as ResendOtp));

  @override
  ResendOtp get _value => super._value as ResendOtp;

  @override
  $Res call({
    Object? phoneNumber = freezed,
  }) {
    return _then(ResendOtp(
      phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ResendOtp implements ResendOtp {
  const _$ResendOtp(this.phoneNumber);

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'SignUpEvent.resendOtp(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ResendOtp &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(phoneNumber);

  @JsonKey(ignore: true)
  @override
  $ResendOtpCopyWith<ResendOtp> get copyWith =>
      _$ResendOtpCopyWithImpl<ResendOtp>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) getOtpScreenInit,
    required TResult Function(String otpCode) otpFormChanged,
    required TResult Function(int otpClock) otpTimer,
    required TResult Function(String phoneNumber) resendOtp,
    required TResult Function() cleanCache,
  }) {
    return resendOtp(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? getOtpScreenInit,
    TResult Function(String otpCode)? otpFormChanged,
    TResult Function(int otpClock)? otpTimer,
    TResult Function(String phoneNumber)? resendOtp,
    TResult Function()? cleanCache,
    required TResult orElse(),
  }) {
    if (resendOtp != null) {
      return resendOtp(phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetOtpScreenInit value) getOtpScreenInit,
    required TResult Function(OTPFormChanged value) otpFormChanged,
    required TResult Function(OTPTimer value) otpTimer,
    required TResult Function(ResendOtp value) resendOtp,
    required TResult Function(CleanChace value) cleanCache,
  }) {
    return resendOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetOtpScreenInit value)? getOtpScreenInit,
    TResult Function(OTPFormChanged value)? otpFormChanged,
    TResult Function(OTPTimer value)? otpTimer,
    TResult Function(ResendOtp value)? resendOtp,
    TResult Function(CleanChace value)? cleanCache,
    required TResult orElse(),
  }) {
    if (resendOtp != null) {
      return resendOtp(this);
    }
    return orElse();
  }
}

abstract class ResendOtp implements SignUpEvent {
  const factory ResendOtp(String phoneNumber) = _$ResendOtp;

  String get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResendOtpCopyWith<ResendOtp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CleanChaceCopyWith<$Res> {
  factory $CleanChaceCopyWith(
          CleanChace value, $Res Function(CleanChace) then) =
      _$CleanChaceCopyWithImpl<$Res>;
}

/// @nodoc
class _$CleanChaceCopyWithImpl<$Res> extends _$SignUpEventCopyWithImpl<$Res>
    implements $CleanChaceCopyWith<$Res> {
  _$CleanChaceCopyWithImpl(CleanChace _value, $Res Function(CleanChace) _then)
      : super(_value, (v) => _then(v as CleanChace));

  @override
  CleanChace get _value => super._value as CleanChace;
}

/// @nodoc

class _$CleanChace implements CleanChace {
  const _$CleanChace();

  @override
  String toString() {
    return 'SignUpEvent.cleanCache()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is CleanChace);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) getOtpScreenInit,
    required TResult Function(String otpCode) otpFormChanged,
    required TResult Function(int otpClock) otpTimer,
    required TResult Function(String phoneNumber) resendOtp,
    required TResult Function() cleanCache,
  }) {
    return cleanCache();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? getOtpScreenInit,
    TResult Function(String otpCode)? otpFormChanged,
    TResult Function(int otpClock)? otpTimer,
    TResult Function(String phoneNumber)? resendOtp,
    TResult Function()? cleanCache,
    required TResult orElse(),
  }) {
    if (cleanCache != null) {
      return cleanCache();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetOtpScreenInit value) getOtpScreenInit,
    required TResult Function(OTPFormChanged value) otpFormChanged,
    required TResult Function(OTPTimer value) otpTimer,
    required TResult Function(ResendOtp value) resendOtp,
    required TResult Function(CleanChace value) cleanCache,
  }) {
    return cleanCache(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetOtpScreenInit value)? getOtpScreenInit,
    TResult Function(OTPFormChanged value)? otpFormChanged,
    TResult Function(OTPTimer value)? otpTimer,
    TResult Function(ResendOtp value)? resendOtp,
    TResult Function(CleanChace value)? cleanCache,
    required TResult orElse(),
  }) {
    if (cleanCache != null) {
      return cleanCache(this);
    }
    return orElse();
  }
}

abstract class CleanChace implements SignUpEvent {
  const factory CleanChace() = _$CleanChace;
}

/// @nodoc
class _$SignUpStateTearOff {
  const _$SignUpStateTearOff();

  _SignUpState call(
      {required String phoneNumber,
      required String otpCode,
      required String otpCodeGenerated,
      required String errorMessages,
      required bool showErrorMessages,
      required int waitingTimer,
      required bool isFormValid}) {
    return _SignUpState(
      phoneNumber: phoneNumber,
      otpCode: otpCode,
      otpCodeGenerated: otpCodeGenerated,
      errorMessages: errorMessages,
      showErrorMessages: showErrorMessages,
      waitingTimer: waitingTimer,
      isFormValid: isFormValid,
    );
  }
}

/// @nodoc
const $SignUpState = _$SignUpStateTearOff();

/// @nodoc
mixin _$SignUpState {
  String get phoneNumber => throw _privateConstructorUsedError;
  String get otpCode => throw _privateConstructorUsedError;
  String get otpCodeGenerated => throw _privateConstructorUsedError;
  String get errorMessages => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  int get waitingTimer => throw _privateConstructorUsedError;
  bool get isFormValid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignUpStateCopyWith<SignUpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpStateCopyWith<$Res> {
  factory $SignUpStateCopyWith(
          SignUpState value, $Res Function(SignUpState) then) =
      _$SignUpStateCopyWithImpl<$Res>;
  $Res call(
      {String phoneNumber,
      String otpCode,
      String otpCodeGenerated,
      String errorMessages,
      bool showErrorMessages,
      int waitingTimer,
      bool isFormValid});
}

/// @nodoc
class _$SignUpStateCopyWithImpl<$Res> implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._value, this._then);

  final SignUpState _value;
  // ignore: unused_field
  final $Res Function(SignUpState) _then;

  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? otpCode = freezed,
    Object? otpCodeGenerated = freezed,
    Object? errorMessages = freezed,
    Object? showErrorMessages = freezed,
    Object? waitingTimer = freezed,
    Object? isFormValid = freezed,
  }) {
    return _then(_value.copyWith(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      otpCode: otpCode == freezed
          ? _value.otpCode
          : otpCode // ignore: cast_nullable_to_non_nullable
              as String,
      otpCodeGenerated: otpCodeGenerated == freezed
          ? _value.otpCodeGenerated
          : otpCodeGenerated // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessages: errorMessages == freezed
          ? _value.errorMessages
          : errorMessages // ignore: cast_nullable_to_non_nullable
              as String,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      waitingTimer: waitingTimer == freezed
          ? _value.waitingTimer
          : waitingTimer // ignore: cast_nullable_to_non_nullable
              as int,
      isFormValid: isFormValid == freezed
          ? _value.isFormValid
          : isFormValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$SignUpStateCopyWith<$Res>
    implements $SignUpStateCopyWith<$Res> {
  factory _$SignUpStateCopyWith(
          _SignUpState value, $Res Function(_SignUpState) then) =
      __$SignUpStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String phoneNumber,
      String otpCode,
      String otpCodeGenerated,
      String errorMessages,
      bool showErrorMessages,
      int waitingTimer,
      bool isFormValid});
}

/// @nodoc
class __$SignUpStateCopyWithImpl<$Res> extends _$SignUpStateCopyWithImpl<$Res>
    implements _$SignUpStateCopyWith<$Res> {
  __$SignUpStateCopyWithImpl(
      _SignUpState _value, $Res Function(_SignUpState) _then)
      : super(_value, (v) => _then(v as _SignUpState));

  @override
  _SignUpState get _value => super._value as _SignUpState;

  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? otpCode = freezed,
    Object? otpCodeGenerated = freezed,
    Object? errorMessages = freezed,
    Object? showErrorMessages = freezed,
    Object? waitingTimer = freezed,
    Object? isFormValid = freezed,
  }) {
    return _then(_SignUpState(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      otpCode: otpCode == freezed
          ? _value.otpCode
          : otpCode // ignore: cast_nullable_to_non_nullable
              as String,
      otpCodeGenerated: otpCodeGenerated == freezed
          ? _value.otpCodeGenerated
          : otpCodeGenerated // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessages: errorMessages == freezed
          ? _value.errorMessages
          : errorMessages // ignore: cast_nullable_to_non_nullable
              as String,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      waitingTimer: waitingTimer == freezed
          ? _value.waitingTimer
          : waitingTimer // ignore: cast_nullable_to_non_nullable
              as int,
      isFormValid: isFormValid == freezed
          ? _value.isFormValid
          : isFormValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SignUpState extends _SignUpState {
  const _$_SignUpState(
      {required this.phoneNumber,
      required this.otpCode,
      required this.otpCodeGenerated,
      required this.errorMessages,
      required this.showErrorMessages,
      required this.waitingTimer,
      required this.isFormValid})
      : super._();

  @override
  final String phoneNumber;
  @override
  final String otpCode;
  @override
  final String otpCodeGenerated;
  @override
  final String errorMessages;
  @override
  final bool showErrorMessages;
  @override
  final int waitingTimer;
  @override
  final bool isFormValid;

  @override
  String toString() {
    return 'SignUpState(phoneNumber: $phoneNumber, otpCode: $otpCode, otpCodeGenerated: $otpCodeGenerated, errorMessages: $errorMessages, showErrorMessages: $showErrorMessages, waitingTimer: $waitingTimer, isFormValid: $isFormValid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SignUpState &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.otpCode, otpCode) ||
                const DeepCollectionEquality()
                    .equals(other.otpCode, otpCode)) &&
            (identical(other.otpCodeGenerated, otpCodeGenerated) ||
                const DeepCollectionEquality()
                    .equals(other.otpCodeGenerated, otpCodeGenerated)) &&
            (identical(other.errorMessages, errorMessages) ||
                const DeepCollectionEquality()
                    .equals(other.errorMessages, errorMessages)) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                const DeepCollectionEquality()
                    .equals(other.showErrorMessages, showErrorMessages)) &&
            (identical(other.waitingTimer, waitingTimer) ||
                const DeepCollectionEquality()
                    .equals(other.waitingTimer, waitingTimer)) &&
            (identical(other.isFormValid, isFormValid) ||
                const DeepCollectionEquality()
                    .equals(other.isFormValid, isFormValid)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(otpCode) ^
      const DeepCollectionEquality().hash(otpCodeGenerated) ^
      const DeepCollectionEquality().hash(errorMessages) ^
      const DeepCollectionEquality().hash(showErrorMessages) ^
      const DeepCollectionEquality().hash(waitingTimer) ^
      const DeepCollectionEquality().hash(isFormValid);

  @JsonKey(ignore: true)
  @override
  _$SignUpStateCopyWith<_SignUpState> get copyWith =>
      __$SignUpStateCopyWithImpl<_SignUpState>(this, _$identity);
}

abstract class _SignUpState extends SignUpState {
  const factory _SignUpState(
      {required String phoneNumber,
      required String otpCode,
      required String otpCodeGenerated,
      required String errorMessages,
      required bool showErrorMessages,
      required int waitingTimer,
      required bool isFormValid}) = _$_SignUpState;
  const _SignUpState._() : super._();

  @override
  String get phoneNumber => throw _privateConstructorUsedError;
  @override
  String get otpCode => throw _privateConstructorUsedError;
  @override
  String get otpCodeGenerated => throw _privateConstructorUsedError;
  @override
  String get errorMessages => throw _privateConstructorUsedError;
  @override
  bool get showErrorMessages => throw _privateConstructorUsedError;
  @override
  int get waitingTimer => throw _privateConstructorUsedError;
  @override
  bool get isFormValid => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SignUpStateCopyWith<_SignUpState> get copyWith =>
      throw _privateConstructorUsedError;
}
