// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'edit_profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$EditProfileEventTearOff {
  const _$EditProfileEventTearOff();

  EditProfileInitialData initial(Map<dynamic, String> data) {
    return EditProfileInitialData(
      data,
    );
  }

  NameFormChanged nameFormChanged(String name) {
    return NameFormChanged(
      name,
    );
  }

  BornPlaceFormChanged bornPlaceFormChanged(String bornPlace) {
    return BornPlaceFormChanged(
      bornPlace,
    );
  }

  KnowUsFromChanged knowUsFromChanged(String knowUsFrom) {
    return KnowUsFromChanged(
      knowUsFrom,
    );
  }

  BornDateFormChanged bornDateFormChanged(DateTime bornDate) {
    return BornDateFormChanged(
      bornDate,
    );
  }

  ImageChanged imageChanged(File imagePath) {
    return ImageChanged(
      imagePath,
    );
  }

  FromSubmitted formSubmitted(
      {required String phoneNumber, required String password}) {
    return FromSubmitted(
      phoneNumber: phoneNumber,
      password: password,
    );
  }
}

/// @nodoc
const $EditProfileEvent = _$EditProfileEventTearOff();

/// @nodoc
mixin _$EditProfileEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<dynamic, String> data) initial,
    required TResult Function(String name) nameFormChanged,
    required TResult Function(String bornPlace) bornPlaceFormChanged,
    required TResult Function(String knowUsFrom) knowUsFromChanged,
    required TResult Function(DateTime bornDate) bornDateFormChanged,
    required TResult Function(File imagePath) imageChanged,
    required TResult Function(String phoneNumber, String password)
        formSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<dynamic, String> data)? initial,
    TResult Function(String name)? nameFormChanged,
    TResult Function(String bornPlace)? bornPlaceFormChanged,
    TResult Function(String knowUsFrom)? knowUsFromChanged,
    TResult Function(DateTime bornDate)? bornDateFormChanged,
    TResult Function(File imagePath)? imageChanged,
    TResult Function(String phoneNumber, String password)? formSubmitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditProfileInitialData value) initial,
    required TResult Function(NameFormChanged value) nameFormChanged,
    required TResult Function(BornPlaceFormChanged value) bornPlaceFormChanged,
    required TResult Function(KnowUsFromChanged value) knowUsFromChanged,
    required TResult Function(BornDateFormChanged value) bornDateFormChanged,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(FromSubmitted value) formSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditProfileInitialData value)? initial,
    TResult Function(NameFormChanged value)? nameFormChanged,
    TResult Function(BornPlaceFormChanged value)? bornPlaceFormChanged,
    TResult Function(KnowUsFromChanged value)? knowUsFromChanged,
    TResult Function(BornDateFormChanged value)? bornDateFormChanged,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(FromSubmitted value)? formSubmitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProfileEventCopyWith<$Res> {
  factory $EditProfileEventCopyWith(
          EditProfileEvent value, $Res Function(EditProfileEvent) then) =
      _$EditProfileEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$EditProfileEventCopyWithImpl<$Res>
    implements $EditProfileEventCopyWith<$Res> {
  _$EditProfileEventCopyWithImpl(this._value, this._then);

  final EditProfileEvent _value;
  // ignore: unused_field
  final $Res Function(EditProfileEvent) _then;
}

/// @nodoc
abstract class $EditProfileInitialDataCopyWith<$Res> {
  factory $EditProfileInitialDataCopyWith(EditProfileInitialData value,
          $Res Function(EditProfileInitialData) then) =
      _$EditProfileInitialDataCopyWithImpl<$Res>;
  $Res call({Map<dynamic, String> data});
}

/// @nodoc
class _$EditProfileInitialDataCopyWithImpl<$Res>
    extends _$EditProfileEventCopyWithImpl<$Res>
    implements $EditProfileInitialDataCopyWith<$Res> {
  _$EditProfileInitialDataCopyWithImpl(EditProfileInitialData _value,
      $Res Function(EditProfileInitialData) _then)
      : super(_value, (v) => _then(v as EditProfileInitialData));

  @override
  EditProfileInitialData get _value => super._value as EditProfileInitialData;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(EditProfileInitialData(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, String>,
    ));
  }
}

/// @nodoc

class _$EditProfileInitialData implements EditProfileInitialData {
  const _$EditProfileInitialData(this.data);

  @override
  final Map<dynamic, String> data;

