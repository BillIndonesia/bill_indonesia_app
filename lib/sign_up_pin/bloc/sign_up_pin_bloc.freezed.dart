// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'sign_up_pin_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SignUpPinEventTearOff {
  const _$SignUpPinEventTearOff();

  PinFormChanged pinFormChanged(String pinNumber) {
    return PinFormChanged(
      pinNumber,
    );
  }

  PinConfirmationFormChanged pinConfirmationFormChanged(String pinNumber) {
    return PinConfirmationFormChanged(
      pinNumber,
    );
  }
}

/// @nodoc
const $SignUpPinEvent = _$SignUpPinEventTearOff();

/// @nodoc
mixin _$SignUpPinEvent {
  String get pinNumber => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String pinNumber) pinFormChanged,
    required TResult Function(String pinNumber) pinConfirmationFormChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String pinNumber)? pinFormChanged,
    TResult Function(String pinNumber)? pinConfirmationFormChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PinFormChanged value) pinFormChanged,
    required TResult Function(PinConfirmationFormChanged value)
        pinConfirmationFormChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PinFormChanged value)? pinFormChanged,
    TResult Function(PinConfirmationFormChanged value)?
        pinConfirmationFormChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignUpPinEventCopyWith<SignUpPinEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpPinEventCopyWith<$Res> {
  factory $SignUpPinEventCopyWith(
          SignUpPinEvent value, $Res Function(SignUpPinEvent) then) =
      _$SignUpPinEventCopyWithImpl<$Res>;
  $Res call({String pinNumber});
}

/// @nodoc
class _$SignUpPinEventCopyWithImpl<$Res>
    implements $SignUpPinEventCopyWith<$Res> {
  _$SignUpPinEventCopyWithImpl(this._value, this._then);

  final SignUpPinEvent _value;
  // ignore: unused_field
  final $Res Function(SignUpPinEvent) _then;

  @override
  $Res call({
    Object? pinNumber = freezed,
  }) {
    return _then(_value.copyWith(
      pinNumber: pinNumber == freezed
          ? _value.pinNumber
          : pinNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class $PinFormChangedCopyWith<$Res>
    implements $SignUpPinEventCopyWith<$Res> {
  factory $PinFormChangedCopyWith(
          PinFormChanged value, $Res Function(PinFormChanged) then) =
      _$PinFormChangedCopyWithImpl<$Res>;
  @override
  $Res call({String pinNumber});
}

/// @nodoc
class _$PinFormChangedCopyWithImpl<$Res>
    extends _$SignUpPinEventCopyWithImpl<$Res>
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
    return 'SignUpPinEvent.pinFormChanged(pinNumber: $pinNumber)';
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
    required TResult Function(String pinNumber) pinConfirmationFormChanged,
  }) {
    return pinFormChanged(pinNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String pinNumber)? pinFormChanged,
    TResult Function(String pinNumber)? pinConfirmationFormChanged,
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
    required TResult Function(PinConfirmationFormChanged value)
        pinConfirmationFormChanged,
  }) {
    return pinFormChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PinFormChanged value)? pinFormChanged,
    TResult Function(PinConfirmationFormChanged value)?
        pinConfirmationFormChanged,
    required TResult orElse(),
  }) {
    if (pinFormChanged != null) {
      return pinFormChanged(this);
    }
    return orElse();
  }
}

abstract class PinFormChanged implements SignUpPinEvent {
  const factory PinFormChanged(String pinNumber) = _$PinFormChanged;

