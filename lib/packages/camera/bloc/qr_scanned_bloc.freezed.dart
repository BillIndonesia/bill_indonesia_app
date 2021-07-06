// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'qr_scanned_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$QrScannedEventTearOff {
  const _$QrScannedEventTearOff();

  QrCodeScanned qrCodeScanned(String qrCode) {
    return QrCodeScanned(
      qrCode,
    );
  }
}

/// @nodoc
const $QrScannedEvent = _$QrScannedEventTearOff();

/// @nodoc
mixin _$QrScannedEvent {
  String get qrCode => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String qrCode) qrCodeScanned,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String qrCode)? qrCodeScanned,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QrCodeScanned value) qrCodeScanned,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QrCodeScanned value)? qrCodeScanned,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QrScannedEventCopyWith<QrScannedEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QrScannedEventCopyWith<$Res> {
  factory $QrScannedEventCopyWith(
          QrScannedEvent value, $Res Function(QrScannedEvent) then) =
      _$QrScannedEventCopyWithImpl<$Res>;
  $Res call({String qrCode});
}

/// @nodoc
class _$QrScannedEventCopyWithImpl<$Res>
    implements $QrScannedEventCopyWith<$Res> {
  _$QrScannedEventCopyWithImpl(this._value, this._then);

  final QrScannedEvent _value;
  // ignore: unused_field
  final $Res Function(QrScannedEvent) _then;

  @override
  $Res call({
    Object? qrCode = freezed,
  }) {
    return _then(_value.copyWith(
      qrCode: qrCode == freezed
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class $QrCodeScannedCopyWith<$Res>
    implements $QrScannedEventCopyWith<$Res> {
  factory $QrCodeScannedCopyWith(
          QrCodeScanned value, $Res Function(QrCodeScanned) then) =
      _$QrCodeScannedCopyWithImpl<$Res>;
  @override
  $Res call({String qrCode});
}

/// @nodoc
class _$QrCodeScannedCopyWithImpl<$Res>
    extends _$QrScannedEventCopyWithImpl<$Res>
    implements $QrCodeScannedCopyWith<$Res> {
  _$QrCodeScannedCopyWithImpl(
      QrCodeScanned _value, $Res Function(QrCodeScanned) _then)
      : super(_value, (v) => _then(v as QrCodeScanned));

  @override
  QrCodeScanned get _value => super._value as QrCodeScanned;

  @override
  $Res call({
    Object? qrCode = freezed,
  }) {
    return _then(QrCodeScanned(
      qrCode == freezed
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$QrCodeScanned implements QrCodeScanned {
  const _$QrCodeScanned(this.qrCode);

  @override
  final String qrCode;

  @override
  String toString() {
    return 'QrScannedEvent.qrCodeScanned(qrCode: $qrCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is QrCodeScanned &&
            (identical(other.qrCode, qrCode) ||
                const DeepCollectionEquality().equals(other.qrCode, qrCode)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(qrCode);

  @JsonKey(ignore: true)
  @override
  $QrCodeScannedCopyWith<QrCodeScanned> get copyWith =>
      _$QrCodeScannedCopyWithImpl<QrCodeScanned>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String qrCode) qrCodeScanned,
  }) {
    return qrCodeScanned(qrCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String qrCode)? qrCodeScanned,
    required TResult orElse(),
  }) {
    if (qrCodeScanned != null) {
      return qrCodeScanned(qrCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QrCodeScanned value) qrCodeScanned,
  }) {
    return qrCodeScanned(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QrCodeScanned value)? qrCodeScanned,
    required TResult orElse(),
  }) {
    if (qrCodeScanned != null) {
      return qrCodeScanned(this);
    }
    return orElse();
  }
}

abstract class QrCodeScanned implements QrScannedEvent {
  const factory QrCodeScanned(String qrCode) = _$QrCodeScanned;

  @override
  String get qrCode => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $QrCodeScannedCopyWith<QrCodeScanned> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$QrScannedStateTearOff {
  const _$QrScannedStateTearOff();

  _QrScannedState call(
      {required FormSubmissionStatus formStatus,
      required ScannedType type,
      required TransactionStatus transactionStatus}) {
    return _QrScannedState(
      formStatus: formStatus,
      type: type,
      transactionStatus: transactionStatus,
    );
  }
}

/// @nodoc
const $QrScannedState = _$QrScannedStateTearOff();

/// @nodoc
mixin _$QrScannedState {
  FormSubmissionStatus get formStatus => throw _privateConstructorUsedError;
  ScannedType get type => throw _privateConstructorUsedError;
  TransactionStatus get transactionStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QrScannedStateCopyWith<QrScannedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QrScannedStateCopyWith<$Res> {
  factory $QrScannedStateCopyWith(
          QrScannedState value, $Res Function(QrScannedState) then) =
      _$QrScannedStateCopyWithImpl<$Res>;
  $Res call(
      {FormSubmissionStatus formStatus,
      ScannedType type,
      TransactionStatus transactionStatus});
}

/// @nodoc
class _$QrScannedStateCopyWithImpl<$Res>
    implements $QrScannedStateCopyWith<$Res> {
  _$QrScannedStateCopyWithImpl(this._value, this._then);

  final QrScannedState _value;
  // ignore: unused_field
  final $Res Function(QrScannedState) _then;

  @override
  $Res call({
    Object? formStatus = freezed,
    Object? type = freezed,
    Object? transactionStatus = freezed,
  }) {
    return _then(_value.copyWith(
      formStatus: formStatus == freezed
          ? _value.formStatus
          : formStatus // ignore: cast_nullable_to_non_nullable
              as FormSubmissionStatus,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ScannedType,
      transactionStatus: transactionStatus == freezed
          ? _value.transactionStatus
          : transactionStatus // ignore: cast_nullable_to_non_nullable
              as TransactionStatus,
    ));
  }
}

/// @nodoc
abstract class _$QrScannedStateCopyWith<$Res>
    implements $QrScannedStateCopyWith<$Res> {
  factory _$QrScannedStateCopyWith(
          _QrScannedState value, $Res Function(_QrScannedState) then) =
      __$QrScannedStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {FormSubmissionStatus formStatus,
      ScannedType type,
      TransactionStatus transactionStatus});
}

/// @nodoc
class __$QrScannedStateCopyWithImpl<$Res>
    extends _$QrScannedStateCopyWithImpl<$Res>
    implements _$QrScannedStateCopyWith<$Res> {
  __$QrScannedStateCopyWithImpl(
      _QrScannedState _value, $Res Function(_QrScannedState) _then)
      : super(_value, (v) => _then(v as _QrScannedState));

  @override
  _QrScannedState get _value => super._value as _QrScannedState;

  @override
  $Res call({
    Object? formStatus = freezed,
    Object? type = freezed,
    Object? transactionStatus = freezed,
  }) {
    return _then(_QrScannedState(
      formStatus: formStatus == freezed
          ? _value.formStatus
          : formStatus // ignore: cast_nullable_to_non_nullable
              as FormSubmissionStatus,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ScannedType,
      transactionStatus: transactionStatus == freezed
          ? _value.transactionStatus
          : transactionStatus // ignore: cast_nullable_to_non_nullable
              as TransactionStatus,
    ));
  }
}

/// @nodoc

class _$_QrScannedState implements _QrScannedState {
  const _$_QrScannedState(
      {required this.formStatus,
      required this.type,
      required this.transactionStatus});

  @override
  final FormSubmissionStatus formStatus;
  @override
  final ScannedType type;
  @override
  final TransactionStatus transactionStatus;

  @override
  String toString() {
    return 'QrScannedState(formStatus: $formStatus, type: $type, transactionStatus: $transactionStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _QrScannedState &&
            (identical(other.formStatus, formStatus) ||
                const DeepCollectionEquality()
                    .equals(other.formStatus, formStatus)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.transactionStatus, transactionStatus) ||
                const DeepCollectionEquality()
                    .equals(other.transactionStatus, transactionStatus)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(formStatus) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(transactionStatus);

  @JsonKey(ignore: true)
  @override
  _$QrScannedStateCopyWith<_QrScannedState> get copyWith =>
      __$QrScannedStateCopyWithImpl<_QrScannedState>(this, _$identity);
}

abstract class _QrScannedState implements QrScannedState {
  const factory _QrScannedState(
      {required FormSubmissionStatus formStatus,
      required ScannedType type,
      required TransactionStatus transactionStatus}) = _$_QrScannedState;

  @override
  FormSubmissionStatus get formStatus => throw _privateConstructorUsedError;
  @override
  ScannedType get type => throw _privateConstructorUsedError;
  @override
  TransactionStatus get transactionStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$QrScannedStateCopyWith<_QrScannedState> get copyWith =>
      throw _privateConstructorUsedError;
}