  @override
  String toString() {
    return 'EditProfileEvent.initial(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EditProfileInitialData &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  $EditProfileInitialDataCopyWith<EditProfileInitialData> get copyWith =>
      _$EditProfileInitialDataCopyWithImpl<EditProfileInitialData>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<dynamic, String> data) initial,
    required TResult Function(String name) nameFormChanged,
    required TResult Function(String bornPlace) bornPlaceFormChanged,
    required TResult Function(String knowUsFrom) knowUsFromChanged,
    required TResult Function(DateTime bornDate) bornDateFormChanged,
    required TResult Function(File imagePath) imageChanged,
    required TResult Function(String phoneNumber, String password)
        formSubmitted,
  }) {
    return initial(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<dynamic, String> data)? initial,
    TResult Function(String name)? nameFormChanged,
    TResult Function(String bornPlace)? bornPlaceFormChanged,
    TResult Function(String knowUsFrom)? knowUsFromChanged,
    TResult Function(DateTime bornDate)? bornDateFormChanged,
    TResult Function(File imagePath)? imageChanged,
    TResult Function(String phoneNumber, String password)? formSubmitted,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditProfileInitialData value) initial,
    required TResult Function(NameFormChanged value) nameFormChanged,
    required TResult Function(BornPlaceFormChanged value) bornPlaceFormChanged,
    required TResult Function(KnowUsFromChanged value) knowUsFromChanged,
    required TResult Function(BornDateFormChanged value) bornDateFormChanged,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(FromSubmitted value) formSubmitted,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditProfileInitialData value)? initial,
    TResult Function(NameFormChanged value)? nameFormChanged,
    TResult Function(BornPlaceFormChanged value)? bornPlaceFormChanged,
    TResult Function(KnowUsFromChanged value)? knowUsFromChanged,
    TResult Function(BornDateFormChanged value)? bornDateFormChanged,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(FromSubmitted value)? formSubmitted,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class EditProfileInitialData implements EditProfileEvent {
  const factory EditProfileInitialData(Map<dynamic, String> data) =
      _$EditProfileInitialData;

  Map<dynamic, String> get data => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EditProfileInitialDataCopyWith<EditProfileInitialData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NameFormChangedCopyWith<$Res> {
  factory $NameFormChangedCopyWith(
          NameFormChanged value, $Res Function(NameFormChanged) then) =
      _$NameFormChangedCopyWithImpl<$Res>;
  $Res call({String name});
}

/// @nodoc
class _$NameFormChangedCopyWithImpl<$Res>
    extends _$EditProfileEventCopyWithImpl<$Res>
    implements $NameFormChangedCopyWith<$Res> {
  _$NameFormChangedCopyWithImpl(
      NameFormChanged _value, $Res Function(NameFormChanged) _then)
      : super(_value, (v) => _then(v as NameFormChanged));

  @override
  NameFormChanged get _value => super._value as NameFormChanged;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(NameFormChanged(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NameFormChanged implements NameFormChanged {
  const _$NameFormChanged(this.name);

  @override
  final String name;

  @override
  String toString() {
    return 'EditProfileEvent.nameFormChanged(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NameFormChanged &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(name);

  @JsonKey(ignore: true)
  @override
  $NameFormChangedCopyWith<NameFormChanged> get copyWith =>
      _$NameFormChangedCopyWithImpl<NameFormChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<dynamic, String> data) initial,
    required TResult Function(String name) nameFormChanged,
    required TResult Function(String bornPlace) bornPlaceFormChanged,
    required TResult Function(String knowUsFrom) knowUsFromChanged,
    required TResult Function(DateTime bornDate) bornDateFormChanged,
    required TResult Function(File imagePath) imageChanged,
    required TResult Function(String phoneNumber, String password)
        formSubmitted,
  }) {
    return nameFormChanged(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<dynamic, String> data)? initial,
    TResult Function(String name)? nameFormChanged,
    TResult Function(String bornPlace)? bornPlaceFormChanged,
    TResult Function(String knowUsFrom)? knowUsFromChanged,
    TResult Function(DateTime bornDate)? bornDateFormChanged,
    TResult Function(File imagePath)? imageChanged,
    TResult Function(String phoneNumber, String password)? formSubmitted,
    required TResult orElse(),
  }) {
    if (nameFormChanged != null) {
      return nameFormChanged(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditProfileInitialData value) initial,
    required TResult Function(NameFormChanged value) nameFormChanged,
    required TResult Function(BornPlaceFormChanged value) bornPlaceFormChanged,
    required TResult Function(KnowUsFromChanged value) knowUsFromChanged,
    required TResult Function(BornDateFormChanged value) bornDateFormChanged,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(FromSubmitted value) formSubmitted,
  }) {
    return nameFormChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditProfileInitialData value)? initial,
    TResult Function(NameFormChanged value)? nameFormChanged,
    TResult Function(BornPlaceFormChanged value)? bornPlaceFormChanged,
    TResult Function(KnowUsFromChanged value)? knowUsFromChanged,
    TResult Function(BornDateFormChanged value)? bornDateFormChanged,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(FromSubmitted value)? formSubmitted,
    required TResult orElse(),
  }) {
    if (nameFormChanged != null) {
      return nameFormChanged(this);
    }
    return orElse();
  }
}

