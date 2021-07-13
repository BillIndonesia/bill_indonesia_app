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

  Transaction transaction(Map<String, dynamic> data) {
    return Transaction(
      data,
    );
  }
}

/// @nodoc
const $QrScannedEvent = _$QrScannedEventTearOff();

/// @nodoc
mixin _$QrScannedEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String qrCode) qrCodeScanned,
    required TResult Function(Map<String, dynamic> data) transaction,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String qrCode)? qrCodeScanned,
    TResult Function(Map<String, dynamic> data)? transaction,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QrCodeScanned value) qrCodeScanned,
    required TResult Function(Transaction value) transaction,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QrCodeScanned value)? qrCodeScanned,
    TResult Function(Transaction value)? transaction,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QrScannedEventCopyWith<$Res> {
  factory $QrScannedEventCopyWith(
          QrScannedEvent value, $Res Function(QrScannedEvent) then) =
      _$QrScannedEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$QrScannedEventCopyWithImpl<$Res>
    implements $QrScannedEventCopyWith<$Res> {
  _$QrScannedEventCopyWithImpl(this._value, this._then);

  final QrScannedEvent _value;
  // ignore: unused_field
  final $Res Function(QrScannedEvent) _then;
}

/// @nodoc
abstract class $QrCodeScannedCopyWith<$Res> {
  factory $QrCodeScannedCopyWith(
          QrCodeScanned value, $Res Function(QrCodeScanned) then) =
      _$QrCodeScannedCopyWithImpl<$Res>;
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
    required TResult Function(Map<String, dynamic> data) transaction,
  }) {
    return qrCodeScanned(qrCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String qrCode)? qrCodeScanned,
    TResult Function(Map<String, dynamic> data)? transaction,
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
    required TResult Function(Transaction value) transaction,
  }) {
    return qrCodeScanned(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QrCodeScanned value)? qrCodeScanned,
    TResult Function(Transaction value)? transaction,
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

  String get qrCode => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QrCodeScannedCopyWith<QrCodeScanned> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCopyWith<$Res> {
  factory $TransactionCopyWith(
          Transaction value, $Res Function(Transaction) then) =
      _$TransactionCopyWithImpl<$Res>;
  $Res call({Map<String, dynamic> data});
}

/// @nodoc
class _$TransactionCopyWithImpl<$Res> extends _$QrScannedEventCopyWithImpl<$Res>
    implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(
      Transaction _value, $Res Function(Transaction) _then)
      : super(_value, (v) => _then(v as Transaction));

  @override
  Transaction get _value => super._value as Transaction;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(Transaction(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$Transaction implements Transaction {
  const _$Transaction(this.data);

  @override
  final Map<String, dynamic> data;

  @override
  String toString() {
    return 'QrScannedEvent.transaction(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Transaction &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  $TransactionCopyWith<Transaction> get copyWith =>
      _$TransactionCopyWithImpl<Transaction>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String qrCode) qrCodeScanned,
    required TResult Function(Map<String, dynamic> data) transaction,
  }) {
    return transaction(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String qrCode)? qrCodeScanned,
    TResult Function(Map<String, dynamic> data)? transaction,
    required TResult orElse(),
  }) {
    if (transaction != null) {
      return transaction(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QrCodeScanned value) qrCodeScanned,
    required TResult Function(Transaction value) transaction,
  }) {
    return transaction(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QrCodeScanned value)? qrCodeScanned,
    TResult Function(Transaction value)? transaction,
    required TResult orElse(),
  }) {
    if (transaction != null) {
      return transaction(this);
    }
    return orElse();
  }
}

abstract class Transaction implements QrScannedEvent {
  const factory Transaction(Map<String, dynamic> data) = _$Transaction;

  Map<String, dynamic> get data => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionCopyWith<Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$QrScannedStateTearOff {
  const _$QrScannedStateTearOff();

  _QrScannedState call(
      {required FormSubmissionStatus formStatus,
      required ScannedType type,
      required TransactionStatus transactionStatus,
      required Map<String, dynamic> transactionData}) {
    return _QrScannedState(
      formStatus: formStatus,
      type: type,
      transactionStatus: transactionStatus,
      transactionData: transactionData,
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
  Map<String, dynamic> get transactionData =>
      throw _privateConstructorUsedError;

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
      TransactionStatus transactionStatus,
      Map<String, dynamic> transactionData});
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
    Object? transactionData = freezed,
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
      transactionData: transactionData == freezed
          ? _value.transactionData
          : transactionData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
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
      TransactionStatus transactionStatus,
      Map<String, dynamic> transactionData});
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
    Object? transactionData = freezed,
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
      transactionData: transactionData == freezed
          ? _value.transactionData
          : transactionData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$_QrScannedState implements _QrScannedState {
  const _$_QrScannedState(
      {required this.formStatus,
      required this.type,
      required this.transactionStatus,
      required this.transactionData});

  @override
  final FormSubmissionStatus formStatus;
  @override
  final ScannedType type;
  @override
  final TransactionStatus transactionStatus;
  @override
  final Map<String, dynamic> transactionData;

  @override
  String toString() {
    return 'QrScannedState(formStatus: $formStatus, type: $type, transactionStatus: $transactionStatus, transactionData: $transactionData)';
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
                    .equals(other.transactionStatus, transactionStatus)) &&
            (identical(other.transactionData, transactionData) ||
                const DeepCollectionEquality()
                    .equals(other.transactionData, transactionData)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(formStatus) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(transactionStatus) ^
      const DeepCollectionEquality().hash(transactionData);

  @JsonKey(ignore: true)
  @override
  _$QrScannedStateCopyWith<_QrScannedState> get copyWith =>
      __$QrScannedStateCopyWithImpl<_QrScannedState>(this, _$identity);
}

abstract class _QrScannedState implements QrScannedState {
  const factory _QrScannedState(
      {required FormSubmissionStatus formStatus,
      required ScannedType type,
      required TransactionStatus transactionStatus,
      required Map<String, dynamic> transactionData}) = _$_QrScannedState;

  @override
  FormSubmissionStatus get formStatus => throw _privateConstructorUsedError;
  @override
  ScannedType get type => throw _privateConstructorUsedError;
  @override
  TransactionStatus get transactionStatus => throw _privateConstructorUsedError;
  @override
  Map<String, dynamic> get transactionData =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$QrScannedStateCopyWith<_QrScannedState> get copyWith =>
      throw _privateConstructorUsedError;
}
