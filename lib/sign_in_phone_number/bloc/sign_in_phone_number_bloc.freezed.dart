// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'sign_in_phone_number_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SignInPhoneNumberEventTearOff {
  const _$SignInPhoneNumberEventTearOff();

  PhoneNumberFormChanged phoneNumberFormChanged(String phoneNumber) {
    return PhoneNumberFormChanged(
      phoneNumber,
    );
  }

  PhoneNumberSubmitted pinFormSubmitted(String phoneNumber) {
    return PhoneNumberSubmitted(
      phoneNumber,
    );
  }

  TermAndConditionChecked termAndConditionChecked() {
    return const TermAndConditionChecked();
  }
}

/// @nodoc
const $SignInPhoneNumberEvent = _$SignInPhoneNumberEventTearOff();

/// @nodoc
mixin _$SignInPhoneNumberEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) phoneNumberFormChanged,
    required TResult Function(String phoneNumber) pinFormSubmitted,
    required TResult Function() termAndConditionChecked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberFormChanged,
    TResult Function(String phoneNumber)? pinFormSubmitted,
    TResult Function()? termAndConditionChecked,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PhoneNumberFormChanged value)
        phoneNumberFormChanged,
    required TResult Function(PhoneNumberSubmitted value) pinFormSubmitted,
    required TResult Function(TermAndConditionChecked value)
        termAndConditionChecked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PhoneNumberFormChanged value)? phoneNumberFormChanged,
    TResult Function(PhoneNumberSubmitted value)? pinFormSubmitted,
    TResult Function(TermAndConditionChecked value)? termAndConditionChecked,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInPhoneNumberEventCopyWith<$Res> {
  factory $SignInPhoneNumberEventCopyWith(SignInPhoneNumberEvent value,
          $Res Function(SignInPhoneNumberEvent) then) =
      _$SignInPhoneNumberEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInPhoneNumberEventCopyWithImpl<$Res>
    implements $SignInPhoneNumberEventCopyWith<$Res> {
  _$SignInPhoneNumberEventCopyWithImpl(this._value, this._then);

  final SignInPhoneNumberEvent _value;
  // ignore: unused_field
  final $Res Function(SignInPhoneNumberEvent) _then;
}

/// @nodoc
abstract class $PhoneNumberFormChangedCopyWith<$Res> {
  factory $PhoneNumberFormChangedCopyWith(PhoneNumberFormChanged value,
          $Res Function(PhoneNumberFormChanged) then) =
      _$PhoneNumberFormChangedCopyWithImpl<$Res>;
  $Res call({String phoneNumber});
}

/// @nodoc
class _$PhoneNumberFormChangedCopyWithImpl<$Res>
    extends _$SignInPhoneNumberEventCopyWithImpl<$Res>
    implements $PhoneNumberFormChangedCopyWith<$Res> {
  _$PhoneNumberFormChangedCopyWithImpl(PhoneNumberFormChanged _value,
      $Res Function(PhoneNumberFormChanged) _then)
      : super(_value, (v) => _then(v as PhoneNumberFormChanged));

  @override
  PhoneNumberFormChanged get _value => super._value as PhoneNumberFormChanged;

  @override
  $Res call({
    Object? phoneNumber = freezed,
  }) {
    return _then(PhoneNumberFormChanged(
      phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PhoneNumberFormChanged implements PhoneNumberFormChanged {
  const _$PhoneNumberFormChanged(this.phoneNumber);

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'SignInPhoneNumberEvent.phoneNumberFormChanged(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PhoneNumberFormChanged &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(phoneNumber);

  @JsonKey(ignore: true)
  @override
  $PhoneNumberFormChangedCopyWith<PhoneNumberFormChanged> get copyWith =>
      _$PhoneNumberFormChangedCopyWithImpl<PhoneNumberFormChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) phoneNumberFormChanged,
    required TResult Function(String phoneNumber) pinFormSubmitted,
    required TResult Function() termAndConditionChecked,
  }) {
    return phoneNumberFormChanged(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberFormChanged,
    TResult Function(String phoneNumber)? pinFormSubmitted,
    TResult Function()? termAndConditionChecked,
    required TResult orElse(),
  }) {
    if (phoneNumberFormChanged != null) {
      return phoneNumberFormChanged(phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PhoneNumberFormChanged value)
        phoneNumberFormChanged,
    required TResult Function(PhoneNumberSubmitted value) pinFormSubmitted,
    required TResult Function(TermAndConditionChecked value)
        termAndConditionChecked,
  }) {
    return phoneNumberFormChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PhoneNumberFormChanged value)? phoneNumberFormChanged,
    TResult Function(PhoneNumberSubmitted value)? pinFormSubmitted,
    TResult Function(TermAndConditionChecked value)? termAndConditionChecked,
    required TResult orElse(),
  }) {
    if (phoneNumberFormChanged != null) {
      return phoneNumberFormChanged(this);
    }
    return orElse();
  }
}

