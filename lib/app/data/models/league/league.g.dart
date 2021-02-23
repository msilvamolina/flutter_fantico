// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'league.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_League _$_$_LeagueFromJson(Map<String, dynamic> json) {
  return _$_League(
    league_id: json['league_id'] as int,
    name: json['name'] as String,
    active: json['active'] as bool,
    country: json['country'] as String,
    country_code: json['country_code'] as String,
    coverage: json['coverage'] as Map<String, dynamic>,
    createdDate: json['createdDate'] == null
        ? null
        : DateTime.parse(json['createdDate'] as String),
    flag: json['flag'] as String,
    is_current: json['is_current'] as int,
    logo: json['logo'] as String,
    order: json['order'] as int,
    season: json['season'] as int,
    season_start: json['season_start'] as String,
    season_end: json['season_end'] as String,
    standings: json['standings'] as int,
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$_$_LeagueToJson(_$_League instance) => <String, dynamic>{
      'league_id': instance.league_id,
      'name': instance.name,
      'active': instance.active,
      'country': instance.country,
      'country_code': instance.country_code,
      'coverage': instance.coverage,
      'createdDate': instance.createdDate?.toIso8601String(),
      'flag': instance.flag,
      'is_current': instance.is_current,
      'logo': instance.logo,
      'order': instance.order,
      'season': instance.season,
      'season_start': instance.season_start,
      'season_end': instance.season_end,
      'standings': instance.standings,
      'type': instance.type,
    };
