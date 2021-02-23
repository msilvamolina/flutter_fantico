// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Forecast _$_$_ForecastFromJson(Map<String, dynamic> json) {
  return _$_Forecast(
    id: json['id'] as String,
    userEmail: json['userEmail'] as String,
    fixture_id: json['fixture_id'] as int,
    league_id: json['league_id'] as int,
    league: json['league'] as Map<String, dynamic>,
    homeTeam: json['homeTeam'] as Map<String, dynamic>,
    awayTeam: json['awayTeam'] as Map<String, dynamic>,
    event_date: json['event_date'] as String,
    event_day: json['event_day'] as String,
    venue: json['venue'] as String,
    agregarAMiRacha: json['agregarAMiRacha'] as bool,
    awayScore: json['awayScore'] as int,
    awayTeamWin: json['awayTeamWin'] as bool,
    homeScore: json['homeScore'] as int,
    homeTeamWin: json['homeTeamWin'] as bool,
    createdDate: json['createdDate'] == null
        ? null
        : DateTime.parse(json['createdDate'] as String),
    updatedDate: json['updatedDate'] == null
        ? null
        : DateTime.parse(json['updatedDate'] as String),
    predecirResultado: json['predecirResultado'] as bool,
    closed: json['closed'] as bool,
    result: json['result'] as String,
    resultScore: json['resultScore'] as String,
    tie: json['tie'] as bool,
  );
}

Map<String, dynamic> _$_$_ForecastToJson(_$_Forecast instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userEmail': instance.userEmail,
      'fixture_id': instance.fixture_id,
      'league_id': instance.league_id,
      'league': instance.league,
      'homeTeam': instance.homeTeam,
      'awayTeam': instance.awayTeam,
      'event_date': instance.event_date,
      'event_day': instance.event_day,
      'venue': instance.venue,
      'agregarAMiRacha': instance.agregarAMiRacha,
      'awayScore': instance.awayScore,
      'awayTeamWin': instance.awayTeamWin,
      'homeScore': instance.homeScore,
      'homeTeamWin': instance.homeTeamWin,
      'createdDate': instance.createdDate?.toIso8601String(),
      'updatedDate': instance.updatedDate?.toIso8601String(),
      'predecirResultado': instance.predecirResultado,
      'closed': instance.closed,
      'result': instance.result,
      'resultScore': instance.resultScore,
      'tie': instance.tie,
    };