abstract class PhoneNumberFormChanged implements SignInPhoneNumberEvent {
  const factory PhoneNumberFormChanged(String phoneNumber) =
      _$PhoneNumberFormChanged;

  String get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhoneNumberFormChangedCopyWith<PhoneNumberFormChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneNumberSubmittedCopyWith<$Res> {
  factory $PhoneNumberSubmittedCopyWith(PhoneNumberSubmitted value,
          $Res Function(PhoneNumberSubmitted) then) =
      _$PhoneNumberSubmittedCopyWithImpl<$Res>;
  $Res call({String phoneNumber});
}

/// @nodoc
class _$PhoneNumberSubmittedCopyWithImpl<$Res>
    extends _$SignInPhoneNumberEventCopyWithImpl<$Res>
    implements $PhoneNumberSubmittedCopyWith<$Res> {
  _$PhoneNumberSubmittedCopyWithImpl(
      PhoneNumberSubmitted _value, $Res Function(PhoneNumberSubmitted) _then)
      : super(_value, (v) => _then(v as PhoneNumberSubmitted));

  @override
  PhoneNumberSubmitted get _value => super._value as PhoneNumberSubmitted;

  @override
  $Res call({
    Object? phoneNumber = freezed,
  }) {
    return _then(PhoneNumberSubmitted(
      phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PhoneNumberSubmitted implements PhoneNumberSubmitted {
  const _$PhoneNumberSubmitted(this.phoneNumber);

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'SignInPhoneNumberEvent.pinFormSubmitted(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PhoneNumberSubmitted &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(phoneNumber);

  @JsonKey(ignore: true)
  @override
  $PhoneNumberSubmittedCopyWith<PhoneNumberSubmitted> get copyWith =>
      _$PhoneNumberSubmittedCopyWithImpl<PhoneNumberSubmitted>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) phoneNumberFormChanged,
    required TResult Function(String phoneNumber) pinFormSubmitted,
    required TResult Function() termAndConditionChecked,
  }) {
    return pinFormSubmitted(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberFormChanged,
    TResult Function(String phoneNumber)? pinFormSubmitted,
    TResult Function()? termAndConditionChecked,
    required TResult orElse(),
  }) {
    if (pinFormSubmitted != null) {
      return pinFormSubmitted(phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PhoneNumberFormChanged value)
        phoneNumberFormChanged,
    required TResult Function(PhoneNumberSubmitted value) pinFormSubmitted,
    required TResult Function(TermAndConditionChecked value)
        termAndConditionChecked,
  }) {
    return pinFormSubmitted(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PhoneNumberFormChanged value)? phoneNumberFormChanged,
    TResult Function(PhoneNumberSubmitted value)? pinFormSubmitted,
    TResult Function(TermAndConditionChecked value)? termAndConditionChecked,
    required TResult orElse(),
  }) {
    if (pinFormSubmitted != null) {
      return pinFormSubmitted(this);
    }
    return orElse();
  }
}

abstract class PhoneNumberSubmitted implements SignInPhoneNumberEvent {
  const factory PhoneNumberSubmitted(String phoneNumber) =
      _$PhoneNumberSubmitted;

  String get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhoneNumberSubmittedCopyWith<PhoneNumberSubmitted> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TermAndConditionCheckedCopyWith<$Res> {
  factory $TermAndConditionCheckedCopyWith(TermAndConditionChecked value,
          $Res Function(TermAndConditionChecked) then) =
      _$TermAndConditionCheckedCopyWithImpl<$Res>;
}

/// @nodoc
class _$TermAndConditionCheckedCopyWithImpl<$Res>
    extends _$SignInPhoneNumberEventCopyWithImpl<$Res>
    implements $TermAndConditionCheckedCopyWith<$Res> {
  _$TermAndConditionCheckedCopyWithImpl(TermAndConditionChecked _value,
      $Res Function(TermAndConditionChecked) _then)
      : super(_value, (v) => _then(v as TermAndConditionChecked));

  @override
  TermAndConditionChecked get _value => super._value as TermAndConditionChecked;
}

/// @nodoc

class _$TermAndConditionChecked implements TermAndConditionChecked {
  const _$TermAndConditionChecked();

