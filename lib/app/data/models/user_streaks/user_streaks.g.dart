// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_streaks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserStreaks _$_$_UserStreaksFromJson(Map<String, dynamic> json) {
  return _$_UserStreaks(
    id: json['id'] as String,
    userEmail: json['userEmail'] as String,
    timeRange: json['timeRange'] as String,
    type: json['type'] as String,
    streakPositive: json['streakPositive'] as int,
    streakNegative: json['streakNegative'] as int,
    createdDate: json['createdDate'] == null
        ? null
        : DateTime.parse(json['createdDate'] as String),
    updatedDate: json['updatedDate'] == null
        ? null
        : DateTime.parse(json['updatedDate'] as String),
  );
}

Map<String, dynamic> _$_$_UserStreaksToJson(_$_UserStreaks instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userEmail': instance.userEmail,
      'timeRange': instance.timeRange,
      'type': instance.type,
      'streakPositive': instance.streakPositive,
      'streakNegative': instance.streakNegative,
      'createdDate': instance.createdDate?.toIso8601String(),
      'updatedDate': instance.updatedDate?.toIso8601String(),
    };
