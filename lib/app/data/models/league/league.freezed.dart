// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'league.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
League _$LeagueFromJson(Map<String, dynamic> json) {
  return _League.fromJson(json);
}

/// @nodoc
class _$LeagueTearOff {
  const _$LeagueTearOff();

// ignore: unused_element
  _League call(
      {@required int league_id,
      @required String name,
      bool active,
      String country,
      String country_code,
      Map<String, dynamic> coverage,
      DateTime createdDate,
      String flag,
      int is_current,
      String logo,
      int order,
      int season,
      String season_start,
      String season_end,
      int standings,
      String type}) {
    return _League(
      league_id: league_id,
      name: name,
      active: active,
      country: country,
      country_code: country_code,
      coverage: coverage,
      createdDate: createdDate,
      flag: flag,
      is_current: is_current,
      logo: logo,
      order: order,
      season: season,
      season_start: season_start,
      season_end: season_end,
      standings: standings,
      type: type,
    );
  }

// ignore: unused_element
  League fromJson(Map<String, Object> json) {
    return League.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $League = _$LeagueTearOff();

/// @nodoc
mixin _$League {
  int get league_id;
  String get name;
  bool get active;
  String get country;
  String get country_code;
  Map<String, dynamic> get coverage;
  DateTime get createdDate;
  String get flag;
  int get is_current;
  String get logo;
  int get order;
  int get season;
  String get season_start;
  String get season_end;
  int get standings;
  String get type;

  Map<String, dynamic> toJson();
  $LeagueCopyWith<League> get copyWith;
}

/// @nodoc
abstract class $LeagueCopyWith<$Res> {
  factory $LeagueCopyWith(League value, $Res Function(League) then) =
      _$LeagueCopyWithImpl<$Res>;
  $Res call(
      {int league_id,
      String name,
      bool active,
      String country,
      String country_code,
      Map<String, dynamic> coverage,
      DateTime createdDate,
      String flag,
      int is_current,
      String logo,
      int order,
      int season,
      String season_start,
      String season_end,
      int standings,
      String type});
}

/// @nodoc
class _$LeagueCopyWithImpl<$Res> implements $LeagueCopyWith<$Res> {
  _$LeagueCopyWithImpl(this._value, this._then);

  final League _value;
  // ignore: unused_field
  final $Res Function(League) _then;

  @override
  $Res call({
    Object league_id = freezed,
    Object name = freezed,
    Object active = freezed,
    Object country = freezed,
    Object country_code = freezed,
    Object coverage = freezed,
    Object createdDate = freezed,
    Object flag = freezed,
    Object is_current = freezed,
    Object logo = freezed,
    Object order = freezed,
    Object season = freezed,
    Object season_start = freezed,
    Object season_end = freezed,
    Object standings = freezed,
    Object type = freezed,
  }) {
    return _then(_value.copyWith(
      league_id: league_id == freezed ? _value.league_id : league_id as int,
      name: name == freezed ? _value.name : name as String,
      active: active == freezed ? _value.active : active as bool,
      country: country == freezed ? _value.country : country as String,
      country_code: country_code == freezed
          ? _value.country_code
          : country_code as String,
      coverage: coverage == freezed
          ? _value.coverage
          : coverage as Map<String, dynamic>,
      createdDate:
          createdDate == freezed ? _value.createdDate : createdDate as DateTime,
      flag: flag == freezed ? _value.flag : flag as String,
      is_current: is_current == freezed ? _value.is_current : is_current as int,
      logo: logo == freezed ? _value.logo : logo as String,
      order: order == freezed ? _value.order : order as int,
      season: season == freezed ? _value.season : season as int,
      season_start: season_start == freezed
          ? _value.season_start
          : season_start as String,
      season_end:
          season_end == freezed ? _value.season_end : season_end as String,
      standings: standings == freezed ? _value.standings : standings as int,
      type: type == freezed ? _value.type : type as String,
    ));
  }
}

/// @nodoc
abstract class _$LeagueCopyWith<$Res> implements $LeagueCopyWith<$Res> {
  factory _$LeagueCopyWith(_League value, $Res Function(_League) then) =
      __$LeagueCopyWithImpl<$Res>;
  @override
  $Res call(
      {int league_id,
      String name,
      bool active,
      String country,
      String country_code,
      Map<String, dynamic> coverage,
      DateTime createdDate,
      String flag,
      int is_current,
      String logo,
      int order,
      int season,
      String season_start,
      String season_end,
      int standings,
      String type});
}

/// @nodoc
class __$LeagueCopyWithImpl<$Res> extends _$LeagueCopyWithImpl<$Res>
    implements _$LeagueCopyWith<$Res> {
  __$LeagueCopyWithImpl(_League _value, $Res Function(_League) _then)
      : super(_value, (v) => _then(v as _League));

  @override
  _League get _value => super._value as _League;

  @override
  $Res call({
    Object league_id = freezed,
    Object name = freezed,
    Object active = freezed,
    Object country = freezed,
    Object country_code = freezed,
    Object coverage = freezed,
    Object createdDate = freezed,
    Object flag = freezed,
    Object is_current = freezed,
    Object logo = freezed,
    Object order = freezed,
    Object season = freezed,
    Object season_start = freezed,
    Object season_end = freezed,
    Object standings = freezed,
    Object type = freezed,
  }) {
    return _then(_League(
      league_id: league_id == freezed ? _value.league_id : league_id as int,
      name: name == freezed ? _value.name : name as String,
      active: active == freezed ? _value.active : active as bool,
      country: country == freezed ? _value.country : country as String,
      country_code: country_code == freezed
          ? _value.country_code
          : country_code as String,
      coverage: coverage == freezed
          ? _value.coverage
          : coverage as Map<String, dynamic>,
      createdDate:
          createdDate == freezed ? _value.createdDate : createdDate as DateTime,
      flag: flag == freezed ? _value.flag : flag as String,
      is_current: is_current == freezed ? _value.is_current : is_current as int,
      logo: logo == freezed ? _value.logo : logo as String,
      order: order == freezed ? _value.order : order as int,
      season: season == freezed ? _value.season : season as int,
      season_start: season_start == freezed
          ? _value.season_start
          : season_start as String,
      season_end:
          season_end == freezed ? _value.season_end : season_end as String,
      standings: standings == freezed ? _value.standings : standings as int,
      type: type == freezed ? _value.type : type as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_League extends _League {
  const _$_League(
      {@required this.league_id,
      @required this.name,
      this.active,
      this.country,
      this.country_code,
      this.coverage,
      this.createdDate,
      this.flag,
      this.is_current,
      this.logo,
      this.order,
      this.season,
      this.season_start,
      this.season_end,
      this.standings,
      this.type})
      : assert(league_id != null),
        assert(name != null),
        super._();

  factory _$_League.fromJson(Map<String, dynamic> json) =>
      _$_$_LeagueFromJson(json);

  @override
  final int league_id;
  @override
  final String name;
  @override
  final bool active;
  @override
  final String country;
  @override
  final String country_code;
  @override
  final Map<String, dynamic> coverage;
  @override
  final DateTime createdDate;
  @override
  final String flag;
  @override
  final int is_current;
  @override
  final String logo;
  @override
  final int order;
  @override
  final int season;
  @override
  final String season_start;
  @override
  final String season_end;
  @override
  final int standings;
  @override
  final String type;

  @override
  String toString() {
    return 'League(league_id: $league_id, name: $name, active: $active, country: $country, country_code: $country_code, coverage: $coverage, createdDate: $createdDate, flag: $flag, is_current: $is_current, logo: $logo, order: $order, season: $season, season_start: $season_start, season_end: $season_end, standings: $standings, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _League &&
            (identical(other.league_id, league_id) ||
                const DeepCollectionEquality()
                    .equals(other.league_id, league_id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.active, active) ||
                const DeepCollectionEquality().equals(other.active, active)) &&
            (identical(other.country, country) ||
                const DeepCollectionEquality()
                    .equals(other.country, country)) &&
            (identical(other.country_code, country_code) ||
                const DeepCollectionEquality()
                    .equals(other.country_code, country_code)) &&
            (identical(other.coverage, coverage) ||
                const DeepCollectionEquality()
                    .equals(other.coverage, coverage)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.flag, flag) ||
                const DeepCollectionEquality().equals(other.flag, flag)) &&
            (identical(other.is_current, is_current) ||
                const DeepCollectionEquality()
                    .equals(other.is_current, is_current)) &&
            (identical(other.logo, logo) ||
                const DeepCollectionEquality().equals(other.logo, logo)) &&
            (identical(other.order, order) ||
                const DeepCollectionEquality().equals(other.order, order)) &&
            (identical(other.season, season) ||
                const DeepCollectionEquality().equals(other.season, season)) &&
            (identical(other.season_start, season_start) ||
                const DeepCollectionEquality()
                    .equals(other.season_start, season_start)) &&
            (identical(other.season_end, season_end) ||
                const DeepCollectionEquality()
                    .equals(other.season_end, season_end)) &&
            (identical(other.standings, standings) ||
                const DeepCollectionEquality()
                    .equals(other.standings, standings)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(league_id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(active) ^
      const DeepCollectionEquality().hash(country) ^
      const DeepCollectionEquality().hash(country_code) ^
      const DeepCollectionEquality().hash(coverage) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(flag) ^
      const DeepCollectionEquality().hash(is_current) ^
      const DeepCollectionEquality().hash(logo) ^
      const DeepCollectionEquality().hash(order) ^
      const DeepCollectionEquality().hash(season) ^
      const DeepCollectionEquality().hash(season_start) ^
      const DeepCollectionEquality().hash(season_end) ^
      const DeepCollectionEquality().hash(standings) ^
      const DeepCollectionEquality().hash(type);

  @override
  _$LeagueCopyWith<_League> get copyWith =>
      __$LeagueCopyWithImpl<_League>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_LeagueToJson(this);
  }
}

abstract class _League extends League {
  const _League._() : super._();
  const factory _League(
      {@required int league_id,
      @required String name,
      bool active,
      String country,
      String country_code,
      Map<String, dynamic> coverage,
      DateTime createdDate,
      String flag,
      int is_current,
      String logo,
      int order,
      int season,
      String season_start,
      String season_end,
      int standings,
      String type}) = _$_League;

  factory _League.fromJson(Map<String, dynamic> json) = _$_League.fromJson;

  @override
  int get league_id;
  @override
  String get name;
  @override
  bool get active;
  @override
  String get country;
  @override
  String get country_code;
  @override
  Map<String, dynamic> get coverage;
  @override
  DateTime get createdDate;
  @override
  String get flag;
  @override
  int get is_current;
  @override
  String get logo;
  @override
  int get order;
  @override
  int get season;
  @override
  String get season_start;
  @override
  String get season_end;
  @override
  int get standings;
  @override
  String get type;
  @override
  _$LeagueCopyWith<_League> get copyWith;
}