  @override
  String toString() {
    return 'SignInPhoneNumberEvent.termAndConditionChecked()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is TermAndConditionChecked);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) phoneNumberFormChanged,
    required TResult Function(String phoneNumber) pinFormSubmitted,
    required TResult Function() termAndConditionChecked,
  }) {
    return termAndConditionChecked();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberFormChanged,
    TResult Function(String phoneNumber)? pinFormSubmitted,
    TResult Function()? termAndConditionChecked,
    required TResult orElse(),
  }) {
    if (termAndConditionChecked != null) {
      return termAndConditionChecked();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PhoneNumberFormChanged value)
        phoneNumberFormChanged,
    required TResult Function(PhoneNumberSubmitted value) pinFormSubmitted,
    required TResult Function(TermAndConditionChecked value)
        termAndConditionChecked,
  }) {
    return termAndConditionChecked(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PhoneNumberFormChanged value)? phoneNumberFormChanged,
    TResult Function(PhoneNumberSubmitted value)? pinFormSubmitted,
    TResult Function(TermAndConditionChecked value)? termAndConditionChecked,
    required TResult orElse(),
  }) {
    if (termAndConditionChecked != null) {
      return termAndConditionChecked(this);
    }
    return orElse();
  }
}

abstract class TermAndConditionChecked implements SignInPhoneNumberEvent {
  const factory TermAndConditionChecked() = _$TermAndConditionChecked;
}

/// @nodoc
class _$SignInPhoneNumberStateTearOff {
  const _$SignInPhoneNumberStateTearOff();

  _SignInPhoneNumberState call(
      {required String phoneNumber,
      required String errorMessages,
      required bool showErrorMessages,
      required bool isTermAndConditionChecked,
      required FormSubmissionStatus formStatus}) {
    return _SignInPhoneNumberState(
      phoneNumber: phoneNumber,
      errorMessages: errorMessages,
      showErrorMessages: showErrorMessages,
      isTermAndConditionChecked: isTermAndConditionChecked,
      formStatus: formStatus,
    );
  }
}

/// @nodoc
const $SignInPhoneNumberState = _$SignInPhoneNumberStateTearOff();

/// @nodoc
mixin _$SignInPhoneNumberState {
  String get phoneNumber => throw _privateConstructorUsedError;
  String get errorMessages => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isTermAndConditionChecked => throw _privateConstructorUsedError;
  FormSubmissionStatus get formStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInPhoneNumberStateCopyWith<SignInPhoneNumberState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInPhoneNumberStateCopyWith<$Res> {
  factory $SignInPhoneNumberStateCopyWith(SignInPhoneNumberState value,
          $Res Function(SignInPhoneNumberState) then) =
      _$SignInPhoneNumberStateCopyWithImpl<$Res>;
  $Res call(
      {String phoneNumber,
      String errorMessages,
      bool showErrorMessages,
      bool isTermAndConditionChecked,
      FormSubmissionStatus formStatus});
}

/// @nodoc
class _$SignInPhoneNumberStateCopyWithImpl<$Res>
    implements $SignInPhoneNumberStateCopyWith<$Res> {
  _$SignInPhoneNumberStateCopyWithImpl(this._value, this._then);

  final SignInPhoneNumberState _value;
  // ignore: unused_field
  final $Res Function(SignInPhoneNumberState) _then;

  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? errorMessages = freezed,
    Object? showErrorMessages = freezed,
    Object? isTermAndConditionChecked = freezed,
    Object? formStatus = freezed,
  }) {
    return _then(_value.copyWith(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessages: errorMessages == freezed
          ? _value.errorMessages
          : errorMessages // ignore: cast_nullable_to_non_nullable
              as String,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isTermAndConditionChecked: isTermAndConditionChecked == freezed
          ? _value.isTermAndConditionChecked
          : isTermAndConditionChecked // ignore: cast_nullable_to_non_nullable
              as bool,
      formStatus: formStatus == freezed
          ? _value.formStatus
          : formStatus // ignore: cast_nullable_to_non_nullable
              as FormSubmissionStatus,
    ));
  }
}

