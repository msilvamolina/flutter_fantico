// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'forecast.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Forecast _$ForecastFromJson(Map<String, dynamic> json) {
  return _Forecast.fromJson(json);
}

/// @nodoc
class _$ForecastTearOff {
  const _$ForecastTearOff();

// ignore: unused_element
  _Forecast call(
      {@required String id,
      @required String userEmail,
      @required int fixture_id,
      @required int league_id,
      Map<String, dynamic> league,
      Map<String, dynamic> homeTeam,
      Map<String, dynamic> awayTeam,
      String event_date,
      String event_day,
      String venue,
      bool agregarAMiRacha,
      int awayScore,
      bool awayTeamWin,
      int homeScore,
      bool homeTeamWin,
      DateTime createdDate,
      DateTime updatedDate,
      bool predecirResultado,
      bool closed,
      String result,
      String resultScore,
      bool tie}) {
    return _Forecast(
      id: id,
      userEmail: userEmail,
      fixture_id: fixture_id,
      league_id: league_id,
      league: league,
      homeTeam: homeTeam,
      awayTeam: awayTeam,
      event_date: event_date,
      event_day: event_day,
      venue: venue,
      agregarAMiRacha: agregarAMiRacha,
      awayScore: awayScore,
      awayTeamWin: awayTeamWin,
      homeScore: homeScore,
      homeTeamWin: homeTeamWin,
      createdDate: createdDate,
      updatedDate: updatedDate,
      predecirResultado: predecirResultado,
      closed: closed,
      result: result,
      resultScore: resultScore,
      tie: tie,
    );
  }

// ignore: unused_element
  Forecast fromJson(Map<String, Object> json) {
    return Forecast.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Forecast = _$ForecastTearOff();

/// @nodoc
mixin _$Forecast {
  String get id;
  String get userEmail;
  int get fixture_id;
  int get league_id;
  Map<String, dynamic> get league;
  Map<String, dynamic> get homeTeam;
  Map<String, dynamic> get awayTeam;
  String get event_date;
  String get event_day;
  String get venue;
  bool get agregarAMiRacha;
  int get awayScore;
  bool get awayTeamWin;
  int get homeScore;
  bool get homeTeamWin;
  DateTime get createdDate;
  DateTime get updatedDate;
  bool get predecirResultado;
  bool get closed;
  String get result;
  String get resultScore;
  bool get tie;

  Map<String, dynamic> toJson();
  $ForecastCopyWith<Forecast> get copyWith;
}

/// @nodoc
abstract class $ForecastCopyWith<$Res> {
  factory $ForecastCopyWith(Forecast value, $Res Function(Forecast) then) =
      _$ForecastCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String userEmail,
      int fixture_id,
      int league_id,
      Map<String, dynamic> league,
      Map<String, dynamic> homeTeam,
      Map<String, dynamic> awayTeam,
      String event_date,
      String event_day,
      String venue,
      bool agregarAMiRacha,
      int awayScore,
      bool awayTeamWin,
      int homeScore,
      bool homeTeamWin,
      DateTime createdDate,
      DateTime updatedDate,
      bool predecirResultado,
      bool closed,
      String result,
      String resultScore,
      bool tie});
}

/// @nodoc
class _$ForecastCopyWithImpl<$Res> implements $ForecastCopyWith<$Res> {
  _$ForecastCopyWithImpl(this._value, this._then);

  final Forecast _value;
  // ignore: unused_field
  final $Res Function(Forecast) _then;

