// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user_streaks.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
UserStreaks _$UserStreaksFromJson(Map<String, dynamic> json) {
  return _UserStreaks.fromJson(json);
}

/// @nodoc
class _$UserStreaksTearOff {
  const _$UserStreaksTearOff();

// ignore: unused_element
  _UserStreaks call(
      {@required String id,
      @required String userEmail,
      String timeRange,
      String type,
      int streakPositive,
      int streakNegative,
      DateTime createdDate,
      DateTime updatedDate}) {
    return _UserStreaks(
      id: id,
      userEmail: userEmail,
      timeRange: timeRange,
      type: type,
      streakPositive: streakPositive,
      streakNegative: streakNegative,
      createdDate: createdDate,
      updatedDate: updatedDate,
    );
  }

// ignore: unused_element
  UserStreaks fromJson(Map<String, Object> json) {
    return UserStreaks.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $UserStreaks = _$UserStreaksTearOff();

/// @nodoc
mixin _$UserStreaks {
  String get id;
  String get userEmail;
  String get timeRange;
  String get type;
  int get streakPositive;
  int get streakNegative;
  DateTime get createdDate;
  DateTime get updatedDate;

  Map<String, dynamic> toJson();
  $UserStreaksCopyWith<UserStreaks> get copyWith;
}

/// @nodoc
abstract class $UserStreaksCopyWith<$Res> {
  factory $UserStreaksCopyWith(
          UserStreaks value, $Res Function(UserStreaks) then) =
      _$UserStreaksCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String userEmail,
      String timeRange,
      String type,
      int streakPositive,
      int streakNegative,
      DateTime createdDate,
      DateTime updatedDate});
}

/// @nodoc
class _$UserStreaksCopyWithImpl<$Res> implements $UserStreaksCopyWith<$Res> {
  _$UserStreaksCopyWithImpl(this._value, this._then);

  final UserStreaks _value;
  // ignore: unused_field
  final $Res Function(UserStreaks) _then;

  @override
  $Res call({
    Object id = freezed,
    Object userEmail = freezed,
    Object timeRange = freezed,
    Object type = freezed,
    Object streakPositive = freezed,
    Object streakNegative = freezed,
    Object createdDate = freezed,
    Object updatedDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      userEmail: userEmail == freezed ? _value.userEmail : userEmail as String,
      timeRange: timeRange == freezed ? _value.timeRange : timeRange as String,
      type: type == freezed ? _value.type : type as String,
      streakPositive: streakPositive == freezed
          ? _value.streakPositive
          : streakPositive as int,
      streakNegative: streakNegative == freezed
          ? _value.streakNegative
          : streakNegative as int,
      createdDate:
          createdDate == freezed ? _value.createdDate : createdDate as DateTime,
      updatedDate:
          updatedDate == freezed ? _value.updatedDate : updatedDate as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$UserStreaksCopyWith<$Res>
    implements $UserStreaksCopyWith<$Res> {
  factory _$UserStreaksCopyWith(
          _UserStreaks value, $Res Function(_UserStreaks) then) =
      __$UserStreaksCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String userEmail,
      String timeRange,
      String type,
      int streakPositive,
      int streakNegative,
      DateTime createdDate,
      DateTime updatedDate});
}

/// @nodoc
class __$UserStreaksCopyWithImpl<$Res> extends _$UserStreaksCopyWithImpl<$Res>
    implements _$UserStreaksCopyWith<$Res> {
  __$UserStreaksCopyWithImpl(
      _UserStreaks _value, $Res Function(_UserStreaks) _then)
      : super(_value, (v) => _then(v as _UserStreaks));

  @override
  _UserStreaks get _value => super._value as _UserStreaks;

  @override
  $Res call({
    Object id = freezed,
    Object userEmail = freezed,
    Object timeRange = freezed,
    Object type = freezed,
    Object streakPositive = freezed,
    Object streakNegative = freezed,
    Object createdDate = freezed,
    Object updatedDate = freezed,
  }) {
    return _then(_UserStreaks(
      id: id == freezed ? _value.id : id as String,
      userEmail: userEmail == freezed ? _value.userEmail : userEmail as String,
      timeRange: timeRange == freezed ? _value.timeRange : timeRange as String,
      type: type == freezed ? _value.type : type as String,
      streakPositive: streakPositive == freezed
          ? _value.streakPositive
          : streakPositive as int,
      streakNegative: streakNegative == freezed
          ? _value.streakNegative
          : streakNegative as int,
      createdDate:
          createdDate == freezed ? _value.createdDate : createdDate as DateTime,
      updatedDate:
          updatedDate == freezed ? _value.updatedDate : updatedDate as DateTime,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_UserStreaks extends _UserStreaks {
  const _$_UserStreaks(
      {@required this.id,
      @required this.userEmail,
      this.timeRange,
      this.type,
      this.streakPositive,
      this.streakNegative,
      this.createdDate,
      this.updatedDate})
      : assert(id != null),
        assert(userEmail != null),
        super._();

  factory _$_UserStreaks.fromJson(Map<String, dynamic> json) =>
      _$_$_UserStreaksFromJson(json);

  @override
  final String id;
  @override
  final String userEmail;
  @override
  final String timeRange;
  @override
  final String type;
  @override
  final int streakPositive;
  @override
  final int streakNegative;
  @override
  final DateTime createdDate;
  @override
  final DateTime updatedDate;

  @override
  String toString() {
    return 'UserStreaks(id: $id, userEmail: $userEmail, timeRange: $timeRange, type: $type, streakPositive: $streakPositive, streakNegative: $streakNegative, createdDate: $createdDate, updatedDate: $updatedDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserStreaks &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.userEmail, userEmail) ||
                const DeepCollectionEquality()
                    .equals(other.userEmail, userEmail)) &&
            (identical(other.timeRange, timeRange) ||
                const DeepCollectionEquality()
                    .equals(other.timeRange, timeRange)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.streakPositive, streakPositive) ||
                const DeepCollectionEquality()
                    .equals(other.streakPositive, streakPositive)) &&
            (identical(other.streakNegative, streakNegative) ||
                const DeepCollectionEquality()
                    .equals(other.streakNegative, streakNegative)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.updatedDate, updatedDate) ||
                const DeepCollectionEquality()
                    .equals(other.updatedDate, updatedDate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(userEmail) ^
      const DeepCollectionEquality().hash(timeRange) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(streakPositive) ^
      const DeepCollectionEquality().hash(streakNegative) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(updatedDate);

  @override
  _$UserStreaksCopyWith<_UserStreaks> get copyWith =>
      __$UserStreaksCopyWithImpl<_UserStreaks>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserStreaksToJson(this);
  }
}

abstract class _UserStreaks extends UserStreaks {
  const _UserStreaks._() : super._();
  const factory _UserStreaks(
      {@required String id,
      @required String userEmail,
      String timeRange,
      String type,
      int streakPositive,
      int streakNegative,
      DateTime createdDate,
      DateTime updatedDate}) = _$_UserStreaks;

  factory _UserStreaks.fromJson(Map<String, dynamic> json) =
      _$_UserStreaks.fromJson;

  @override
  String get id;
  @override
  String get userEmail;
  @override
  String get timeRange;
  @override
  String get type;
  @override
  int get streakPositive;
  @override
  int get streakNegative;
  @override
  DateTime get createdDate;
  @override
  DateTime get updatedDate;
  @override
  _$UserStreaksCopyWith<_UserStreaks> get copyWith;
}
