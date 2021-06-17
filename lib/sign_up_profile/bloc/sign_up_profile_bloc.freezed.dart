// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'sign_up_profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SignUpProfileEventTearOff {
  const _$SignUpProfileEventTearOff();

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
const $SignUpProfileEvent = _$SignUpProfileEventTearOff();

/// @nodoc
mixin _$SignUpProfileEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
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
abstract class $SignUpProfileEventCopyWith<$Res> {
  factory $SignUpProfileEventCopyWith(
          SignUpProfileEvent value, $Res Function(SignUpProfileEvent) then) =
      _$SignUpProfileEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignUpProfileEventCopyWithImpl<$Res>
    implements $SignUpProfileEventCopyWith<$Res> {
  _$SignUpProfileEventCopyWithImpl(this._value, this._then);

  final SignUpProfileEvent _value;
  // ignore: unused_field
  final $Res Function(SignUpProfileEvent) _then;
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
    extends _$SignUpProfileEventCopyWithImpl<$Res>
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
    return 'SignUpProfileEvent.nameFormChanged(name: $name)';
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

abstract class NameFormChanged implements SignUpProfileEvent {
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
    extends _$SignUpProfileEventCopyWithImpl<$Res>
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
    return 'SignUpProfileEvent.bornPlaceFormChanged(bornPlace: $bornPlace)';
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

abstract class BornPlaceFormChanged implements SignUpProfileEvent {
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
    extends _$SignUpProfileEventCopyWithImpl<$Res>
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
    return 'SignUpProfileEvent.knowUsFromChanged(knowUsFrom: $knowUsFrom)';
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

abstract class KnowUsFromChanged implements SignUpProfileEvent {
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
    extends _$SignUpProfileEventCopyWithImpl<$Res>
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
    return 'SignUpProfileEvent.bornDateFormChanged(bornDate: $bornDate)';
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

abstract class BornDateFormChanged implements SignUpProfileEvent {
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
    extends _$SignUpProfileEventCopyWithImpl<$Res>
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
    return 'SignUpProfileEvent.imageChanged(imagePath: $imagePath)';
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

abstract class ImageChanged implements SignUpProfileEvent {
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
    extends _$SignUpProfileEventCopyWithImpl<$Res>
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
    return 'SignUpProfileEvent.formSubmitted(phoneNumber: $phoneNumber, password: $password)';
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

abstract class FromSubmitted implements SignUpProfileEvent {
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
class _$SignUpProfileStateTearOff {
  const _$SignUpProfileStateTearOff();

  _SignUpProfileState call(
      {required String name,
      required String bornPlace,
      required DateTime bornDate,
      required String knowUsFrom,
      required bool showErrorMessages,
      File? imagePath,
      required FormSubmissionStatus formStatus}) {
    return _SignUpProfileState(
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
const $SignUpProfileState = _$SignUpProfileStateTearOff();

/// @nodoc
mixin _$SignUpProfileState {
  String get name => throw _privateConstructorUsedError;
  String get bornPlace => throw _privateConstructorUsedError;
  DateTime get bornDate => throw _privateConstructorUsedError;
  String get knowUsFrom => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  File? get imagePath => throw _privateConstructorUsedError;
  FormSubmissionStatus get formStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignUpProfileStateCopyWith<SignUpProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpProfileStateCopyWith<$Res> {
  factory $SignUpProfileStateCopyWith(
          SignUpProfileState value, $Res Function(SignUpProfileState) then) =
      _$SignUpProfileStateCopyWithImpl<$Res>;
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
class _$SignUpProfileStateCopyWithImpl<$Res>
    implements $SignUpProfileStateCopyWith<$Res> {
  _$SignUpProfileStateCopyWithImpl(this._value, this._then);

  final SignUpProfileState _value;
  // ignore: unused_field
  final $Res Function(SignUpProfileState) _then;

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
abstract class _$SignUpProfileStateCopyWith<$Res>
    implements $SignUpProfileStateCopyWith<$Res> {
  factory _$SignUpProfileStateCopyWith(
          _SignUpProfileState value, $Res Function(_SignUpProfileState) then) =
      __$SignUpProfileStateCopyWithImpl<$Res>;
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
class __$SignUpProfileStateCopyWithImpl<$Res>
    extends _$SignUpProfileStateCopyWithImpl<$Res>
    implements _$SignUpProfileStateCopyWith<$Res> {
  __$SignUpProfileStateCopyWithImpl(
      _SignUpProfileState _value, $Res Function(_SignUpProfileState) _then)
      : super(_value, (v) => _then(v as _SignUpProfileState));

  @override
  _SignUpProfileState get _value => super._value as _SignUpProfileState;

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
    return _then(_SignUpProfileState(
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

class _$_SignUpProfileState extends _SignUpProfileState {
  const _$_SignUpProfileState(
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
    return 'SignUpProfileState(name: $name, bornPlace: $bornPlace, bornDate: $bornDate, knowUsFrom: $knowUsFrom, showErrorMessages: $showErrorMessages, imagePath: $imagePath, formStatus: $formStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SignUpProfileState &&
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
  _$SignUpProfileStateCopyWith<_SignUpProfileState> get copyWith =>
      __$SignUpProfileStateCopyWithImpl<_SignUpProfileState>(this, _$identity);
}

abstract class _SignUpProfileState extends SignUpProfileState {
  const factory _SignUpProfileState(
      {required String name,
      required String bornPlace,
      required DateTime bornDate,
      required String knowUsFrom,
      required bool showErrorMessages,
      File? imagePath,
      required FormSubmissionStatus formStatus}) = _$_SignUpProfileState;
  const _SignUpProfileState._() : super._();

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
  _$SignUpProfileStateCopyWith<_SignUpProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}