  @override
  $Res call({
    Object id = freezed,
    Object userEmail = freezed,
    Object fixture_id = freezed,
    Object league_id = freezed,
    Object league = freezed,
    Object homeTeam = freezed,
    Object awayTeam = freezed,
    Object event_date = freezed,
    Object event_day = freezed,
    Object venue = freezed,
    Object agregarAMiRacha = freezed,
    Object awayScore = freezed,
    Object awayTeamWin = freezed,
    Object homeScore = freezed,
    Object homeTeamWin = freezed,
    Object createdDate = freezed,
    Object updatedDate = freezed,
    Object predecirResultado = freezed,
    Object closed = freezed,
    Object result = freezed,
    Object resultScore = freezed,
    Object tie = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      userEmail: userEmail == freezed ? _value.userEmail : userEmail as String,
      fixture_id: fixture_id == freezed ? _value.fixture_id : fixture_id as int,
      league_id: league_id == freezed ? _value.league_id : league_id as int,
      league:
          league == freezed ? _value.league : league as Map<String, dynamic>,
      homeTeam: homeTeam == freezed
          ? _value.homeTeam
          : homeTeam as Map<String, dynamic>,
      awayTeam: awayTeam == freezed
          ? _value.awayTeam
          : awayTeam as Map<String, dynamic>,
      event_date:
          event_date == freezed ? _value.event_date : event_date as String,
      event_day: event_day == freezed ? _value.event_day : event_day as String,
      venue: venue == freezed ? _value.venue : venue as String,
      agregarAMiRacha: agregarAMiRacha == freezed
          ? _value.agregarAMiRacha
          : agregarAMiRacha as bool,
      awayScore: awayScore == freezed ? _value.awayScore : awayScore as int,
      awayTeamWin:
          awayTeamWin == freezed ? _value.awayTeamWin : awayTeamWin as bool,
      homeScore: homeScore == freezed ? _value.homeScore : homeScore as int,
      homeTeamWin:
          homeTeamWin == freezed ? _value.homeTeamWin : homeTeamWin as bool,
      createdDate:
          createdDate == freezed ? _value.createdDate : createdDate as DateTime,
      updatedDate:
          updatedDate == freezed ? _value.updatedDate : updatedDate as DateTime,
      predecirResultado: predecirResultado == freezed
          ? _value.predecirResultado
          : predecirResultado as bool,
      closed: closed == freezed ? _value.closed : closed as bool,
      result: result == freezed ? _value.result : result as String,
      resultScore:
          resultScore == freezed ? _value.resultScore : resultScore as String,
      tie: tie == freezed ? _value.tie : tie as bool,
    ));
  }
}

/// @nodoc
abstract class _$ForecastCopyWith<$Res> implements $ForecastCopyWith<$Res> {
  factory _$ForecastCopyWith(_Forecast value, $Res Function(_Forecast) then) =
      __$ForecastCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String userEmail,
      int fixture_id,
      int league_id,
      Map<String, dynamic> league,
      Map<String, dynamic> homeTeam,
      Map<String, dynamic> awayTeam,
      String event_date,
      String event_day,
      String venue,
      bool agregarAMiRacha,
      int awayScore,
      bool awayTeamWin,
      int homeScore,
      bool homeTeamWin,
      DateTime createdDate,
      DateTime updatedDate,
      bool predecirResultado,
      bool closed,
      String result,
      String resultScore,
      bool tie});
}

