// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Team _$_$_TeamFromJson(Map<String, dynamic> json) {
  return _$_Team(
    team_id: json['team_id'] as int,
    name: json['name'] as String,
    country: json['country'] as String,
    founded: json['founded'] as int,
    is_national: json['is_national'] as bool,
    league: json['league'] as int,
    logo: json['logo'] as String,
    venue_address: json['venue_address'] as String,
    venue_capacity: json['venue_capacity'] as int,
    venue_city: json['venue_city'] as String,
    venue_name: json['venue_name'] as String,
    venue_surface: json['venue_surface'] as String,
    createdDate: json['createdDate'] == null
        ? null
        : DateTime.parse(json['createdDate'] as String),
  );
}

Map<String, dynamic> _$_$_TeamToJson(_$_Team instance) => <String, dynamic>{
      'team_id': instance.team_id,
      'name': instance.name,
      'country': instance.country,
      'founded': instance.founded,
      'is_national': instance.is_national,
      'league': instance.league,
      'logo': instance.logo,
      'venue_address': instance.venue_address,
      'venue_capacity': instance.venue_capacity,
      'venue_city': instance.venue_city,
      'venue_name': instance.venue_name,
      'venue_surface': instance.venue_surface,
      'createdDate': instance.createdDate?.toIso8601String(),
    };