  @override
  String get pinNumber => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $PinFormChangedCopyWith<PinFormChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PinConfirmationFormChangedCopyWith<$Res>
    implements $SignUpPinEventCopyWith<$Res> {
  factory $PinConfirmationFormChangedCopyWith(PinConfirmationFormChanged value,
          $Res Function(PinConfirmationFormChanged) then) =
      _$PinConfirmationFormChangedCopyWithImpl<$Res>;
  @override
  $Res call({String pinNumber});
}

/// @nodoc
class _$PinConfirmationFormChangedCopyWithImpl<$Res>
    extends _$SignUpPinEventCopyWithImpl<$Res>
    implements $PinConfirmationFormChangedCopyWith<$Res> {
  _$PinConfirmationFormChangedCopyWithImpl(PinConfirmationFormChanged _value,
      $Res Function(PinConfirmationFormChanged) _then)
      : super(_value, (v) => _then(v as PinConfirmationFormChanged));

  @override
  PinConfirmationFormChanged get _value =>
      super._value as PinConfirmationFormChanged;

  @override
  $Res call({
    Object? pinNumber = freezed,
  }) {
    return _then(PinConfirmationFormChanged(
      pinNumber == freezed
          ? _value.pinNumber
          : pinNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PinConfirmationFormChanged implements PinConfirmationFormChanged {
  const _$PinConfirmationFormChanged(this.pinNumber);

  @override
  final String pinNumber;

  @override
  String toString() {
    return 'SignUpPinEvent.pinConfirmationFormChanged(pinNumber: $pinNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PinConfirmationFormChanged &&
            (identical(other.pinNumber, pinNumber) ||
                const DeepCollectionEquality()
                    .equals(other.pinNumber, pinNumber)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(pinNumber);

  @JsonKey(ignore: true)
  @override
  $PinConfirmationFormChangedCopyWith<PinConfirmationFormChanged>
      get copyWith =>
          _$PinConfirmationFormChangedCopyWithImpl<PinConfirmationFormChanged>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String pinNumber) pinFormChanged,
    required TResult Function(String pinNumber) pinConfirmationFormChanged,
  }) {
    return pinConfirmationFormChanged(pinNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String pinNumber)? pinFormChanged,
    TResult Function(String pinNumber)? pinConfirmationFormChanged,
    required TResult orElse(),
  }) {
    if (pinConfirmationFormChanged != null) {
      return pinConfirmationFormChanged(pinNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PinFormChanged value) pinFormChanged,
    required TResult Function(PinConfirmationFormChanged value)
        pinConfirmationFormChanged,
  }) {
    return pinConfirmationFormChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PinFormChanged value)? pinFormChanged,
    TResult Function(PinConfirmationFormChanged value)?
        pinConfirmationFormChanged,
    required TResult orElse(),
  }) {
    if (pinConfirmationFormChanged != null) {
      return pinConfirmationFormChanged(this);
    }
    return orElse();
  }
}

abstract class PinConfirmationFormChanged implements SignUpPinEvent {
  const factory PinConfirmationFormChanged(String pinNumber) =
      _$PinConfirmationFormChanged;