/// @nodoc
abstract class _$SignInPhoneNumberStateCopyWith<$Res>
    implements $SignInPhoneNumberStateCopyWith<$Res> {
  factory _$SignInPhoneNumberStateCopyWith(_SignInPhoneNumberState value,
          $Res Function(_SignInPhoneNumberState) then) =
      __$SignInPhoneNumberStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String phoneNumber,
      String errorMessages,
      bool showErrorMessages,
      bool isTermAndConditionChecked,
      FormSubmissionStatus formStatus});
}

/// @nodoc
class __$SignInPhoneNumberStateCopyWithImpl<$Res>
    extends _$SignInPhoneNumberStateCopyWithImpl<$Res>
    implements _$SignInPhoneNumberStateCopyWith<$Res> {
  __$SignInPhoneNumberStateCopyWithImpl(_SignInPhoneNumberState _value,
      $Res Function(_SignInPhoneNumberState) _then)
      : super(_value, (v) => _then(v as _SignInPhoneNumberState));

  @override
  _SignInPhoneNumberState get _value => super._value as _SignInPhoneNumberState;

  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? errorMessages = freezed,
    Object? showErrorMessages = freezed,
    Object? isTermAndConditionChecked = freezed,
    Object? formStatus = freezed,
  }) {
    return _then(_SignInPhoneNumberState(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessages: errorMessages == freezed
          ? _value.errorMessages
          : errorMessages // ignore: cast_nullable_to_non_nullable
              as String,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isTermAndConditionChecked: isTermAndConditionChecked == freezed
          ? _value.isTermAndConditionChecked
          : isTermAndConditionChecked // ignore: cast_nullable_to_non_nullable
              as bool,
      formStatus: formStatus == freezed
          ? _value.formStatus
          : formStatus // ignore: cast_nullable_to_non_nullable
              as FormSubmissionStatus,
    ));
  }
}

/// @nodoc

class _$_SignInPhoneNumberState extends _SignInPhoneNumberState {
  const _$_SignInPhoneNumberState(
      {required this.phoneNumber,
      required this.errorMessages,
      required this.showErrorMessages,
      required this.isTermAndConditionChecked,
      required this.formStatus})
      : super._();

  @override
  final String phoneNumber;
  @override
  final String errorMessages;
  @override
  final bool showErrorMessages;
  @override
  final bool isTermAndConditionChecked;
  @override
  final FormSubmissionStatus formStatus;

  @override
  String toString() {
    return 'SignInPhoneNumberState(phoneNumber: $phoneNumber, errorMessages: $errorMessages, showErrorMessages: $showErrorMessages, isTermAndConditionChecked: $isTermAndConditionChecked, formStatus: $formStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SignInPhoneNumberState &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.errorMessages, errorMessages) ||
                const DeepCollectionEquality()
                    .equals(other.errorMessages, errorMessages)) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                const DeepCollectionEquality()
                    .equals(other.showErrorMessages, showErrorMessages)) &&
            (identical(other.isTermAndConditionChecked,
                    isTermAndConditionChecked) ||
                const DeepCollectionEquality().equals(
                    other.isTermAndConditionChecked,
                    isTermAndConditionChecked)) &&
            (identical(other.formStatus, formStatus) ||
                const DeepCollectionEquality()
                    .equals(other.formStatus, formStatus)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(errorMessages) ^
      const DeepCollectionEquality().hash(showErrorMessages) ^
      const DeepCollectionEquality().hash(isTermAndConditionChecked) ^
      const DeepCollectionEquality().hash(formStatus);

  @JsonKey(ignore: true)
  @override
  _$SignInPhoneNumberStateCopyWith<_SignInPhoneNumberState> get copyWith =>
      __$SignInPhoneNumberStateCopyWithImpl<_SignInPhoneNumberState>(
          this, _$identity);
}

abstract class _SignInPhoneNumberState extends SignInPhoneNumberState {
  const factory _SignInPhoneNumberState(
      {required String phoneNumber,
      required String errorMessages,
      required bool showErrorMessages,
      required bool isTermAndConditionChecked,
      required FormSubmissionStatus formStatus}) = _$_SignInPhoneNumberState;
  const _SignInPhoneNumberState._() : super._();

  @override
  String get phoneNumber => throw _privateConstructorUsedError;
  @override
  String get errorMessages => throw _privateConstructorUsedError;
  @override
  bool get showErrorMessages => throw _privateConstructorUsedError;
  @override
  bool get isTermAndConditionChecked => throw _privateConstructorUsedError;
  @override
  FormSubmissionStatus get formStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SignInPhoneNumberStateCopyWith<_SignInPhoneNumberState> get copyWith =>
      throw _privateConstructorUsedError;
}
