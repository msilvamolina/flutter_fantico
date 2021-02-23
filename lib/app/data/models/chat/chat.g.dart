// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Chat _$_$_ChatFromJson(Map<String, dynamic> json) {
  return _$_Chat(
    id: json['id'] as String,
    fixture_id: json['fixture_id'] as int,
    message: json['message'] as String,
    userEmail: json['userEmail'] as String,
    userImage: json['userImage'] as String,
    username: json['username'] as String,
    createdDate: json['createdDate'] == null
        ? null
        : DateTime.parse(json['createdDate'] as String),
    showDay: json['showDay'] as bool,
    showUsername: json['showUsername'] as bool,
  );
}

Map<String, dynamic> _$_$_ChatToJson(_$_Chat instance) => <String, dynamic>{
      'id': instance.id,
      'fixture_id': instance.fixture_id,
      'message': instance.message,
      'userEmail': instance.userEmail,
      'userImage': instance.userImage,
      'username': instance.username,
      'createdDate': instance.createdDate?.toIso8601String(),
      'showDay': instance.showDay,
      'showUsername': instance.showUsername,
    };