abstract class NameFormChanged implements EditProfileEvent {
  const factory NameFormChanged(String name) = _$NameFormChanged;

  String get name => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NameFormChangedCopyWith<NameFormChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BornPlaceFormChangedCopyWith<$Res> {
  factory $BornPlaceFormChangedCopyWith(BornPlaceFormChanged value,
          $Res Function(BornPlaceFormChanged) then) =
      _$BornPlaceFormChangedCopyWithImpl<$Res>;
  $Res call({String bornPlace});
}

/// @nodoc
class _$BornPlaceFormChangedCopyWithImpl<$Res>
    extends _$EditProfileEventCopyWithImpl<$Res>
    implements $BornPlaceFormChangedCopyWith<$Res> {
  _$BornPlaceFormChangedCopyWithImpl(
      BornPlaceFormChanged _value, $Res Function(BornPlaceFormChanged) _then)
      : super(_value, (v) => _then(v as BornPlaceFormChanged));

  @override
  BornPlaceFormChanged get _value => super._value as BornPlaceFormChanged;

  @override
  $Res call({
    Object? bornPlace = freezed,
  }) {
    return _then(BornPlaceFormChanged(
      bornPlace == freezed
          ? _value.bornPlace
          : bornPlace // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BornPlaceFormChanged implements BornPlaceFormChanged {
  const _$BornPlaceFormChanged(this.bornPlace);

  @override
  final String bornPlace;

  @override
  String toString() {
    return 'EditProfileEvent.bornPlaceFormChanged(bornPlace: $bornPlace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BornPlaceFormChanged &&
            (identical(other.bornPlace, bornPlace) ||
                const DeepCollectionEquality()
                    .equals(other.bornPlace, bornPlace)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(bornPlace);

  @JsonKey(ignore: true)
  @override
  $BornPlaceFormChangedCopyWith<BornPlaceFormChanged> get copyWith =>
      _$BornPlaceFormChangedCopyWithImpl<BornPlaceFormChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<dynamic, String> data) initial,
    required TResult Function(String name) nameFormChanged,
    required TResult Function(String bornPlace) bornPlaceFormChanged,
    required TResult Function(String knowUsFrom) knowUsFromChanged,
    required TResult Function(DateTime bornDate) bornDateFormChanged,
    required TResult Function(File imagePath) imageChanged,
    required TResult Function(String phoneNumber, String password)
        formSubmitted,
  }) {
    return bornPlaceFormChanged(bornPlace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<dynamic, String> data)? initial,
    TResult Function(String name)? nameFormChanged,
    TResult Function(String bornPlace)? bornPlaceFormChanged,
    TResult Function(String knowUsFrom)? knowUsFromChanged,
    TResult Function(DateTime bornDate)? bornDateFormChanged,
    TResult Function(File imagePath)? imageChanged,
    TResult Function(String phoneNumber, String password)? formSubmitted,
    required TResult orElse(),
  }) {
    if (bornPlaceFormChanged != null) {
      return bornPlaceFormChanged(bornPlace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditProfileInitialData value) initial,
    required TResult Function(NameFormChanged value) nameFormChanged,
    required TResult Function(BornPlaceFormChanged value) bornPlaceFormChanged,
    required TResult Function(KnowUsFromChanged value) knowUsFromChanged,
    required TResult Function(BornDateFormChanged value) bornDateFormChanged,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(FromSubmitted value) formSubmitted,
  }) {
    return bornPlaceFormChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditProfileInitialData value)? initial,
    TResult Function(NameFormChanged value)? nameFormChanged,
    TResult Function(BornPlaceFormChanged value)? bornPlaceFormChanged,
    TResult Function(KnowUsFromChanged value)? knowUsFromChanged,
    TResult Function(BornDateFormChanged value)? bornDateFormChanged,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(FromSubmitted value)? formSubmitted,
    required TResult orElse(),
  }) {
    if (bornPlaceFormChanged != null) {
      return bornPlaceFormChanged(this);
    }
    return orElse();
  }
}

