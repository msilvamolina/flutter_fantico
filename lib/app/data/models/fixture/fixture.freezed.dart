// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'fixture.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Fixture _$FixtureFromJson(Map<String, dynamic> json) {
  return _Fixture.fromJson(json);
}

/// @nodoc
class _$FixtureTearOff {
  const _$FixtureTearOff();

// ignore: unused_element
  _Fixture call(
      {@required int fixture_id,
      @required int league_id,
      Map<String, dynamic> league,
      String event_date,
      int event_timestamp,
      int firstHalfStart,
      int secondHalfStart,
      String round,
      String status,
      String statusShort,
      int elapsed,
      String venue,
      String referee,
      Map<String, dynamic> homeTeam,
      Map<String, dynamic> awayTeam,
      int goalsHomeTeam,
      int goalsAwayTeam,
      Map<String, dynamic> score,
      DateTime eventDateStart,
      DateTime eventDateEnd,
      String eventDay}) {
    return _Fixture(
      fixture_id: fixture_id,
      league_id: league_id,
      league: league,
      event_date: event_date,
      event_timestamp: event_timestamp,
      firstHalfStart: firstHalfStart,
      secondHalfStart: secondHalfStart,
      round: round,
      status: status,
      statusShort: statusShort,
      elapsed: elapsed,
      venue: venue,
      referee: referee,
      homeTeam: homeTeam,
      awayTeam: awayTeam,
      goalsHomeTeam: goalsHomeTeam,
      goalsAwayTeam: goalsAwayTeam,
      score: score,
      eventDateStart: eventDateStart,
      eventDateEnd: eventDateEnd,
      eventDay: eventDay,
    );
  }

// ignore: unused_element
  Fixture fromJson(Map<String, Object> json) {
    return Fixture.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Fixture = _$FixtureTearOff();

/// @nodoc
mixin _$Fixture {
  int get fixture_id;
  int get league_id;
  Map<String, dynamic> get league;
  String get event_date;
  int get event_timestamp;
  int get firstHalfStart;
  int get secondHalfStart;
  String get round;
  String get status;
  String get statusShort;
  int get elapsed;
  String get venue;
  String get referee;
  Map<String, dynamic> get homeTeam;
  Map<String, dynamic> get awayTeam;
  int get goalsHomeTeam;
  int get goalsAwayTeam;
  Map<String, dynamic> get score;
  DateTime get eventDateStart;
  DateTime get eventDateEnd;
  String get eventDay;

  Map<String, dynamic> toJson();
  $FixtureCopyWith<Fixture> get copyWith;
}

/// @nodoc
abstract class $FixtureCopyWith<$Res> {
  factory $FixtureCopyWith(Fixture value, $Res Function(Fixture) then) =
      _$FixtureCopyWithImpl<$Res>;
  $Res call(
      {int fixture_id,
      int league_id,
      Map<String, dynamic> league,
      String event_date,
      int event_timestamp,
      int firstHalfStart,
      int secondHalfStart,
      String round,
      String status,
      String statusShort,
      int elapsed,
      String venue,
      String referee,
      Map<String, dynamic> homeTeam,
      Map<String, dynamic> awayTeam,
      int goalsHomeTeam,
      int goalsAwayTeam,
      Map<String, dynamic> score,
      DateTime eventDateStart,
      DateTime eventDateEnd,
      String eventDay});
}

/// @nodoc
class _$FixtureCopyWithImpl<$Res> implements $FixtureCopyWith<$Res> {
  _$FixtureCopyWithImpl(this._value, this._then);

  final Fixture _value;
  // ignore: unused_field
  final $Res Function(Fixture) _then;

  @override
  $Res call({
    Object fixture_id = freezed,
    Object league_id = freezed,
    Object league = freezed,
    Object event_date = freezed,
    Object event_timestamp = freezed,
    Object firstHalfStart = freezed,
    Object secondHalfStart = freezed,
    Object round = freezed,
    Object status = freezed,
    Object statusShort = freezed,
    Object elapsed = freezed,
    Object venue = freezed,
    Object referee = freezed,
    Object homeTeam = freezed,
    Object awayTeam = freezed,
    Object goalsHomeTeam = freezed,
    Object goalsAwayTeam = freezed,
    Object score = freezed,
    Object eventDateStart = freezed,
    Object eventDateEnd = freezed,
    Object eventDay = freezed,
  }) {
    return _then(_value.copyWith(
      fixture_id: fixture_id == freezed ? _value.fixture_id : fixture_id as int,
      league_id: league_id == freezed ? _value.league_id : league_id as int,
      league:
          league == freezed ? _value.league : league as Map<String, dynamic>,
      event_date:
          event_date == freezed ? _value.event_date : event_date as String,
      event_timestamp: event_timestamp == freezed
          ? _value.event_timestamp
          : event_timestamp as int,
      firstHalfStart: firstHalfStart == freezed
          ? _value.firstHalfStart
          : firstHalfStart as int,
      secondHalfStart: secondHalfStart == freezed
          ? _value.secondHalfStart
          : secondHalfStart as int,
      round: round == freezed ? _value.round : round as String,
      status: status == freezed ? _value.status : status as String,
      statusShort:
          statusShort == freezed ? _value.statusShort : statusShort as String,
      elapsed: elapsed == freezed ? _value.elapsed : elapsed as int,
      venue: venue == freezed ? _value.venue : venue as String,
      referee: referee == freezed ? _value.referee : referee as String,
      homeTeam: homeTeam == freezed
          ? _value.homeTeam
          : homeTeam as Map<String, dynamic>,
      awayTeam: awayTeam == freezed
          ? _value.awayTeam
          : awayTeam as Map<String, dynamic>,
      goalsHomeTeam: goalsHomeTeam == freezed
          ? _value.goalsHomeTeam
          : goalsHomeTeam as int,
      goalsAwayTeam: goalsAwayTeam == freezed
          ? _value.goalsAwayTeam
          : goalsAwayTeam as int,
      score: score == freezed ? _value.score : score as Map<String, dynamic>,
      eventDateStart: eventDateStart == freezed
          ? _value.eventDateStart
          : eventDateStart as DateTime,
      eventDateEnd: eventDateEnd == freezed
          ? _value.eventDateEnd
          : eventDateEnd as DateTime,
      eventDay: eventDay == freezed ? _value.eventDay : eventDay as String,
    ));
  }
}

/// @nodoc
abstract class _$FixtureCopyWith<$Res> implements $FixtureCopyWith<$Res> {
  factory _$FixtureCopyWith(_Fixture value, $Res Function(_Fixture) then) =
      __$FixtureCopyWithImpl<$Res>;
  @override
  $Res call(
      {int fixture_id,
      int league_id,
      Map<String, dynamic> league,
      String event_date,
      int event_timestamp,
      int firstHalfStart,
      int secondHalfStart,
      String round,
      String status,
      String statusShort,
      int elapsed,
      String venue,
      String referee,
      Map<String, dynamic> homeTeam,
      Map<String, dynamic> awayTeam,
      int goalsHomeTeam,
      int goalsAwayTeam,
      Map<String, dynamic> score,
      DateTime eventDateStart,
      DateTime eventDateEnd,
      String eventDay});
}

/// @nodoc
class __$FixtureCopyWithImpl<$Res> extends _$FixtureCopyWithImpl<$Res>
    implements _$FixtureCopyWith<$Res> {
  __$FixtureCopyWithImpl(_Fixture _value, $Res Function(_Fixture) _then)
      : super(_value, (v) => _then(v as _Fixture));

  @override
  _Fixture get _value => super._value as _Fixture;

  @override
  $Res call({
    Object fixture_id = freezed,
    Object league_id = freezed,
    Object league = freezed,
    Object event_date = freezed,
    Object event_timestamp = freezed,
    Object firstHalfStart = freezed,
    Object secondHalfStart = freezed,
    Object round = freezed,
    Object status = freezed,
    Object statusShort = freezed,
    Object elapsed = freezed,
    Object venue = freezed,
    Object referee = freezed,
    Object homeTeam = freezed,
    Object awayTeam = freezed,
    Object goalsHomeTeam = freezed,
    Object goalsAwayTeam = freezed,
    Object score = freezed,
    Object eventDateStart = freezed,
    Object eventDateEnd = freezed,
    Object eventDay = freezed,
  }) {
    return _then(_Fixture(
      fixture_id: fixture_id == freezed ? _value.fixture_id : fixture_id as int,
      league_id: league_id == freezed ? _value.league_id : league_id as int,
      league:
          league == freezed ? _value.league : league as Map<String, dynamic>,
      event_date:
          event_date == freezed ? _value.event_date : event_date as String,
      event_timestamp: event_timestamp == freezed
          ? _value.event_timestamp
          : event_timestamp as int,
      firstHalfStart: firstHalfStart == freezed
          ? _value.firstHalfStart
          : firstHalfStart as int,
      secondHalfStart: secondHalfStart == freezed
          ? _value.secondHalfStart
          : secondHalfStart as int,
      round: round == freezed ? _value.round : round as String,
      status: status == freezed ? _value.status : status as String,
      statusShort:
          statusShort == freezed ? _value.statusShort : statusShort as String,
      elapsed: elapsed == freezed ? _value.elapsed : elapsed as int,
      venue: venue == freezed ? _value.venue : venue as String,
      referee: referee == freezed ? _value.referee : referee as String,
      homeTeam: homeTeam == freezed
          ? _value.homeTeam
          : homeTeam as Map<String, dynamic>,
      awayTeam: awayTeam == freezed
          ? _value.awayTeam
          : awayTeam as Map<String, dynamic>,
      goalsHomeTeam: goalsHomeTeam == freezed
          ? _value.goalsHomeTeam
          : goalsHomeTeam as int,
      goalsAwayTeam: goalsAwayTeam == freezed
          ? _value.goalsAwayTeam
          : goalsAwayTeam as int,
      score: score == freezed ? _value.score : score as Map<String, dynamic>,
      eventDateStart: eventDateStart == freezed
          ? _value.eventDateStart
          : eventDateStart as DateTime,
      eventDateEnd: eventDateEnd == freezed
          ? _value.eventDateEnd
          : eventDateEnd as DateTime,
      eventDay: eventDay == freezed ? _value.eventDay : eventDay as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Fixture extends _Fixture {
  const _$_Fixture(
      {@required this.fixture_id,
      @required this.league_id,
      this.league,
      this.event_date,
      this.event_timestamp,
      this.firstHalfStart,
      this.secondHalfStart,
      this.round,
      this.status,
      this.statusShort,
      this.elapsed,
      this.venue,
      this.referee,
      this.homeTeam,
      this.awayTeam,
      this.goalsHomeTeam,
      this.goalsAwayTeam,
      this.score,
      this.eventDateStart,
      this.eventDateEnd,
      this.eventDay})
      : assert(fixture_id != null),
        assert(league_id != null),
        super._();

  factory _$_Fixture.fromJson(Map<String, dynamic> json) =>
      _$_$_FixtureFromJson(json);

  @override
  final int fixture_id;
  @override
  final int league_id;
  @override
  final Map<String, dynamic> league;
  @override
  final String event_date;
  @override
  final int event_timestamp;
  @override
  final int firstHalfStart;
  @override
  final int secondHalfStart;
  @override
  final String round;
  @override
  final String status;
  @override
  final String statusShort;
  @override
  final int elapsed;
  @override
  final String venue;
  @override
  final String referee;
  @override
  final Map<String, dynamic> homeTeam;
  @override
  final Map<String, dynamic> awayTeam;
  @override
  final int goalsHomeTeam;
  @override
  final int goalsAwayTeam;
  @override
  final Map<String, dynamic> score;
  @override
  final DateTime eventDateStart;
  @override
  final DateTime eventDateEnd;
  @override
  final String eventDay;

  @override
  String toString() {
    return 'Fixture(fixture_id: $fixture_id, league_id: $league_id, league: $league, event_date: $event_date, event_timestamp: $event_timestamp, firstHalfStart: $firstHalfStart, secondHalfStart: $secondHalfStart, round: $round, status: $status, statusShort: $statusShort, elapsed: $elapsed, venue: $venue, referee: $referee, homeTeam: $homeTeam, awayTeam: $awayTeam, goalsHomeTeam: $goalsHomeTeam, goalsAwayTeam: $goalsAwayTeam, score: $score, eventDateStart: $eventDateStart, eventDateEnd: $eventDateEnd, eventDay: $eventDay)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Fixture &&
            (identical(other.fixture_id, fixture_id) ||
                const DeepCollectionEquality()
                    .equals(other.fixture_id, fixture_id)) &&
            (identical(other.league_id, league_id) ||
                const DeepCollectionEquality()
                    .equals(other.league_id, league_id)) &&
            (identical(other.league, league) ||
                const DeepCollectionEquality().equals(other.league, league)) &&
            (identical(other.event_date, event_date) ||
                const DeepCollectionEquality()
                    .equals(other.event_date, event_date)) &&
            (identical(other.event_timestamp, event_timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.event_timestamp, event_timestamp)) &&
            (identical(other.firstHalfStart, firstHalfStart) ||
                const DeepCollectionEquality()
                    .equals(other.firstHalfStart, firstHalfStart)) &&
            (identical(other.secondHalfStart, secondHalfStart) ||
                const DeepCollectionEquality()
                    .equals(other.secondHalfStart, secondHalfStart)) &&
            (identical(other.round, round) ||
                const DeepCollectionEquality().equals(other.round, round)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.statusShort, statusShort) ||
                const DeepCollectionEquality()
                    .equals(other.statusShort, statusShort)) &&
            (identical(other.elapsed, elapsed) ||
                const DeepCollectionEquality()
                    .equals(other.elapsed, elapsed)) &&
            (identical(other.venue, venue) ||
                const DeepCollectionEquality().equals(other.venue, venue)) &&
            (identical(other.referee, referee) ||
                const DeepCollectionEquality()
                    .equals(other.referee, referee)) &&
            (identical(other.homeTeam, homeTeam) ||
                const DeepCollectionEquality()
                    .equals(other.homeTeam, homeTeam)) &&
            (identical(other.awayTeam, awayTeam) ||
                const DeepCollectionEquality()
                    .equals(other.awayTeam, awayTeam)) &&
            (identical(other.goalsHomeTeam, goalsHomeTeam) ||
                const DeepCollectionEquality()
                    .equals(other.goalsHomeTeam, goalsHomeTeam)) &&
            (identical(other.goalsAwayTeam, goalsAwayTeam) ||
                const DeepCollectionEquality()
                    .equals(other.goalsAwayTeam, goalsAwayTeam)) &&
            (identical(other.score, score) ||
                const DeepCollectionEquality().equals(other.score, score)) &&
            (identical(other.eventDateStart, eventDateStart) ||
                const DeepCollectionEquality()
                    .equals(other.eventDateStart, eventDateStart)) &&
            (identical(other.eventDateEnd, eventDateEnd) ||
                const DeepCollectionEquality()
                    .equals(other.eventDateEnd, eventDateEnd)) &&
            (identical(other.eventDay, eventDay) ||
                const DeepCollectionEquality()
                    .equals(other.eventDay, eventDay)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(fixture_id) ^
      const DeepCollectionEquality().hash(league_id) ^
      const DeepCollectionEquality().hash(league) ^
      const DeepCollectionEquality().hash(event_date) ^
      const DeepCollectionEquality().hash(event_timestamp) ^
      const DeepCollectionEquality().hash(firstHalfStart) ^
      const DeepCollectionEquality().hash(secondHalfStart) ^
      const DeepCollectionEquality().hash(round) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(statusShort) ^
      const DeepCollectionEquality().hash(elapsed) ^
      const DeepCollectionEquality().hash(venue) ^
      const DeepCollectionEquality().hash(referee) ^
      const DeepCollectionEquality().hash(homeTeam) ^
      const DeepCollectionEquality().hash(awayTeam) ^
      const DeepCollectionEquality().hash(goalsHomeTeam) ^
      const DeepCollectionEquality().hash(goalsAwayTeam) ^
      const DeepCollectionEquality().hash(score) ^
      const DeepCollectionEquality().hash(eventDateStart) ^
      const DeepCollectionEquality().hash(eventDateEnd) ^
      const DeepCollectionEquality().hash(eventDay);

  @override
  _$FixtureCopyWith<_Fixture> get copyWith =>
      __$FixtureCopyWithImpl<_Fixture>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FixtureToJson(this);
  }
}

abstract class _Fixture extends Fixture {
  const _Fixture._() : super._();
  const factory _Fixture(
      {@required int fixture_id,
      @required int league_id,
      Map<String, dynamic> league,
      String event_date,
      int event_timestamp,
      int firstHalfStart,
      int secondHalfStart,
      String round,
      String status,
      String statusShort,
      int elapsed,
      String venue,
      String referee,
      Map<String, dynamic> homeTeam,
      Map<String, dynamic> awayTeam,
      int goalsHomeTeam,
      int goalsAwayTeam,
      Map<String, dynamic> score,
      DateTime eventDateStart,
      DateTime eventDateEnd,
      String eventDay}) = _$_Fixture;

  factory _Fixture.fromJson(Map<String, dynamic> json) = _$_Fixture.fromJson;

  @override
  int get fixture_id;
  @override
  int get league_id;
  @override
  Map<String, dynamic> get league;
  @override
  String get event_date;
  @override
  int get event_timestamp;
  @override
  int get firstHalfStart;
  @override
  int get secondHalfStart;
  @override
  String get round;
  @override
  String get status;
  @override
  String get statusShort;
  @override
  int get elapsed;
  @override
  String get venue;
  @override
  String get referee;
  @override
  Map<String, dynamic> get homeTeam;
  @override
  Map<String, dynamic> get awayTeam;
  @override
  int get goalsHomeTeam;
  @override
  int get goalsAwayTeam;
  @override
  Map<String, dynamic> get score;
  @override
  DateTime get eventDateStart;
  @override
  DateTime get eventDateEnd;
  @override
  String get eventDay;
  @override
  _$FixtureCopyWith<_Fixture> get copyWith;
}
