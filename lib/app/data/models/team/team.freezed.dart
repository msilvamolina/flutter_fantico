// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'team.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Team _$TeamFromJson(Map<String, dynamic> json) {
  return _Team.fromJson(json);
}

/// @nodoc
class _$TeamTearOff {
  const _$TeamTearOff();

// ignore: unused_element
  _Team call(
      {@required int team_id,
      @required String name,
      String country,
      int founded,
      bool is_national,
      int league,
      String logo,
      String venue_address,
      int venue_capacity,
      String venue_city,
      String venue_name,
      String venue_surface,
      DateTime createdDate}) {
    return _Team(
      team_id: team_id,
      name: name,
      country: country,
      founded: founded,
      is_national: is_national,
      league: league,
      logo: logo,
      venue_address: venue_address,
      venue_capacity: venue_capacity,
      venue_city: venue_city,
      venue_name: venue_name,
      venue_surface: venue_surface,
      createdDate: createdDate,
    );
  }

// ignore: unused_element
  Team fromJson(Map<String, Object> json) {
    return Team.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Team = _$TeamTearOff();

/// @nodoc
mixin _$Team {
  int get team_id;
  String get name;
  String get country;
  int get founded;
  bool get is_national;
  int get league;
  String get logo;
  String get venue_address;
  int get venue_capacity;
  String get venue_city;
  String get venue_name;
  String get venue_surface;
  DateTime get createdDate;

  Map<String, dynamic> toJson();
  $TeamCopyWith<Team> get copyWith;
}

/// @nodoc
abstract class $TeamCopyWith<$Res> {
  factory $TeamCopyWith(Team value, $Res Function(Team) then) =
      _$TeamCopyWithImpl<$Res>;
  $Res call(
      {int team_id,
      String name,
      String country,
      int founded,
      bool is_national,
      int league,
      String logo,
      String venue_address,
      int venue_capacity,
      String venue_city,
      String venue_name,
      String venue_surface,
      DateTime createdDate});
}

/// @nodoc
class _$TeamCopyWithImpl<$Res> implements $TeamCopyWith<$Res> {
  _$TeamCopyWithImpl(this._value, this._then);

  final Team _value;
  // ignore: unused_field
  final $Res Function(Team) _then;

  @override
  $Res call({
    Object team_id = freezed,
    Object name = freezed,
    Object country = freezed,
    Object founded = freezed,
    Object is_national = freezed,
    Object league = freezed,
    Object logo = freezed,
    Object venue_address = freezed,
    Object venue_capacity = freezed,
    Object venue_city = freezed,
    Object venue_name = freezed,
    Object venue_surface = freezed,
    Object createdDate = freezed,
  }) {
    return _then(_value.copyWith(
      team_id: team_id == freezed ? _value.team_id : team_id as int,
      name: name == freezed ? _value.name : name as String,
      country: country == freezed ? _value.country : country as String,
      founded: founded == freezed ? _value.founded : founded as int,
      is_national:
          is_national == freezed ? _value.is_national : is_national as bool,
      league: league == freezed ? _value.league : league as int,
      logo: logo == freezed ? _value.logo : logo as String,
      venue_address: venue_address == freezed
          ? _value.venue_address
          : venue_address as String,
      venue_capacity: venue_capacity == freezed
          ? _value.venue_capacity
          : venue_capacity as int,
      venue_city:
          venue_city == freezed ? _value.venue_city : venue_city as String,
      venue_name:
          venue_name == freezed ? _value.venue_name : venue_name as String,
      venue_surface: venue_surface == freezed
          ? _value.venue_surface
          : venue_surface as String,
      createdDate:
          createdDate == freezed ? _value.createdDate : createdDate as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$TeamCopyWith<$Res> implements $TeamCopyWith<$Res> {
  factory _$TeamCopyWith(_Team value, $Res Function(_Team) then) =
      __$TeamCopyWithImpl<$Res>;
  @override
  $Res call(
      {int team_id,
      String name,
      String country,
      int founded,
      bool is_national,
      int league,
      String logo,
      String venue_address,
      int venue_capacity,
      String venue_city,
      String venue_name,
      String venue_surface,
      DateTime createdDate});
}

/// @nodoc
class __$TeamCopyWithImpl<$Res> extends _$TeamCopyWithImpl<$Res>
    implements _$TeamCopyWith<$Res> {
  __$TeamCopyWithImpl(_Team _value, $Res Function(_Team) _then)
      : super(_value, (v) => _then(v as _Team));

  @override
  _Team get _value => super._value as _Team;

  @override
  $Res call({
    Object team_id = freezed,
    Object name = freezed,
    Object country = freezed,
    Object founded = freezed,
    Object is_national = freezed,
    Object league = freezed,
    Object logo = freezed,
    Object venue_address = freezed,
    Object venue_capacity = freezed,
    Object venue_city = freezed,
    Object venue_name = freezed,
    Object venue_surface = freezed,
    Object createdDate = freezed,
  }) {
    return _then(_Team(
      team_id: team_id == freezed ? _value.team_id : team_id as int,
      name: name == freezed ? _value.name : name as String,
      country: country == freezed ? _value.country : country as String,
      founded: founded == freezed ? _value.founded : founded as int,
      is_national:
          is_national == freezed ? _value.is_national : is_national as bool,
      league: league == freezed ? _value.league : league as int,
      logo: logo == freezed ? _value.logo : logo as String,
      venue_address: venue_address == freezed
          ? _value.venue_address
          : venue_address as String,
      venue_capacity: venue_capacity == freezed
          ? _value.venue_capacity
          : venue_capacity as int,
      venue_city:
          venue_city == freezed ? _value.venue_city : venue_city as String,
      venue_name:
          venue_name == freezed ? _value.venue_name : venue_name as String,
      venue_surface: venue_surface == freezed
          ? _value.venue_surface
          : venue_surface as String,
      createdDate:
          createdDate == freezed ? _value.createdDate : createdDate as DateTime,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Team extends _Team {
  const _$_Team(
      {@required this.team_id,
      @required this.name,
      this.country,
      this.founded,
      this.is_national,
      this.league,
      this.logo,
      this.venue_address,
      this.venue_capacity,
      this.venue_city,
      this.venue_name,
      this.venue_surface,
      this.createdDate})
      : assert(team_id != null),
        assert(name != null),
        super._();

  factory _$_Team.fromJson(Map<String, dynamic> json) =>
      _$_$_TeamFromJson(json);

  @override
  final int team_id;
  @override
  final String name;
  @override
  final String country;
  @override
  final int founded;
  @override
  final bool is_national;
  @override
  final int league;
  @override
  final String logo;
  @override
  final String venue_address;
  @override
  final int venue_capacity;
  @override
  final String venue_city;
  @override
  final String venue_name;
  @override
  final String venue_surface;
  @override
  final DateTime createdDate;

  @override
  String toString() {
    return 'Team(team_id: $team_id, name: $name, country: $country, founded: $founded, is_national: $is_national, league: $league, logo: $logo, venue_address: $venue_address, venue_capacity: $venue_capacity, venue_city: $venue_city, venue_name: $venue_name, venue_surface: $venue_surface, createdDate: $createdDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Team &&
            (identical(other.team_id, team_id) ||
                const DeepCollectionEquality()
                    .equals(other.team_id, team_id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.country, country) ||
                const DeepCollectionEquality()
                    .equals(other.country, country)) &&
            (identical(other.founded, founded) ||
                const DeepCollectionEquality()
                    .equals(other.founded, founded)) &&
            (identical(other.is_national, is_national) ||
                const DeepCollectionEquality()
                    .equals(other.is_national, is_national)) &&
            (identical(other.league, league) ||
                const DeepCollectionEquality().equals(other.league, league)) &&
            (identical(other.logo, logo) ||
                const DeepCollectionEquality().equals(other.logo, logo)) &&
            (identical(other.venue_address, venue_address) ||
                const DeepCollectionEquality()
                    .equals(other.venue_address, venue_address)) &&
            (identical(other.venue_capacity, venue_capacity) ||
                const DeepCollectionEquality()
                    .equals(other.venue_capacity, venue_capacity)) &&
            (identical(other.venue_city, venue_city) ||
                const DeepCollectionEquality()
                    .equals(other.venue_city, venue_city)) &&
            (identical(other.venue_name, venue_name) ||
                const DeepCollectionEquality()
                    .equals(other.venue_name, venue_name)) &&
            (identical(other.venue_surface, venue_surface) ||
                const DeepCollectionEquality()
                    .equals(other.venue_surface, venue_surface)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(team_id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(country) ^
      const DeepCollectionEquality().hash(founded) ^
      const DeepCollectionEquality().hash(is_national) ^
      const DeepCollectionEquality().hash(league) ^
      const DeepCollectionEquality().hash(logo) ^
      const DeepCollectionEquality().hash(venue_address) ^
      const DeepCollectionEquality().hash(venue_capacity) ^
      const DeepCollectionEquality().hash(venue_city) ^
      const DeepCollectionEquality().hash(venue_name) ^
      const DeepCollectionEquality().hash(venue_surface) ^
      const DeepCollectionEquality().hash(createdDate);

  @override
  _$TeamCopyWith<_Team> get copyWith =>
      __$TeamCopyWithImpl<_Team>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TeamToJson(this);
  }
}

abstract class _Team extends Team {
  const _Team._() : super._();
  const factory _Team(
      {@required int team_id,
      @required String name,
      String country,
      int founded,
      bool is_national,
      int league,
      String logo,
      String venue_address,
      int venue_capacity,
      String venue_city,
      String venue_name,
      String venue_surface,
      DateTime createdDate}) = _$_Team;

  factory _Team.fromJson(Map<String, dynamic> json) = _$_Team.fromJson;

  @override
  int get team_id;
  @override
  String get name;
  @override
  String get country;
  @override
  int get founded;
  @override
  bool get is_national;
  @override
  int get league;
  @override
  String get logo;
  @override
  String get venue_address;
  @override
  int get venue_capacity;
  @override
  String get venue_city;
  @override
  String get venue_name;
  @override
  String get venue_surface;
  @override
  DateTime get createdDate;
  @override
  _$TeamCopyWith<_Team> get copyWith;
}
