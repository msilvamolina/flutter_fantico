// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_local.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserLocal _$_$_UserLocalFromJson(Map<String, dynamic> json) {
  return _$_UserLocal(
    id: json['id'] as String,
    email: json['email'] as String,
    username: json['username'] as String,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    birthdate: json['birthdate'] == null
        ? null
        : DateTime.parse(json['birthdate'] as String),
    country: json['country'] as String,
    city: json['city'] as String,
    sex: json['sex'] as String,
    image: json['image'] as String,
    telephone: json['telephone'] as String,
    puntos: json['puntos'] as int,
    rachaMes: json['rachaMes'] as int,
    rachaSemana: json['rachaSemana'] as int,
    rachaHistoria: json['rachaHistoria'] as int,
    pronosticosAcertados: json['pronosticosAcertados'] as int,
    pronosticosFallados: json['pronosticosFallados'] as int,
    pronosticosAnulados: json['pronosticosAnulados'] as int,
    pronosticosPorcentajeAciertos:
        (json['pronosticosPorcentajeAciertos'] as num)?.toDouble(),
    perfilCompletado: json['perfilCompletado'] as bool,
    savePerfilFirstTime: json['savePerfilFirstTime'] == null
        ? null
        : DateTime.parse(json['savePerfilFirstTime'] as String),
    sport: json['sport'] as String,
    team: json['team'] as String,
    teamCompletado: json['teamCompletado'] as bool,
    saveTeamFirstTime: json['saveTeamFirstTime'] == null
        ? null
        : DateTime.parse(json['saveTeamFirstTime'] as String),
    createdDate: json['createdDate'] == null
        ? null
        : DateTime.parse(json['createdDate'] as String),
  );
}

Map<String, dynamic> _$_$_UserLocalToJson(_$_UserLocal instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'birthdate': instance.birthdate?.toIso8601String(),
      'country': instance.country,
      'city': instance.city,
      'sex': instance.sex,
      'image': instance.image,
      'telephone': instance.telephone,
      'puntos': instance.puntos,
      'rachaMes': instance.rachaMes,
      'rachaSemana': instance.rachaSemana,
      'rachaHistoria': instance.rachaHistoria,
      'pronosticosAcertados': instance.pronosticosAcertados,
      'pronosticosFallados': instance.pronosticosFallados,
      'pronosticosAnulados': instance.pronosticosAnulados,
      'pronosticosPorcentajeAciertos': instance.pronosticosPorcentajeAciertos,
      'perfilCompletado': instance.perfilCompletado,
      'savePerfilFirstTime': instance.savePerfilFirstTime?.toIso8601String(),
      'sport': instance.sport,
      'team': instance.team,
      'teamCompletado': instance.teamCompletado,
      'saveTeamFirstTime': instance.saveTeamFirstTime?.toIso8601String(),
      'createdDate': instance.createdDate?.toIso8601String(),
    };
