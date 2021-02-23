// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fixture.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Fixture _$_$_FixtureFromJson(Map<String, dynamic> json) {
  return _$_Fixture(
    fixture_id: json['fixture_id'] as int,
    league_id: json['league_id'] as int,
    league: json['league'] as Map<String, dynamic>,
    event_date: json['event_date'] as String,
    event_timestamp: json['event_timestamp'] as int,
    firstHalfStart: json['firstHalfStart'] as int,
    secondHalfStart: json['secondHalfStart'] as int,
    round: json['round'] as String,
    status: json['status'] as String,
    statusShort: json['statusShort'] as String,
    elapsed: json['elapsed'] as int,
    venue: json['venue'] as String,
    referee: json['referee'] as String,
    homeTeam: json['homeTeam'] as Map<String, dynamic>,
    awayTeam: json['awayTeam'] as Map<String, dynamic>,
    goalsHomeTeam: json['goalsHomeTeam'] as int,
    goalsAwayTeam: json['goalsAwayTeam'] as int,
    score: json['score'] as Map<String, dynamic>,
    eventDateStart: json['eventDateStart'] == null
        ? null
        : DateTime.parse(json['eventDateStart'] as String),
    eventDateEnd: json['eventDateEnd'] == null
        ? null
        : DateTime.parse(json['eventDateEnd'] as String),
    eventDay: json['eventDay'] as String,
  );
}

Map<String, dynamic> _$_$_FixtureToJson(_$_Fixture instance) =>
    <String, dynamic>{
      'fixture_id': instance.fixture_id,
      'league_id': instance.league_id,
      'league': instance.league,
      'event_date': instance.event_date,
      'event_timestamp': instance.event_timestamp,
      'firstHalfStart': instance.firstHalfStart,
      'secondHalfStart': instance.secondHalfStart,
      'round': instance.round,
      'status': instance.status,
      'statusShort': instance.statusShort,
      'elapsed': instance.elapsed,
      'venue': instance.venue,
      'referee': instance.referee,
      'homeTeam': instance.homeTeam,
      'awayTeam': instance.awayTeam,
      'goalsHomeTeam': instance.goalsHomeTeam,
      'goalsAwayTeam': instance.goalsAwayTeam,
      'score': instance.score,
      'eventDateStart': instance.eventDateStart?.toIso8601String(),
      'eventDateEnd': instance.eventDateEnd?.toIso8601String(),
      'eventDay': instance.eventDay,
    };
