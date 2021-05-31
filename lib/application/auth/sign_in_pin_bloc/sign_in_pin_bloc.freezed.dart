// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'sign_in_pin_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SignInPinEventTearOff {
  const _$SignInPinEventTearOff();

  PinFormChanged pinFormChanged(String pinNumber) {
    return PinFormChanged(
      pinNumber,
    );
  }

  PinFormSubmitted pinFormSubmitted(
      {required String phoneNumber, required String pinNumber}) {
    return PinFormSubmitted(
      phoneNumber: phoneNumber,
      pinNumber: pinNumber,
    );
  }

  SuspendedPinTimerClicker suspendedPinTimerClicker(int suspendedTimer) {
    return SuspendedPinTimerClicker(
      suspendedTimer,
    );
  }
}

/// @nodoc
const $SignInPinEvent = _$SignInPinEventTearOff();

/// @nodoc
mixin _$SignInPinEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String pinNumber) pinFormChanged,
    required TResult Function(String phoneNumber, String pinNumber)
        pinFormSubmitted,
    required TResult Function(int suspendedTimer) suspendedPinTimerClicker,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String pinNumber)? pinFormChanged,
    TResult Function(String phoneNumber, String pinNumber)? pinFormSubmitted,
    TResult Function(int suspendedTimer)? suspendedPinTimerClicker,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PinFormChanged value) pinFormChanged,
    required TResult Function(PinFormSubmitted value) pinFormSubmitted,
    required TResult Function(SuspendedPinTimerClicker value)
        suspendedPinTimerClicker,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PinFormChanged value)? pinFormChanged,
    TResult Function(PinFormSubmitted value)? pinFormSubmitted,
    TResult Function(SuspendedPinTimerClicker value)? suspendedPinTimerClicker,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInPinEventCopyWith<$Res> {
  factory $SignInPinEventCopyWith(
          SignInPinEvent value, $Res Function(SignInPinEvent) then) =
      _$SignInPinEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInPinEventCopyWithImpl<$Res>
    implements $SignInPinEventCopyWith<$Res> {
  _$SignInPinEventCopyWithImpl(this._value, this._then);

  final SignInPinEvent _value;
  // ignore: unused_field
  final $Res Function(SignInPinEvent) _then;
}

/// @nodoc
abstract class $PinFormChangedCopyWith<$Res> {
  factory $PinFormChangedCopyWith(
          PinFormChanged value, $Res Function(PinFormChanged) then) =
      _$PinFormChangedCopyWithImpl<$Res>;
  $Res call({String pinNumber});
}

/// @nodoc
class _$PinFormChangedCopyWithImpl<$Res>
    extends _$SignInPinEventCopyWithImpl<$Res>
    implements $PinFormChangedCopyWith<$Res> {
  _$PinFormChangedCopyWithImpl(
      PinFormChanged _value, $Res Function(PinFormChanged) _then)
      : super(_value, (v) => _then(v as PinFormChanged));

  @override
  PinFormChanged get _value => super._value as PinFormChanged;

  @override
  $Res call({
    Object? pinNumber = freezed,
  }) {
    return _then(PinFormChanged(
      pinNumber == freezed
          ? _value.pinNumber
          : pinNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PinFormChanged implements PinFormChanged {
  const _$PinFormChanged(this.pinNumber);

  @override
  final String pinNumber;

  @override
  String toString() {
    return 'SignInPinEvent.pinFormChanged(pinNumber: $pinNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PinFormChanged &&
            (identical(other.pinNumber, pinNumber) ||
                const DeepCollectionEquality()
                    .equals(other.pinNumber, pinNumber)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(pinNumber);

  @JsonKey(ignore: true)
  @override
  $PinFormChangedCopyWith<PinFormChanged> get copyWith =>
      _$PinFormChangedCopyWithImpl<PinFormChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String pinNumber) pinFormChanged,
    required TResult Function(String phoneNumber, String pinNumber)
        pinFormSubmitted,
    required TResult Function(int suspendedTimer) suspendedPinTimerClicker,
  }) {
    return pinFormChanged(pinNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String pinNumber)? pinFormChanged,
    TResult Function(String phoneNumber, String pinNumber)? pinFormSubmitted,
    TResult Function(int suspendedTimer)? suspendedPinTimerClicker,
    required TResult orElse(),
  }) {
    if (pinFormChanged != null) {
      return pinFormChanged(pinNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PinFormChanged value) pinFormChanged,
    required TResult Function(PinFormSubmitted value) pinFormSubmitted,
    required TResult Function(SuspendedPinTimerClicker value)
        suspendedPinTimerClicker,
  }) {
    return pinFormChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PinFormChanged value)? pinFormChanged,
    TResult Function(PinFormSubmitted value)? pinFormSubmitted,
    TResult Function(SuspendedPinTimerClicker value)? suspendedPinTimerClicker,
    required TResult orElse(),
  }) {
    if (pinFormChanged != null) {
      return pinFormChanged(this);
    }
    return orElse();
  }
}

abstract class PinFormChanged implements SignInPinEvent {
  const factory PinFormChanged(String pinNumber) = _$PinFormChanged;

  String get pinNumber => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PinFormChangedCopyWith<PinFormChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PinFormSubmittedCopyWith<$Res> {
  factory $PinFormSubmittedCopyWith(
          PinFormSubmitted value, $Res Function(PinFormSubmitted) then) =
      _$PinFormSubmittedCopyWithImpl<$Res>;
  $Res call({String phoneNumber, String pinNumber});
}

/// @nodoc
class _$PinFormSubmittedCopyWithImpl<$Res>
    extends _$SignInPinEventCopyWithImpl<$Res>
    implements $PinFormSubmittedCopyWith<$Res> {
  _$PinFormSubmittedCopyWithImpl(
      PinFormSubmitted _value, $Res Function(PinFormSubmitted) _then)
      : super(_value, (v) => _then(v as PinFormSubmitted));

  @override
  PinFormSubmitted get _value => super._value as PinFormSubmitted;

  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? pinNumber = freezed,
  }) {
    return _then(PinFormSubmitted(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      pinNumber: pinNumber == freezed
          ? _value.pinNumber
          : pinNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PinFormSubmitted implements PinFormSubmitted {
  const _$PinFormSubmitted(
      {required this.phoneNumber, required this.pinNumber});

  @override
  final String phoneNumber;
  @override
  final String pinNumber;

  @override
  String toString() {
    return 'SignInPinEvent.pinFormSubmitted(phoneNumber: $phoneNumber, pinNumber: $pinNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PinFormSubmitted &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.pinNumber, pinNumber) ||
                const DeepCollectionEquality()
                    .equals(other.pinNumber, pinNumber)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(pinNumber);

  @JsonKey(ignore: true)
  @override
  $PinFormSubmittedCopyWith<PinFormSubmitted> get copyWith =>
      _$PinFormSubmittedCopyWithImpl<PinFormSubmitted>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String pinNumber) pinFormChanged,
    required TResult Function(String phoneNumber, String pinNumber)
        pinFormSubmitted,
    required TResult Function(int suspendedTimer) suspendedPinTimerClicker,
  }) {
    return pinFormSubmitted(phoneNumber, pinNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String pinNumber)? pinFormChanged,
    TResult Function(String phoneNumber, String pinNumber)? pinFormSubmitted,
    TResult Function(int suspendedTimer)? suspendedPinTimerClicker,
    required TResult orElse(),
  }) {
    if (pinFormSubmitted != null) {
      return pinFormSubmitted(phoneNumber, pinNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PinFormChanged value) pinFormChanged,
    required TResult Function(PinFormSubmitted value) pinFormSubmitted,
    required TResult Function(SuspendedPinTimerClicker value)
        suspendedPinTimerClicker,
  }) {
    return pinFormSubmitted(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PinFormChanged value)? pinFormChanged,
    TResult Function(PinFormSubmitted value)? pinFormSubmitted,
    TResult Function(SuspendedPinTimerClicker value)? suspendedPinTimerClicker,
    required TResult orElse(),
  }) {
    if (pinFormSubmitted != null) {
      return pinFormSubmitted(this);
    }
    return orElse();
  }
}

