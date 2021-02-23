// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_public.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserPublic _$_$_UserPublicFromJson(Map<String, dynamic> json) {
  return _$_UserPublic(
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
    sport: json['sport'] as String,
    team: json['team'] as String,
    createdDate: json['createdDate'] == null
        ? null
        : DateTime.parse(json['createdDate'] as String),
  );
}

Map<String, dynamic> _$_$_UserPublicToJson(_$_UserPublic instance) =>
    <String, dynamic>{
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
      'sport': instance.sport,
      'team': instance.team,
      'createdDate': instance.createdDate?.toIso8601String(),
    };