abstract class BornPlaceFormChanged implements EditProfileEvent {
  const factory BornPlaceFormChanged(String bornPlace) = _$BornPlaceFormChanged;

  String get bornPlace => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BornPlaceFormChangedCopyWith<BornPlaceFormChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KnowUsFromChangedCopyWith<$Res> {
  factory $KnowUsFromChangedCopyWith(
          KnowUsFromChanged value, $Res Function(KnowUsFromChanged) then) =
      _$KnowUsFromChangedCopyWithImpl<$Res>;
  $Res call({String knowUsFrom});
}

/// @nodoc
class _$KnowUsFromChangedCopyWithImpl<$Res>
    extends _$EditProfileEventCopyWithImpl<$Res>
    implements $KnowUsFromChangedCopyWith<$Res> {
  _$KnowUsFromChangedCopyWithImpl(
      KnowUsFromChanged _value, $Res Function(KnowUsFromChanged) _then)
      : super(_value, (v) => _then(v as KnowUsFromChanged));

  @override
  KnowUsFromChanged get _value => super._value as KnowUsFromChanged;

  @override
  $Res call({
    Object? knowUsFrom = freezed,
  }) {
    return _then(KnowUsFromChanged(
      knowUsFrom == freezed
          ? _value.knowUsFrom
          : knowUsFrom // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$KnowUsFromChanged implements KnowUsFromChanged {
  const _$KnowUsFromChanged(this.knowUsFrom);

  @override
  final String knowUsFrom;

  @override
  String toString() {
    return 'EditProfileEvent.knowUsFromChanged(knowUsFrom: $knowUsFrom)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is KnowUsFromChanged &&
            (identical(other.knowUsFrom, knowUsFrom) ||
                const DeepCollectionEquality()
                    .equals(other.knowUsFrom, knowUsFrom)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(knowUsFrom);

  @JsonKey(ignore: true)
  @override
  $KnowUsFromChangedCopyWith<KnowUsFromChanged> get copyWith =>
      _$KnowUsFromChangedCopyWithImpl<KnowUsFromChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<dynamic, String> data) initial,
    required TResult Function(String name) nameFormChanged,
    required TResult Function(String bornPlace) bornPlaceFormChanged,
    required TResult Function(String knowUsFrom) knowUsFromChanged,
    required TResult Function(DateTime bornDate) bornDateFormChanged,
    required TResult Function(File imagePath) imageChanged,
    required TResult Function(String phoneNumber, String password)
        formSubmitted,
  }) {
    return knowUsFromChanged(knowUsFrom);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<dynamic, String> data)? initial,
    TResult Function(String name)? nameFormChanged,
    TResult Function(String bornPlace)? bornPlaceFormChanged,
    TResult Function(String knowUsFrom)? knowUsFromChanged,
    TResult Function(DateTime bornDate)? bornDateFormChanged,
    TResult Function(File imagePath)? imageChanged,
    TResult Function(String phoneNumber, String password)? formSubmitted,
    required TResult orElse(),
  }) {
    if (knowUsFromChanged != null) {
      return knowUsFromChanged(knowUsFrom);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditProfileInitialData value) initial,
    required TResult Function(NameFormChanged value) nameFormChanged,
    required TResult Function(BornPlaceFormChanged value) bornPlaceFormChanged,
    required TResult Function(KnowUsFromChanged value) knowUsFromChanged,
    required TResult Function(BornDateFormChanged value) bornDateFormChanged,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(FromSubmitted value) formSubmitted,
  }) {
    return knowUsFromChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditProfileInitialData value)? initial,
    TResult Function(NameFormChanged value)? nameFormChanged,
    TResult Function(BornPlaceFormChanged value)? bornPlaceFormChanged,
    TResult Function(KnowUsFromChanged value)? knowUsFromChanged,
    TResult Function(BornDateFormChanged value)? bornDateFormChanged,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(FromSubmitted value)? formSubmitted,
    required TResult orElse(),
  }) {
    if (knowUsFromChanged != null) {
      return knowUsFromChanged(this);
    }
    return orElse();
  }
}

abstract class KnowUsFromChanged implements EditProfileEvent {
  const factory KnowUsFromChanged(String knowUsFrom) = _$KnowUsFromChanged;