abstract class PinFormSubmitted implements SignInPinEvent {
  const factory PinFormSubmitted(
      {required String phoneNumber,
      required String pinNumber}) = _$PinFormSubmitted;

  String get phoneNumber => throw _privateConstructorUsedError;
  String get pinNumber => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PinFormSubmittedCopyWith<PinFormSubmitted> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuspendedPinTimerClickerCopyWith<$Res> {
  factory $SuspendedPinTimerClickerCopyWith(SuspendedPinTimerClicker value,
          $Res Function(SuspendedPinTimerClicker) then) =
      _$SuspendedPinTimerClickerCopyWithImpl<$Res>;
  $Res call({int suspendedTimer});
}

/// @nodoc
class _$SuspendedPinTimerClickerCopyWithImpl<$Res>
    extends _$SignInPinEventCopyWithImpl<$Res>
    implements $SuspendedPinTimerClickerCopyWith<$Res> {
  _$SuspendedPinTimerClickerCopyWithImpl(SuspendedPinTimerClicker _value,
      $Res Function(SuspendedPinTimerClicker) _then)
      : super(_value, (v) => _then(v as SuspendedPinTimerClicker));

  @override
  SuspendedPinTimerClicker get _value =>
      super._value as SuspendedPinTimerClicker;

  @override
  $Res call({
    Object? suspendedTimer = freezed,
  }) {
    return _then(SuspendedPinTimerClicker(
      suspendedTimer == freezed
          ? _value.suspendedTimer
          : suspendedTimer // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SuspendedPinTimerClicker implements SuspendedPinTimerClicker {
  const _$SuspendedPinTimerClicker(this.suspendedTimer);

  @override
  final int suspendedTimer;

  @override
  String toString() {
    return 'SignInPinEvent.suspendedPinTimerClicker(suspendedTimer: $suspendedTimer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SuspendedPinTimerClicker &&
            (identical(other.suspendedTimer, suspendedTimer) ||
                const DeepCollectionEquality()
                    .equals(other.suspendedTimer, suspendedTimer)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(suspendedTimer);

  @JsonKey(ignore: true)
  @override
  $SuspendedPinTimerClickerCopyWith<SuspendedPinTimerClicker> get copyWith =>
      _$SuspendedPinTimerClickerCopyWithImpl<SuspendedPinTimerClicker>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String pinNumber) pinFormChanged,
    required TResult Function(String phoneNumber, String pinNumber)
        pinFormSubmitted,
    required TResult Function(int suspendedTimer) suspendedPinTimerClicker,
  }) {
    return suspendedPinTimerClicker(suspendedTimer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String pinNumber)? pinFormChanged,
    TResult Function(String phoneNumber, String pinNumber)? pinFormSubmitted,
    TResult Function(int suspendedTimer)? suspendedPinTimerClicker,
    required TResult orElse(),
  }) {
    if (suspendedPinTimerClicker != null) {
      return suspendedPinTimerClicker(suspendedTimer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PinFormChanged value) pinFormChanged,
    required TResult Function(PinFormSubmitted value) pinFormSubmitted,
    required TResult Function(SuspendedPinTimerClicker value)
        suspendedPinTimerClicker,
  }) {
    return suspendedPinTimerClicker(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PinFormChanged value)? pinFormChanged,
    TResult Function(PinFormSubmitted value)? pinFormSubmitted,
    TResult Function(SuspendedPinTimerClicker value)? suspendedPinTimerClicker,
    required TResult orElse(),
  }) {
    if (suspendedPinTimerClicker != null) {
      return suspendedPinTimerClicker(this);
    }
    return orElse();
  }
}

abstract class SuspendedPinTimerClicker implements SignInPinEvent {
  const factory SuspendedPinTimerClicker(int suspendedTimer) =
      _$SuspendedPinTimerClicker;

