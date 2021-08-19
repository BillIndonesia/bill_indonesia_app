// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'filter_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FilterStateTearOff {
  const _$FilterStateTearOff();

  _FilterState call(
      {required bool isFiltered,
      required String startDate,
      required String endDate,
      required bool topup,
      required bool payment}) {
    return _FilterState(
      isFiltered: isFiltered,
      startDate: startDate,
      endDate: endDate,
      topup: topup,
      payment: payment,
    );
  }
}

/// @nodoc
const $FilterState = _$FilterStateTearOff();

/// @nodoc
mixin _$FilterState {
  bool get isFiltered => throw _privateConstructorUsedError;
  String get startDate => throw _privateConstructorUsedError;
  String get endDate => throw _privateConstructorUsedError;
  bool get topup => throw _privateConstructorUsedError;
  bool get payment => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FilterStateCopyWith<FilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterStateCopyWith<$Res> {
  factory $FilterStateCopyWith(
          FilterState value, $Res Function(FilterState) then) =
      _$FilterStateCopyWithImpl<$Res>;
  $Res call(
      {bool isFiltered,
      String startDate,
      String endDate,
      bool topup,
      bool payment});
}

/// @nodoc
class _$FilterStateCopyWithImpl<$Res> implements $FilterStateCopyWith<$Res> {
  _$FilterStateCopyWithImpl(this._value, this._then);

  final FilterState _value;
  // ignore: unused_field
  final $Res Function(FilterState) _then;

  @override
  $Res call({
    Object? isFiltered = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? topup = freezed,
    Object? payment = freezed,
  }) {
    return _then(_value.copyWith(
      isFiltered: isFiltered == freezed
          ? _value.isFiltered
          : isFiltered // ignore: cast_nullable_to_non_nullable
              as bool,
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      topup: topup == freezed
          ? _value.topup
          : topup // ignore: cast_nullable_to_non_nullable
              as bool,
      payment: payment == freezed
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$FilterStateCopyWith<$Res>
    implements $FilterStateCopyWith<$Res> {
  factory _$FilterStateCopyWith(
          _FilterState value, $Res Function(_FilterState) then) =
      __$FilterStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isFiltered,
      String startDate,
      String endDate,
      bool topup,
      bool payment});
}

/// @nodoc
class __$FilterStateCopyWithImpl<$Res> extends _$FilterStateCopyWithImpl<$Res>
    implements _$FilterStateCopyWith<$Res> {
  __$FilterStateCopyWithImpl(
      _FilterState _value, $Res Function(_FilterState) _then)
      : super(_value, (v) => _then(v as _FilterState));

  @override
  _FilterState get _value => super._value as _FilterState;

  @override
  $Res call({
    Object? isFiltered = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? topup = freezed,
    Object? payment = freezed,
  }) {
    return _then(_FilterState(
      isFiltered: isFiltered == freezed
          ? _value.isFiltered
          : isFiltered // ignore: cast_nullable_to_non_nullable
              as bool,
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      topup: topup == freezed
          ? _value.topup
          : topup // ignore: cast_nullable_to_non_nullable
              as bool,
      payment: payment == freezed
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_FilterState extends _FilterState {
  const _$_FilterState(
      {required this.isFiltered,
      required this.startDate,
      required this.endDate,
      required this.topup,
      required this.payment})
      : super._();

  @override
  final bool isFiltered;
  @override
  final String startDate;
  @override
  final String endDate;
  @override
  final bool topup;
  @override
  final bool payment;

  @override
  String toString() {
    return 'FilterState(isFiltered: $isFiltered, startDate: $startDate, endDate: $endDate, topup: $topup, payment: $payment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FilterState &&
            (identical(other.isFiltered, isFiltered) ||
                const DeepCollectionEquality()
                    .equals(other.isFiltered, isFiltered)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.topup, topup) ||
                const DeepCollectionEquality().equals(other.topup, topup)) &&
            (identical(other.payment, payment) ||
                const DeepCollectionEquality().equals(other.payment, payment)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isFiltered) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(topup) ^
      const DeepCollectionEquality().hash(payment);

  @JsonKey(ignore: true)
  @override
  _$FilterStateCopyWith<_FilterState> get copyWith =>
      __$FilterStateCopyWithImpl<_FilterState>(this, _$identity);
}

abstract class _FilterState extends FilterState {
  const factory _FilterState(
      {required bool isFiltered,
      required String startDate,
      required String endDate,
      required bool topup,
      required bool payment}) = _$_FilterState;
  const _FilterState._() : super._();

  @override
  bool get isFiltered => throw _privateConstructorUsedError;
  @override
  String get startDate => throw _privateConstructorUsedError;
  @override
  String get endDate => throw _privateConstructorUsedError;
  @override
  bool get topup => throw _privateConstructorUsedError;
  @override
  bool get payment => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FilterStateCopyWith<_FilterState> get copyWith =>
      throw _privateConstructorUsedError;
}