  String get knowUsFrom => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KnowUsFromChangedCopyWith<KnowUsFromChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BornDateFormChangedCopyWith<$Res> {
  factory $BornDateFormChangedCopyWith(
          BornDateFormChanged value, $Res Function(BornDateFormChanged) then) =
      _$BornDateFormChangedCopyWithImpl<$Res>;
  $Res call({DateTime bornDate});
}

/// @nodoc
class _$BornDateFormChangedCopyWithImpl<$Res>
    extends _$EditProfileEventCopyWithImpl<$Res>
    implements $BornDateFormChangedCopyWith<$Res> {
  _$BornDateFormChangedCopyWithImpl(
      BornDateFormChanged _value, $Res Function(BornDateFormChanged) _then)
      : super(_value, (v) => _then(v as BornDateFormChanged));

  @override
  BornDateFormChanged get _value => super._value as BornDateFormChanged;

  @override
  $Res call({
    Object? bornDate = freezed,
  }) {
    return _then(BornDateFormChanged(
      bornDate == freezed
          ? _value.bornDate
          : bornDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$BornDateFormChanged implements BornDateFormChanged {
  const _$BornDateFormChanged(this.bornDate);

  @override
  final DateTime bornDate;

  @override
  String toString() {
    return 'EditProfileEvent.bornDateFormChanged(bornDate: $bornDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BornDateFormChanged &&
            (identical(other.bornDate, bornDate) ||
                const DeepCollectionEquality()
                    .equals(other.bornDate, bornDate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(bornDate);

  @JsonKey(ignore: true)
  @override
  $BornDateFormChangedCopyWith<BornDateFormChanged> get copyWith =>
      _$BornDateFormChangedCopyWithImpl<BornDateFormChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<dynamic, String> data) initial,
    required TResult Function(String name) nameFormChanged,
    required TResult Function(String bornPlace) bornPlaceFormChanged,
    required TResult Function(String knowUsFrom) knowUsFromChanged,
    required TResult Function(DateTime bornDate) bornDateFormChanged,
    required TResult Function(File imagePath) imageChanged,
    required TResult Function(String phoneNumber, String password)
        formSubmitted,
  }) {
    return bornDateFormChanged(bornDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<dynamic, String> data)? initial,
    TResult Function(String name)? nameFormChanged,
    TResult Function(String bornPlace)? bornPlaceFormChanged,
    TResult Function(String knowUsFrom)? knowUsFromChanged,
    TResult Function(DateTime bornDate)? bornDateFormChanged,
    TResult Function(File imagePath)? imageChanged,
    TResult Function(String phoneNumber, String password)? formSubmitted,
    required TResult orElse(),
  }) {
    if (bornDateFormChanged != null) {
      return bornDateFormChanged(bornDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditProfileInitialData value) initial,
    required TResult Function(NameFormChanged value) nameFormChanged,
    required TResult Function(BornPlaceFormChanged value) bornPlaceFormChanged,
    required TResult Function(KnowUsFromChanged value) knowUsFromChanged,
    required TResult Function(BornDateFormChanged value) bornDateFormChanged,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(FromSubmitted value) formSubmitted,
  }) {
    return bornDateFormChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditProfileInitialData value)? initial,
    TResult Function(NameFormChanged value)? nameFormChanged,
    TResult Function(BornPlaceFormChanged value)? bornPlaceFormChanged,
    TResult Function(KnowUsFromChanged value)? knowUsFromChanged,
    TResult Function(BornDateFormChanged value)? bornDateFormChanged,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(FromSubmitted value)? formSubmitted,
    required TResult orElse(),
  }) {
    if (bornDateFormChanged != null) {
      return bornDateFormChanged(this);
    }
    return orElse();
  }
}

abstract class BornDateFormChanged implements EditProfileEvent {
  const factory BornDateFormChanged(DateTime bornDate) = _$BornDateFormChanged;

  DateTime get bornDate => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BornDateFormChangedCopyWith<BornDateFormChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageChangedCopyWith<$Res> {
  factory $ImageChangedCopyWith(
          ImageChanged value, $Res Function(ImageChanged) then) =
      _$ImageChangedCopyWithImpl<$Res>;
  $Res call({File imagePath});
}

/// @nodoc
class _$ImageChangedCopyWithImpl<$Res>
    extends _$EditProfileEventCopyWithImpl<$Res>
    implements $ImageChangedCopyWith<$Res> {
  _$ImageChangedCopyWithImpl(
      ImageChanged _value, $Res Function(ImageChanged) _then)
      : super(_value, (v) => _then(v as ImageChanged));

  @override
  ImageChanged get _value => super._value as ImageChanged;

  @override
  $Res call({
    Object? imagePath = freezed,
  }) {
    return _then(ImageChanged(
      imagePath == freezed
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as File,
    ));
  }
}

/// @nodoc

class _$ImageChanged implements ImageChanged {
  const _$ImageChanged(this.imagePath);

  @override
  final File imagePath;

  @override
  String toString() {
    return 'EditProfileEvent.imageChanged(imagePath: $imagePath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ImageChanged &&
            (identical(other.imagePath, imagePath) ||
                const DeepCollectionEquality()
                    .equals(other.imagePath, imagePath)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(imagePath);

  @JsonKey(ignore: true)
  @override
  $ImageChangedCopyWith<ImageChanged> get copyWith =>
      _$ImageChangedCopyWithImpl<ImageChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<dynamic, String> data) initial,
    required TResult Function(String name) nameFormChanged,
    required TResult Function(String bornPlace) bornPlaceFormChanged,
    required TResult Function(String knowUsFrom) knowUsFromChanged,
    required TResult Function(DateTime bornDate) bornDateFormChanged,
    required TResult Function(File imagePath) imageChanged,
    required TResult Function(String phoneNumber, String password)
        formSubmitted,
  }) {
    return imageChanged(imagePath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<dynamic, String> data)? initial,
    TResult Function(String name)? nameFormChanged,
    TResult Function(String bornPlace)? bornPlaceFormChanged,
    TResult Function(String knowUsFrom)? knowUsFromChanged,
    TResult Function(DateTime bornDate)? bornDateFormChanged,
    TResult Function(File imagePath)? imageChanged,
    TResult Function(String phoneNumber, String password)? formSubmitted,
    required TResult orElse(),
  }) {
    if (imageChanged != null) {
      return imageChanged(imagePath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditProfileInitialData value) initial,
    required TResult Function(NameFormChanged value) nameFormChanged,
    required TResult Function(BornPlaceFormChanged value) bornPlaceFormChanged,
    required TResult Function(KnowUsFromChanged value) knowUsFromChanged,
    required TResult Function(BornDateFormChanged value) bornDateFormChanged,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(FromSubmitted value) formSubmitted,
  }) {
    return imageChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditProfileInitialData value)? initial,
    TResult Function(NameFormChanged value)? nameFormChanged,
    TResult Function(BornPlaceFormChanged value)? bornPlaceFormChanged,
    TResult Function(KnowUsFromChanged value)? knowUsFromChanged,
    TResult Function(BornDateFormChanged value)? bornDateFormChanged,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(FromSubmitted value)? formSubmitted,
    required TResult orElse(),
  }) {
    if (imageChanged != null) {
      return imageChanged(this);
    }
    return orElse();
  }
}

