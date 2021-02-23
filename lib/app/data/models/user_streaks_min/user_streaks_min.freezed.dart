// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user_streaks_min.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$UserStreakMinTearOff {
  const _$UserStreakMinTearOff();

// ignore: unused_element
  _UserStreakMin call(
      {@required String userEmail, int racha, String username, String image}) {
    return _UserStreakMin(
      userEmail: userEmail,
      racha: racha,
      username: username,
      image: image,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $UserStreakMin = _$UserStreakMinTearOff();

/// @nodoc
mixin _$UserStreakMin {
  String get userEmail;
  int get racha;
  String get username;
  String get image;

  $UserStreakMinCopyWith<UserStreakMin> get copyWith;
}

/// @nodoc
abstract class $UserStreakMinCopyWith<$Res> {
  factory $UserStreakMinCopyWith(
          UserStreakMin value, $Res Function(UserStreakMin) then) =
      _$UserStreakMinCopyWithImpl<$Res>;
  $Res call({String userEmail, int racha, String username, String image});
}

/// @nodoc
class _$UserStreakMinCopyWithImpl<$Res>
    implements $UserStreakMinCopyWith<$Res> {
  _$UserStreakMinCopyWithImpl(this._value, this._then);

  final UserStreakMin _value;
  // ignore: unused_field
  final $Res Function(UserStreakMin) _then;

  @override
  $Res call({
    Object userEmail = freezed,
    Object racha = freezed,
    Object username = freezed,
    Object image = freezed,
  }) {
    return _then(_value.copyWith(
      userEmail: userEmail == freezed ? _value.userEmail : userEmail as String,
      racha: racha == freezed ? _value.racha : racha as int,
      username: username == freezed ? _value.username : username as String,
      image: image == freezed ? _value.image : image as String,
    ));
  }
}

/// @nodoc
abstract class _$UserStreakMinCopyWith<$Res>
    implements $UserStreakMinCopyWith<$Res> {
  factory _$UserStreakMinCopyWith(
          _UserStreakMin value, $Res Function(_UserStreakMin) then) =
      __$UserStreakMinCopyWithImpl<$Res>;
  @override
  $Res call({String userEmail, int racha, String username, String image});
}

/// @nodoc
class __$UserStreakMinCopyWithImpl<$Res>
    extends _$UserStreakMinCopyWithImpl<$Res>
    implements _$UserStreakMinCopyWith<$Res> {
  __$UserStreakMinCopyWithImpl(
      _UserStreakMin _value, $Res Function(_UserStreakMin) _then)
      : super(_value, (v) => _then(v as _UserStreakMin));

  @override
  _UserStreakMin get _value => super._value as _UserStreakMin;

  @override
  $Res call({
    Object userEmail = freezed,
    Object racha = freezed,
    Object username = freezed,
    Object image = freezed,
  }) {
    return _then(_UserStreakMin(
      userEmail: userEmail == freezed ? _value.userEmail : userEmail as String,
      racha: racha == freezed ? _value.racha : racha as int,
      username: username == freezed ? _value.username : username as String,
      image: image == freezed ? _value.image : image as String,
    ));
  }
}

/// @nodoc
class _$_UserStreakMin extends _UserStreakMin {
  const _$_UserStreakMin(
      {@required this.userEmail, this.racha, this.username, this.image})
      : assert(userEmail != null),
        super._();

  @override
  final String userEmail;
  @override
  final int racha;
  @override
  final String username;
  @override
  final String image;

  @override
  String toString() {
    return 'UserStreakMin(userEmail: $userEmail, racha: $racha, username: $username, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserStreakMin &&
            (identical(other.userEmail, userEmail) ||
                const DeepCollectionEquality()
                    .equals(other.userEmail, userEmail)) &&
            (identical(other.racha, racha) ||
                const DeepCollectionEquality().equals(other.racha, racha)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userEmail) ^
      const DeepCollectionEquality().hash(racha) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(image);

  @override
  _$UserStreakMinCopyWith<_UserStreakMin> get copyWith =>
      __$UserStreakMinCopyWithImpl<_UserStreakMin>(this, _$identity);
}

abstract class _UserStreakMin extends UserStreakMin {
  const _UserStreakMin._() : super._();
  const factory _UserStreakMin(
      {@required String userEmail,
      int racha,
      String username,
      String image}) = _$_UserStreakMin;

  @override
  String get userEmail;
  @override
  int get racha;
  @override
  String get username;
  @override
  String get image;
  @override
  _$UserStreakMinCopyWith<_UserStreakMin> get copyWith;
}