/// @nodoc
class __$ForecastCopyWithImpl<$Res> extends _$ForecastCopyWithImpl<$Res>
    implements _$ForecastCopyWith<$Res> {
  __$ForecastCopyWithImpl(_Forecast _value, $Res Function(_Forecast) _then)
      : super(_value, (v) => _then(v as _Forecast));

  @override
  _Forecast get _value => super._value as _Forecast;

  @override
  $Res call({
    Object id = freezed,
    Object userEmail = freezed,
    Object fixture_id = freezed,
    Object league_id = freezed,
    Object league = freezed,
    Object homeTeam = freezed,
    Object awayTeam = freezed,
    Object event_date = freezed,
    Object event_day = freezed,
    Object venue = freezed,
    Object agregarAMiRacha = freezed,
    Object awayScore = freezed,
    Object awayTeamWin = freezed,
    Object homeScore = freezed,
    Object homeTeamWin = freezed,
    Object createdDate = freezed,
    Object updatedDate = freezed,
    Object predecirResultado = freezed,
    Object closed = freezed,
    Object result = freezed,
    Object resultScore = freezed,
    Object tie = freezed,
  }) {
    return _then(_Forecast(
      id: id == freezed ? _value.id : id as String,
      userEmail: userEmail == freezed ? _value.userEmail : userEmail as String,
      fixture_id: fixture_id == freezed ? _value.fixture_id : fixture_id as int,
      league_id: league_id == freezed ? _value.league_id : league_id as int,
      league:
          league == freezed ? _value.league : league as Map<String, dynamic>,
      homeTeam: homeTeam == freezed
          ? _value.homeTeam
          : homeTeam as Map<String, dynamic>,
      awayTeam: awayTeam == freezed
          ? _value.awayTeam
          : awayTeam as Map<String, dynamic>,
      event_date:
          event_date == freezed ? _value.event_date : event_date as String,
      event_day: event_day == freezed ? _value.event_day : event_day as String,
      venue: venue == freezed ? _value.venue : venue as String,
      agregarAMiRacha: agregarAMiRacha == freezed
          ? _value.agregarAMiRacha
          : agregarAMiRacha as bool,
      awayScore: awayScore == freezed ? _value.awayScore : awayScore as int,
      awayTeamWin:
          awayTeamWin == freezed ? _value.awayTeamWin : awayTeamWin as bool,
      homeScore: homeScore == freezed ? _value.homeScore : homeScore as int,
      homeTeamWin:
          homeTeamWin == freezed ? _value.homeTeamWin : homeTeamWin as bool,
      createdDate:
          createdDate == freezed ? _value.createdDate : createdDate as DateTime,
      updatedDate:
          updatedDate == freezed ? _value.updatedDate : updatedDate as DateTime,
      predecirResultado: predecirResultado == freezed
          ? _value.predecirResultado
          : predecirResultado as bool,
      closed: closed == freezed ? _value.closed : closed as bool,
      result: result == freezed ? _value.result : result as String,
      resultScore:
          resultScore == freezed ? _value.resultScore : resultScore as String,
      tie: tie == freezed ? _value.tie : tie as bool,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Forecast extends _Forecast {
  const _$_Forecast(
      {@required this.id,
      @required this.userEmail,
      @required this.fixture_id,
      @required this.league_id,
      this.league,
      this.homeTeam,
      this.awayTeam,
      this.event_date,
      this.event_day,
      this.venue,
      this.agregarAMiRacha,
      this.awayScore,
      this.awayTeamWin,
      this.homeScore,
      this.homeTeamWin,
      this.createdDate,
      this.updatedDate,
      this.predecirResultado,
      this.closed,
      this.result,
      this.resultScore,
      this.tie})
      : assert(id != null),
        assert(userEmail != null),
        assert(fixture_id != null),
        assert(league_id != null),
        super._();

  factory _$_Forecast.fromJson(Map<String, dynamic> json) =>
      _$_$_ForecastFromJson(json);

  @override
  final String id;
  @override
  final String userEmail;
  @override
  final int fixture_id;
  @override
  final int league_id;
  @override
  final Map<String, dynamic> league;
  @override
  final Map<String, dynamic> homeTeam;
  @override
  final Map<String, dynamic> awayTeam;
  @override
  final String event_date;
  @override
  final String event_day;
  @override
  final String venue;
  @override
  final bool agregarAMiRacha;
  @override
  final int awayScore;
  @override
  final bool awayTeamWin;
  @override
  final int homeScore;
  @override
  final bool homeTeamWin;
  @override
  final DateTime createdDate;
  @override
  final DateTime updatedDate;
  @override
  final bool predecirResultado;
  @override
  final bool closed;
  @override
  final String result;
  @override
  final String resultScore;
  @override
  final bool tie;

  @override
  String toString() {
    return 'Forecast(id: $id, userEmail: $userEmail, fixture_id: $fixture_id, league_id: $league_id, league: $league, homeTeam: $homeTeam, awayTeam: $awayTeam, event_date: $event_date, event_day: $event_day, venue: $venue, agregarAMiRacha: $agregarAMiRacha, awayScore: $awayScore, awayTeamWin: $awayTeamWin, homeScore: $homeScore, homeTeamWin: $homeTeamWin, createdDate: $createdDate, updatedDate: $updatedDate, predecirResultado: $predecirResultado, closed: $closed, result: $result, resultScore: $resultScore, tie: $tie)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Forecast &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.userEmail, userEmail) ||
                const DeepCollectionEquality()
                    .equals(other.userEmail, userEmail)) &&
            (identical(other.fixture_id, fixture_id) ||
                const DeepCollectionEquality()
                    .equals(other.fixture_id, fixture_id)) &&
            (identical(other.league_id, league_id) ||
                const DeepCollectionEquality()
                    .equals(other.league_id, league_id)) &&
            (identical(other.league, league) ||
                const DeepCollectionEquality().equals(other.league, league)) &&
            (identical(other.homeTeam, homeTeam) ||
                const DeepCollectionEquality()
                    .equals(other.homeTeam, homeTeam)) &&
            (identical(other.awayTeam, awayTeam) ||
                const DeepCollectionEquality()
                    .equals(other.awayTeam, awayTeam)) &&
            (identical(other.event_date, event_date) ||
                const DeepCollectionEquality()
                    .equals(other.event_date, event_date)) &&
            (identical(other.event_day, event_day) ||
                const DeepCollectionEquality()
                    .equals(other.event_day, event_day)) &&
            (identical(other.venue, venue) ||
                const DeepCollectionEquality().equals(other.venue, venue)) &&
            (identical(other.agregarAMiRacha, agregarAMiRacha) ||
                const DeepCollectionEquality()
                    .equals(other.agregarAMiRacha, agregarAMiRacha)) &&
            (identical(other.awayScore, awayScore) ||
                const DeepCollectionEquality()
                    .equals(other.awayScore, awayScore)) &&
            (identical(other.awayTeamWin, awayTeamWin) ||
                const DeepCollectionEquality()
                    .equals(other.awayTeamWin, awayTeamWin)) &&
            (identical(other.homeScore, homeScore) ||
                const DeepCollectionEquality()
                    .equals(other.homeScore, homeScore)) &&
            (identical(other.homeTeamWin, homeTeamWin) ||
                const DeepCollectionEquality()
                    .equals(other.homeTeamWin, homeTeamWin)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.updatedDate, updatedDate) ||
                const DeepCollectionEquality()
                    .equals(other.updatedDate, updatedDate)) &&
            (identical(other.predecirResultado, predecirResultado) ||
                const DeepCollectionEquality()
                    .equals(other.predecirResultado, predecirResultado)) &&
            (identical(other.closed, closed) ||
                const DeepCollectionEquality().equals(other.closed, closed)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.resultScore, resultScore) ||
                const DeepCollectionEquality()
                    .equals(other.resultScore, resultScore)) &&
            (identical(other.tie, tie) ||
                const DeepCollectionEquality().equals(other.tie, tie)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(userEmail) ^
      const DeepCollectionEquality().hash(fixture_id) ^
      const DeepCollectionEquality().hash(league_id) ^
      const DeepCollectionEquality().hash(league) ^
      const DeepCollectionEquality().hash(homeTeam) ^
      const DeepCollectionEquality().hash(awayTeam) ^
      const DeepCollectionEquality().hash(event_date) ^
      const DeepCollectionEquality().hash(event_day) ^
      const DeepCollectionEquality().hash(venue) ^
      const DeepCollectionEquality().hash(agregarAMiRacha) ^
      const DeepCollectionEquality().hash(awayScore) ^
      const DeepCollectionEquality().hash(awayTeamWin) ^
      const DeepCollectionEquality().hash(homeScore) ^
      const DeepCollectionEquality().hash(homeTeamWin) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(updatedDate) ^
      const DeepCollectionEquality().hash(predecirResultado) ^
      const DeepCollectionEquality().hash(closed) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(resultScore) ^
      const DeepCollectionEquality().hash(tie);

  @override
  _$ForecastCopyWith<_Forecast> get copyWith =>
      __$ForecastCopyWithImpl<_Forecast>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ForecastToJson(this);
  }
}

abstract class _Forecast extends Forecast {
  const _Forecast._() : super._();
  const factory _Forecast(
      {@required String id,
      @required String userEmail,
      @required int fixture_id,
      @required int league_id,
      Map<String, dynamic> league,
      Map<String, dynamic> homeTeam,
      Map<String, dynamic> awayTeam,
      String event_date,
      String event_day,
      String venue,
      bool agregarAMiRacha,
      int awayScore,
      bool awayTeamWin,
      int homeScore,
      bool homeTeamWin,
      DateTime createdDate,
      DateTime updatedDate,
      bool predecirResultado,
      bool closed,
      String result,
      String resultScore,
      bool tie}) = _$_Forecast;

  factory _Forecast.fromJson(Map<String, dynamic> json) = _$_Forecast.fromJson;

  @override
  String get id;
  @override
  String get userEmail;
  @override
  int get fixture_id;
  @override
  int get league_id;
  @override
  Map<String, dynamic> get league;
  @override
  Map<String, dynamic> get homeTeam;
  @override
  Map<String, dynamic> get awayTeam;
  @override
  String get event_date;
  @override
  String get event_day;
  @override
  String get venue;
  @override
  bool get agregarAMiRacha;
  @override
  int get awayScore;
  @override
  bool get awayTeamWin;
  @override
  int get homeScore;
  @override
  bool get homeTeamWin;
  @override
  DateTime get createdDate;
  @override
  DateTime get updatedDate;
  @override
  bool get predecirResultado;
  @override
  bool get closed;
  @override
  String get result;
  @override
  String get resultScore;
  @override
  bool get tie;
  @override
  _$ForecastCopyWith<_Forecast> get copyWith;
}