abstract class ImageChanged implements EditProfileEvent {
  const factory ImageChanged(File imagePath) = _$ImageChanged;

  File get imagePath => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageChangedCopyWith<ImageChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FromSubmittedCopyWith<$Res> {
  factory $FromSubmittedCopyWith(
          FromSubmitted value, $Res Function(FromSubmitted) then) =
      _$FromSubmittedCopyWithImpl<$Res>;
  $Res call({String phoneNumber, String password});
}

/// @nodoc
class _$FromSubmittedCopyWithImpl<$Res>
    extends _$EditProfileEventCopyWithImpl<$Res>
    implements $FromSubmittedCopyWith<$Res> {
  _$FromSubmittedCopyWithImpl(
      FromSubmitted _value, $Res Function(FromSubmitted) _then)
      : super(_value, (v) => _then(v as FromSubmitted));

  @override
  FromSubmitted get _value => super._value as FromSubmitted;

  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? password = freezed,
  }) {
    return _then(FromSubmitted(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FromSubmitted implements FromSubmitted {
  const _$FromSubmitted({required this.phoneNumber, required this.password});

  @override
  final String phoneNumber;
  @override
  final String password;

  @override
  String toString() {
    return 'EditProfileEvent.formSubmitted(phoneNumber: $phoneNumber, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FromSubmitted &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(password);

  @JsonKey(ignore: true)
  @override
  $FromSubmittedCopyWith<FromSubmitted> get copyWith =>
      _$FromSubmittedCopyWithImpl<FromSubmitted>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<dynamic, String> data) initial,
    required TResult Function(String name) nameFormChanged,
    required TResult Function(String bornPlace) bornPlaceFormChanged,
    required TResult Function(String knowUsFrom) knowUsFromChanged,
    required TResult Function(DateTime bornDate) bornDateFormChanged,
    required TResult Function(File imagePath) imageChanged,
    required TResult Function(String phoneNumber, String password)
        formSubmitted,
  }) {
    return formSubmitted(phoneNumber, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<dynamic, String> data)? initial,
    TResult Function(String name)? nameFormChanged,
    TResult Function(String bornPlace)? bornPlaceFormChanged,
    TResult Function(String knowUsFrom)? knowUsFromChanged,
    TResult Function(DateTime bornDate)? bornDateFormChanged,
    TResult Function(File imagePath)? imageChanged,
    TResult Function(String phoneNumber, String password)? formSubmitted,
    required TResult orElse(),
  }) {
    if (formSubmitted != null) {
      return formSubmitted(phoneNumber, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditProfileInitialData value) initial,
    required TResult Function(NameFormChanged value) nameFormChanged,
    required TResult Function(BornPlaceFormChanged value) bornPlaceFormChanged,
    required TResult Function(KnowUsFromChanged value) knowUsFromChanged,
    required TResult Function(BornDateFormChanged value) bornDateFormChanged,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(FromSubmitted value) formSubmitted,
  }) {
    return formSubmitted(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditProfileInitialData value)? initial,
    TResult Function(NameFormChanged value)? nameFormChanged,
    TResult Function(BornPlaceFormChanged value)? bornPlaceFormChanged,
    TResult Function(KnowUsFromChanged value)? knowUsFromChanged,
    TResult Function(BornDateFormChanged value)? bornDateFormChanged,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(FromSubmitted value)? formSubmitted,
    required TResult orElse(),
  }) {
    if (formSubmitted != null) {
      return formSubmitted(this);
    }
    return orElse();
  }
}