  int get suspendedTimer => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SuspendedPinTimerClickerCopyWith<SuspendedPinTimerClicker> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$SignInPinStateTearOff {
  const _$SignInPinStateTearOff();

  _SignInPinState call(
      {required String pinNumber,
      required FormSubmissionStatus formStatus,
      required int suspendedTimer,
      required int failedSubmittingPin,
      required String errorMessages,
      required bool showErrorMessages,
      required bool isFormValid}) {
    return _SignInPinState(
      pinNumber: pinNumber,
      formStatus: formStatus,
      suspendedTimer: suspendedTimer,
      failedSubmittingPin: failedSubmittingPin,
      errorMessages: errorMessages,
      showErrorMessages: showErrorMessages,
      isFormValid: isFormValid,
    );
  }
}

/// @nodoc
const $SignInPinState = _$SignInPinStateTearOff();

/// @nodoc
mixin _$SignInPinState {
  String get pinNumber => throw _privateConstructorUsedError;
  FormSubmissionStatus get formStatus => throw _privateConstructorUsedError;
  int get suspendedTimer => throw _privateConstructorUsedError;
  int get failedSubmittingPin => throw _privateConstructorUsedError;
  String get errorMessages => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isFormValid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInPinStateCopyWith<SignInPinState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInPinStateCopyWith<$Res> {
  factory $SignInPinStateCopyWith(
          SignInPinState value, $Res Function(SignInPinState) then) =
      _$SignInPinStateCopyWithImpl<$Res>;
  $Res call(
      {String pinNumber,
      FormSubmissionStatus formStatus,
      int suspendedTimer,
      int failedSubmittingPin,
      String errorMessages,
      bool showErrorMessages,
      bool isFormValid});
}

/// @nodoc
class _$SignInPinStateCopyWithImpl<$Res>
    implements $SignInPinStateCopyWith<$Res> {
  _$SignInPinStateCopyWithImpl(this._value, this._then);

  final SignInPinState _value;
  // ignore: unused_field
  final $Res Function(SignInPinState) _then;

  @override
  $Res call({
    Object? pinNumber = freezed,
    Object? formStatus = freezed,
    Object? suspendedTimer = freezed,
    Object? failedSubmittingPin = freezed,
    Object? errorMessages = freezed,
    Object? showErrorMessages = freezed,
    Object? isFormValid = freezed,
  }) {
    return _then(_value.copyWith(
      pinNumber: pinNumber == freezed
          ? _value.pinNumber
          : pinNumber // ignore: cast_nullable_to_non_nullable
              as String,
      formStatus: formStatus == freezed
          ? _value.formStatus
          : formStatus // ignore: cast_nullable_to_non_nullable
              as FormSubmissionStatus,
      suspendedTimer: suspendedTimer == freezed
          ? _value.suspendedTimer
          : suspendedTimer // ignore: cast_nullable_to_non_nullable
              as int,
      failedSubmittingPin: failedSubmittingPin == freezed
          ? _value.failedSubmittingPin
          : failedSubmittingPin // ignore: cast_nullable_to_non_nullable
              as int,
      errorMessages: errorMessages == freezed
          ? _value.errorMessages
          : errorMessages // ignore: cast_nullable_to_non_nullable
              as String,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isFormValid: isFormValid == freezed
          ? _value.isFormValid
          : isFormValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$SignInPinStateCopyWith<$Res>
    implements $SignInPinStateCopyWith<$Res> {
  factory _$SignInPinStateCopyWith(
          _SignInPinState value, $Res Function(_SignInPinState) then) =
      __$SignInPinStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String pinNumber,
      FormSubmissionStatus formStatus,
      int suspendedTimer,
      int failedSubmittingPin,
      String errorMessages,
      bool showErrorMessages,
      bool isFormValid});
}

/// @nodoc
class __$SignInPinStateCopyWithImpl<$Res>
    extends _$SignInPinStateCopyWithImpl<$Res>
    implements _$SignInPinStateCopyWith<$Res> {
  __$SignInPinStateCopyWithImpl(
      _SignInPinState _value, $Res Function(_SignInPinState) _then)
      : super(_value, (v) => _then(v as _SignInPinState));

  @override
  _SignInPinState get _value => super._value as _SignInPinState;

  @override
  $Res call({
    Object? pinNumber = freezed,
    Object? formStatus = freezed,
    Object? suspendedTimer = freezed,
    Object? failedSubmittingPin = freezed,
    Object? errorMessages = freezed,
    Object? showErrorMessages = freezed,
    Object? isFormValid = freezed,
  }) {
    return _then(_SignInPinState(
      pinNumber: pinNumber == freezed
          ? _value.pinNumber
          : pinNumber // ignore: cast_nullable_to_non_nullable
              as String,
      formStatus: formStatus == freezed
          ? _value.formStatus
          : formStatus // ignore: cast_nullable_to_non_nullable
              as FormSubmissionStatus,
      suspendedTimer: suspendedTimer == freezed
          ? _value.suspendedTimer
          : suspendedTimer // ignore: cast_nullable_to_non_nullable
              as int,
      failedSubmittingPin: failedSubmittingPin == freezed
          ? _value.failedSubmittingPin
          : failedSubmittingPin // ignore: cast_nullable_to_non_nullable
              as int,
      errorMessages: errorMessages == freezed
          ? _value.errorMessages
          : errorMessages // ignore: cast_nullable_to_non_nullable
              as String,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isFormValid: isFormValid == freezed
          ? _value.isFormValid
          : isFormValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SignInPinState extends _SignInPinState {
  const _$_SignInPinState(
      {required this.pinNumber,
      required this.formStatus,
      required this.suspendedTimer,
      required this.failedSubmittingPin,
      required this.errorMessages,
      required this.showErrorMessages,
      required this.isFormValid})
      : super._();

  @override
  final String pinNumber;
  @override
  final FormSubmissionStatus formStatus;
  @override
  final int suspendedTimer;
  @override
  final int failedSubmittingPin;
  @override
  final String errorMessages;
  @override
  final bool showErrorMessages;
  @override
  final bool isFormValid;

  @override
  String toString() {
    return 'SignInPinState(pinNumber: $pinNumber, formStatus: $formStatus, suspendedTimer: $suspendedTimer, failedSubmittingPin: $failedSubmittingPin, errorMessages: $errorMessages, showErrorMessages: $showErrorMessages, isFormValid: $isFormValid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SignInPinState &&
            (identical(other.pinNumber, pinNumber) ||
                const DeepCollectionEquality()
                    .equals(other.pinNumber, pinNumber)) &&
            (identical(other.formStatus, formStatus) ||
                const DeepCollectionEquality()
                    .equals(other.formStatus, formStatus)) &&
            (identical(other.suspendedTimer, suspendedTimer) ||
                const DeepCollectionEquality()
                    .equals(other.suspendedTimer, suspendedTimer)) &&
            (identical(other.failedSubmittingPin, failedSubmittingPin) ||
                const DeepCollectionEquality()
                    .equals(other.failedSubmittingPin, failedSubmittingPin)) &&
            (identical(other.errorMessages, errorMessages) ||
                const DeepCollectionEquality()
                    .equals(other.errorMessages, errorMessages)) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                const DeepCollectionEquality()
                    .equals(other.showErrorMessages, showErrorMessages)) &&
            (identical(other.isFormValid, isFormValid) ||
                const DeepCollectionEquality()
                    .equals(other.isFormValid, isFormValid)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(pinNumber) ^
      const DeepCollectionEquality().hash(formStatus) ^
      const DeepCollectionEquality().hash(suspendedTimer) ^
      const DeepCollectionEquality().hash(failedSubmittingPin) ^
      const DeepCollectionEquality().hash(errorMessages) ^
      const DeepCollectionEquality().hash(showErrorMessages) ^
      const DeepCollectionEquality().hash(isFormValid);

  @JsonKey(ignore: true)
  @override
  _$SignInPinStateCopyWith<_SignInPinState> get copyWith =>
      __$SignInPinStateCopyWithImpl<_SignInPinState>(this, _$identity);
}

abstract class _SignInPinState extends SignInPinState {
  const factory _SignInPinState(
      {required String pinNumber,
      required FormSubmissionStatus formStatus,
      required int suspendedTimer,
      required int failedSubmittingPin,
      required String errorMessages,
      required bool showErrorMessages,
      required bool isFormValid}) = _$_SignInPinState;
  const _SignInPinState._() : super._();

  @override
  String get pinNumber => throw _privateConstructorUsedError;
  @override
  FormSubmissionStatus get formStatus => throw _privateConstructorUsedError;
  @override
  int get suspendedTimer => throw _privateConstructorUsedError;
  @override
  int get failedSubmittingPin => throw _privateConstructorUsedError;
  @override
  String get errorMessages => throw _privateConstructorUsedError;
  @override
  bool get showErrorMessages => throw _privateConstructorUsedError;
  @override
  bool get isFormValid => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SignInPinStateCopyWith<_SignInPinState> get copyWith =>
      throw _privateConstructorUsedError;
}