  @override
  String get pinNumber => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $PinConfirmationFormChangedCopyWith<PinConfirmationFormChanged>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$SignUpPinStateTearOff {
  const _$SignUpPinStateTearOff();

  _SignUpPinState call(
      {required String pinNumber,
      required String pinNumberConfirmation,
      required bool showErrorMessages,
      required FormSubmissionStatus formStatus}) {
    return _SignUpPinState(
      pinNumber: pinNumber,
      pinNumberConfirmation: pinNumberConfirmation,
      showErrorMessages: showErrorMessages,
      formStatus: formStatus,
    );
  }
}

/// @nodoc
const $SignUpPinState = _$SignUpPinStateTearOff();

/// @nodoc
mixin _$SignUpPinState {
  String get pinNumber => throw _privateConstructorUsedError;
  String get pinNumberConfirmation => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  FormSubmissionStatus get formStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignUpPinStateCopyWith<SignUpPinState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpPinStateCopyWith<$Res> {
  factory $SignUpPinStateCopyWith(
          SignUpPinState value, $Res Function(SignUpPinState) then) =
      _$SignUpPinStateCopyWithImpl<$Res>;
  $Res call(
      {String pinNumber,
      String pinNumberConfirmation,
      bool showErrorMessages,
      FormSubmissionStatus formStatus});
}

/// @nodoc
class _$SignUpPinStateCopyWithImpl<$Res>
    implements $SignUpPinStateCopyWith<$Res> {
  _$SignUpPinStateCopyWithImpl(this._value, this._then);

  final SignUpPinState _value;
  // ignore: unused_field
  final $Res Function(SignUpPinState) _then;

  @override
  $Res call({
    Object? pinNumber = freezed,
    Object? pinNumberConfirmation = freezed,
    Object? showErrorMessages = freezed,
    Object? formStatus = freezed,
  }) {
    return _then(_value.copyWith(
      pinNumber: pinNumber == freezed
          ? _value.pinNumber
          : pinNumber // ignore: cast_nullable_to_non_nullable
              as String,
      pinNumberConfirmation: pinNumberConfirmation == freezed
          ? _value.pinNumberConfirmation
          : pinNumberConfirmation // ignore: cast_nullable_to_non_nullable
              as String,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      formStatus: formStatus == freezed
          ? _value.formStatus
          : formStatus // ignore: cast_nullable_to_non_nullable
              as FormSubmissionStatus,
    ));
  }
}

/// @nodoc
abstract class _$SignUpPinStateCopyWith<$Res>
    implements $SignUpPinStateCopyWith<$Res> {
  factory _$SignUpPinStateCopyWith(
          _SignUpPinState value, $Res Function(_SignUpPinState) then) =
      __$SignUpPinStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String pinNumber,
      String pinNumberConfirmation,
      bool showErrorMessages,
      FormSubmissionStatus formStatus});
}

/// @nodoc
class __$SignUpPinStateCopyWithImpl<$Res>
    extends _$SignUpPinStateCopyWithImpl<$Res>
    implements _$SignUpPinStateCopyWith<$Res> {
  __$SignUpPinStateCopyWithImpl(
      _SignUpPinState _value, $Res Function(_SignUpPinState) _then)
      : super(_value, (v) => _then(v as _SignUpPinState));

  @override
  _SignUpPinState get _value => super._value as _SignUpPinState;

  @override
  $Res call({
    Object? pinNumber = freezed,
    Object? pinNumberConfirmation = freezed,
    Object? showErrorMessages = freezed,
    Object? formStatus = freezed,
  }) {
    return _then(_SignUpPinState(
      pinNumber: pinNumber == freezed
          ? _value.pinNumber
          : pinNumber // ignore: cast_nullable_to_non_nullable
              as String,
      pinNumberConfirmation: pinNumberConfirmation == freezed
          ? _value.pinNumberConfirmation
          : pinNumberConfirmation // ignore: cast_nullable_to_non_nullable
              as String,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      formStatus: formStatus == freezed
          ? _value.formStatus
          : formStatus // ignore: cast_nullable_to_non_nullable
              as FormSubmissionStatus,
    ));
  }
}

/// @nodoc

class _$_SignUpPinState extends _SignUpPinState {
  const _$_SignUpPinState(
      {required this.pinNumber,
      required this.pinNumberConfirmation,
      required this.showErrorMessages,
      required this.formStatus})
      : super._();

  @override
  final String pinNumber;
  @override
  final String pinNumberConfirmation;
  @override
  final bool showErrorMessages;
  @override
  final FormSubmissionStatus formStatus;

  @override
  String toString() {
    return 'SignUpPinState(pinNumber: $pinNumber, pinNumberConfirmation: $pinNumberConfirmation, showErrorMessages: $showErrorMessages, formStatus: $formStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SignUpPinState &&
            (identical(other.pinNumber, pinNumber) ||
                const DeepCollectionEquality()
                    .equals(other.pinNumber, pinNumber)) &&
            (identical(other.pinNumberConfirmation, pinNumberConfirmation) ||
                const DeepCollectionEquality().equals(
                    other.pinNumberConfirmation, pinNumberConfirmation)) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                const DeepCollectionEquality()
                    .equals(other.showErrorMessages, showErrorMessages)) &&
            (identical(other.formStatus, formStatus) ||
                const DeepCollectionEquality()
                    .equals(other.formStatus, formStatus)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(pinNumber) ^
      const DeepCollectionEquality().hash(pinNumberConfirmation) ^
      const DeepCollectionEquality().hash(showErrorMessages) ^
      const DeepCollectionEquality().hash(formStatus);

  @JsonKey(ignore: true)
  @override
  _$SignUpPinStateCopyWith<_SignUpPinState> get copyWith =>
      __$SignUpPinStateCopyWithImpl<_SignUpPinState>(this, _$identity);
}

abstract class _SignUpPinState extends SignUpPinState {
  const factory _SignUpPinState(
      {required String pinNumber,
      required String pinNumberConfirmation,
      required bool showErrorMessages,
      required FormSubmissionStatus formStatus}) = _$_SignUpPinState;
  const _SignUpPinState._() : super._();

  @override
  String get pinNumber => throw _privateConstructorUsedError;
  @override
  String get pinNumberConfirmation => throw _privateConstructorUsedError;
  @override
  bool get showErrorMessages => throw _privateConstructorUsedError;
  @override
  FormSubmissionStatus get formStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SignUpPinStateCopyWith<_SignUpPinState> get copyWith =>
      throw _privateConstructorUsedError;
}