abstract class FromSubmitted implements EditProfileEvent {
  const factory FromSubmitted(
      {required String phoneNumber,
      required String password}) = _$FromSubmitted;

  String get phoneNumber => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FromSubmittedCopyWith<FromSubmitted> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$EditProfileStateTearOff {
  const _$EditProfileStateTearOff();

  _EditProfileState call(
      {required String name,
      required String bornPlace,
      required DateTime bornDate,
      required String knowUsFrom,
      required bool showErrorMessages,
      File? imagePath,
      required FormSubmissionStatus formStatus}) {
    return _EditProfileState(
      name: name,
      bornPlace: bornPlace,
      bornDate: bornDate,
      knowUsFrom: knowUsFrom,
      showErrorMessages: showErrorMessages,
      imagePath: imagePath,
      formStatus: formStatus,
    );
  }
}

/// @nodoc
const $EditProfileState = _$EditProfileStateTearOff();

/// @nodoc
mixin _$EditProfileState {
  String get name => throw _privateConstructorUsedError;
  String get bornPlace => throw _privateConstructorUsedError;
  DateTime get bornDate => throw _privateConstructorUsedError;
  String get knowUsFrom => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  File? get imagePath => throw _privateConstructorUsedError;
  FormSubmissionStatus get formStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditProfileStateCopyWith<EditProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProfileStateCopyWith<$Res> {
  factory $EditProfileStateCopyWith(
          EditProfileState value, $Res Function(EditProfileState) then) =
      _$EditProfileStateCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String bornPlace,
      DateTime bornDate,
      String knowUsFrom,
      bool showErrorMessages,
      File? imagePath,
      FormSubmissionStatus formStatus});
}

/// @nodoc
class _$EditProfileStateCopyWithImpl<$Res>
    implements $EditProfileStateCopyWith<$Res> {
  _$EditProfileStateCopyWithImpl(this._value, this._then);

  final EditProfileState _value;
  // ignore: unused_field
  final $Res Function(EditProfileState) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? bornPlace = freezed,
    Object? bornDate = freezed,
    Object? knowUsFrom = freezed,
    Object? showErrorMessages = freezed,
    Object? imagePath = freezed,
    Object? formStatus = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      bornPlace: bornPlace == freezed
          ? _value.bornPlace
          : bornPlace // ignore: cast_nullable_to_non_nullable
              as String,
      bornDate: bornDate == freezed
          ? _value.bornDate
          : bornDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      knowUsFrom: knowUsFrom == freezed
          ? _value.knowUsFrom
          : knowUsFrom // ignore: cast_nullable_to_non_nullable
              as String,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      imagePath: imagePath == freezed
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as File?,
      formStatus: formStatus == freezed
          ? _value.formStatus
          : formStatus // ignore: cast_nullable_to_non_nullable
              as FormSubmissionStatus,
    ));
  }
}

/// @nodoc
abstract class _$EditProfileStateCopyWith<$Res>
    implements $EditProfileStateCopyWith<$Res> {
  factory _$EditProfileStateCopyWith(
          _EditProfileState value, $Res Function(_EditProfileState) then) =
      __$EditProfileStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String bornPlace,
      DateTime bornDate,
      String knowUsFrom,
      bool showErrorMessages,
      File? imagePath,
      FormSubmissionStatus formStatus});
}

