// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user_min.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$UserMinTearOff {
  const _$UserMinTearOff();

// ignore: unused_element
  _UserMin call(
      {@required String email,
      @required String username,
      int racha,
      String image}) {
    return _UserMin(
      email: email,
      username: username,
      racha: racha,
      image: image,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $UserMin = _$UserMinTearOff();

/// @nodoc
mixin _$UserMin {
  String get email;
  String get username;
  int get racha;
  String get image;

  $UserMinCopyWith<UserMin> get copyWith;
}

/// @nodoc
abstract class $UserMinCopyWith<$Res> {
  factory $UserMinCopyWith(UserMin value, $Res Function(UserMin) then) =
      _$UserMinCopyWithImpl<$Res>;
  $Res call({String email, String username, int racha, String image});
}

/// @nodoc
class _$UserMinCopyWithImpl<$Res> implements $UserMinCopyWith<$Res> {
  _$UserMinCopyWithImpl(this._value, this._then);

  final UserMin _value;
  // ignore: unused_field
  final $Res Function(UserMin) _then;

  @override
  $Res call({
    Object email = freezed,
    Object username = freezed,
    Object racha = freezed,
    Object image = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed ? _value.email : email as String,
      username: username == freezed ? _value.username : username as String,
      racha: racha == freezed ? _value.racha : racha as int,
      image: image == freezed ? _value.image : image as String,
    ));
  }
}

/// @nodoc
abstract class _$UserMinCopyWith<$Res> implements $UserMinCopyWith<$Res> {
  factory _$UserMinCopyWith(_UserMin value, $Res Function(_UserMin) then) =
      __$UserMinCopyWithImpl<$Res>;
  @override
  $Res call({String email, String username, int racha, String image});
}

/// @nodoc
class __$UserMinCopyWithImpl<$Res> extends _$UserMinCopyWithImpl<$Res>
    implements _$UserMinCopyWith<$Res> {
  __$UserMinCopyWithImpl(_UserMin _value, $Res Function(_UserMin) _then)
      : super(_value, (v) => _then(v as _UserMin));

  @override
  _UserMin get _value => super._value as _UserMin;

  @override
  $Res call({
    Object email = freezed,
    Object username = freezed,
    Object racha = freezed,
    Object image = freezed,
  }) {
    return _then(_UserMin(
      email: email == freezed ? _value.email : email as String,
      username: username == freezed ? _value.username : username as String,
      racha: racha == freezed ? _value.racha : racha as int,
      image: image == freezed ? _value.image : image as String,
    ));
  }
}

/// @nodoc
class _$_UserMin extends _UserMin {
  const _$_UserMin(
      {@required this.email, @required this.username, this.racha, this.image})
      : assert(email != null),
        assert(username != null),
        super._();

  @override
  final String email;
  @override
  final String username;
  @override
  final int racha;
  @override
  final String image;

  @override
  String toString() {
    return 'UserMin(email: $email, username: $username, racha: $racha, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserMin &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.racha, racha) ||
                const DeepCollectionEquality().equals(other.racha, racha)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(racha) ^
      const DeepCollectionEquality().hash(image);

  @override
  _$UserMinCopyWith<_UserMin> get copyWith =>
      __$UserMinCopyWithImpl<_UserMin>(this, _$identity);
}

abstract class _UserMin extends UserMin {
  const _UserMin._() : super._();
  const factory _UserMin(
      {@required String email,
      @required String username,
      int racha,
      String image}) = _$_UserMin;

  @override
  String get email;
  @override
  String get username;
  @override
  int get racha;
  @override
  String get image;
  @override
  _$UserMinCopyWith<_UserMin> get copyWith;
}