/// @nodoc
class __$EditProfileStateCopyWithImpl<$Res>
    extends _$EditProfileStateCopyWithImpl<$Res>
    implements _$EditProfileStateCopyWith<$Res> {
  __$EditProfileStateCopyWithImpl(
      _EditProfileState _value, $Res Function(_EditProfileState) _then)
      : super(_value, (v) => _then(v as _EditProfileState));

  @override
  _EditProfileState get _value => super._value as _EditProfileState;

  @override
  $Res call({
    Object? name = freezed,
    Object? bornPlace = freezed,
    Object? bornDate = freezed,
    Object? knowUsFrom = freezed,
    Object? showErrorMessages = freezed,
    Object? imagePath = freezed,
    Object? formStatus = freezed,
  }) {
    return _then(_EditProfileState(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      bornPlace: bornPlace == freezed
          ? _value.bornPlace
          : bornPlace // ignore: cast_nullable_to_non_nullable
              as String,
      bornDate: bornDate == freezed
          ? _value.bornDate
          : bornDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      knowUsFrom: knowUsFrom == freezed
          ? _value.knowUsFrom
          : knowUsFrom // ignore: cast_nullable_to_non_nullable
              as String,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      imagePath: imagePath == freezed
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as File?,
      formStatus: formStatus == freezed
          ? _value.formStatus
          : formStatus // ignore: cast_nullable_to_non_nullable
              as FormSubmissionStatus,
    ));
  }
}

/// @nodoc

class _$_EditProfileState extends _EditProfileState {
  const _$_EditProfileState(
      {required this.name,
      required this.bornPlace,
      required this.bornDate,
      required this.knowUsFrom,
      required this.showErrorMessages,
      this.imagePath,
      required this.formStatus})
      : super._();

  @override
  final String name;
  @override
  final String bornPlace;
  @override
  final DateTime bornDate;
  @override
  final String knowUsFrom;
  @override
  final bool showErrorMessages;
  @override
  final File? imagePath;
  @override
  final FormSubmissionStatus formStatus;

  @override
  String toString() {
    return 'EditProfileState(name: $name, bornPlace: $bornPlace, bornDate: $bornDate, knowUsFrom: $knowUsFrom, showErrorMessages: $showErrorMessages, imagePath: $imagePath, formStatus: $formStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EditProfileState &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.bornPlace, bornPlace) ||
                const DeepCollectionEquality()
                    .equals(other.bornPlace, bornPlace)) &&
            (identical(other.bornDate, bornDate) ||
                const DeepCollectionEquality()
                    .equals(other.bornDate, bornDate)) &&
            (identical(other.knowUsFrom, knowUsFrom) ||
                const DeepCollectionEquality()
                    .equals(other.knowUsFrom, knowUsFrom)) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                const DeepCollectionEquality()
                    .equals(other.showErrorMessages, showErrorMessages)) &&
            (identical(other.imagePath, imagePath) ||
                const DeepCollectionEquality()
                    .equals(other.imagePath, imagePath)) &&
            (identical(other.formStatus, formStatus) ||
                const DeepCollectionEquality()
                    .equals(other.formStatus, formStatus)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(bornPlace) ^
      const DeepCollectionEquality().hash(bornDate) ^
      const DeepCollectionEquality().hash(knowUsFrom) ^
      const DeepCollectionEquality().hash(showErrorMessages) ^
      const DeepCollectionEquality().hash(imagePath) ^
      const DeepCollectionEquality().hash(formStatus);

  @JsonKey(ignore: true)
  @override
  _$EditProfileStateCopyWith<_EditProfileState> get copyWith =>
      __$EditProfileStateCopyWithImpl<_EditProfileState>(this, _$identity);
}

abstract class _EditProfileState extends EditProfileState {
  const factory _EditProfileState(
      {required String name,
      required String bornPlace,
      required DateTime bornDate,
      required String knowUsFrom,
      required bool showErrorMessages,
      File? imagePath,
      required FormSubmissionStatus formStatus}) = _$_EditProfileState;
  const _EditProfileState._() : super._();

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get bornPlace => throw _privateConstructorUsedError;
  @override
  DateTime get bornDate => throw _privateConstructorUsedError;
  @override
  String get knowUsFrom => throw _privateConstructorUsedError;
  @override
  bool get showErrorMessages => throw _privateConstructorUsedError;
  @override
  File? get imagePath => throw _privateConstructorUsedError;
  @override
  FormSubmissionStatus get formStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$EditProfileStateCopyWith<_EditProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}
