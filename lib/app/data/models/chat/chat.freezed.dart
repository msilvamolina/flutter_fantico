// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Chat _$ChatFromJson(Map<String, dynamic> json) {
  return _Chat.fromJson(json);
}

/// @nodoc
class _$ChatTearOff {
  const _$ChatTearOff();

// ignore: unused_element
  _Chat call(
      {@required String id,
      @required int fixture_id,
      @required String message,
      @required String userEmail,
      @required String userImage,
      @required String username,
      @required DateTime createdDate,
      bool showDay,
      bool showUsername}) {
    return _Chat(
      id: id,
      fixture_id: fixture_id,
      message: message,
      userEmail: userEmail,
      userImage: userImage,
      username: username,
      createdDate: createdDate,
      showDay: showDay,
      showUsername: showUsername,
    );
  }

// ignore: unused_element
  Chat fromJson(Map<String, Object> json) {
    return Chat.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Chat = _$ChatTearOff();

/// @nodoc
mixin _$Chat {
  String get id;
  int get fixture_id;
  String get message;
  String get userEmail;
  String get userImage;
  String get username;
  DateTime get createdDate;
  bool get showDay;
  bool get showUsername;

  Map<String, dynamic> toJson();
  $ChatCopyWith<Chat> get copyWith;
}

/// @nodoc
abstract class $ChatCopyWith<$Res> {
  factory $ChatCopyWith(Chat value, $Res Function(Chat) then) =
      _$ChatCopyWithImpl<$Res>;
  $Res call(
      {String id,
      int fixture_id,
      String message,
      String userEmail,
      String userImage,
      String username,
      DateTime createdDate,
      bool showDay,
      bool showUsername});
}

/// @nodoc
class _$ChatCopyWithImpl<$Res> implements $ChatCopyWith<$Res> {
  _$ChatCopyWithImpl(this._value, this._then);

  final Chat _value;
  // ignore: unused_field
  final $Res Function(Chat) _then;

  @override
  $Res call({
    Object id = freezed,
    Object fixture_id = freezed,
    Object message = freezed,
    Object userEmail = freezed,
    Object userImage = freezed,
    Object username = freezed,
    Object createdDate = freezed,
    Object showDay = freezed,
    Object showUsername = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      fixture_id: fixture_id == freezed ? _value.fixture_id : fixture_id as int,
      message: message == freezed ? _value.message : message as String,
      userEmail: userEmail == freezed ? _value.userEmail : userEmail as String,
      userImage: userImage == freezed ? _value.userImage : userImage as String,
      username: username == freezed ? _value.username : username as String,
      createdDate:
          createdDate == freezed ? _value.createdDate : createdDate as DateTime,
      showDay: showDay == freezed ? _value.showDay : showDay as bool,
      showUsername:
          showUsername == freezed ? _value.showUsername : showUsername as bool,
    ));
  }
}

/// @nodoc
abstract class _$ChatCopyWith<$Res> implements $ChatCopyWith<$Res> {
  factory _$ChatCopyWith(_Chat value, $Res Function(_Chat) then) =
      __$ChatCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      int fixture_id,
      String message,
      String userEmail,
      String userImage,
      String username,
      DateTime createdDate,
      bool showDay,
      bool showUsername});
}

/// @nodoc
class __$ChatCopyWithImpl<$Res> extends _$ChatCopyWithImpl<$Res>
    implements _$ChatCopyWith<$Res> {
  __$ChatCopyWithImpl(_Chat _value, $Res Function(_Chat) _then)
      : super(_value, (v) => _then(v as _Chat));

  @override
  _Chat get _value => super._value as _Chat;

  @override
  $Res call({
    Object id = freezed,
    Object fixture_id = freezed,
    Object message = freezed,
    Object userEmail = freezed,
    Object userImage = freezed,
    Object username = freezed,
    Object createdDate = freezed,
    Object showDay = freezed,
    Object showUsername = freezed,
  }) {
    return _then(_Chat(
      id: id == freezed ? _value.id : id as String,
      fixture_id: fixture_id == freezed ? _value.fixture_id : fixture_id as int,
      message: message == freezed ? _value.message : message as String,
      userEmail: userEmail == freezed ? _value.userEmail : userEmail as String,
      userImage: userImage == freezed ? _value.userImage : userImage as String,
      username: username == freezed ? _value.username : username as String,
      createdDate:
          createdDate == freezed ? _value.createdDate : createdDate as DateTime,
      showDay: showDay == freezed ? _value.showDay : showDay as bool,
      showUsername:
          showUsername == freezed ? _value.showUsername : showUsername as bool,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Chat extends _Chat {
  const _$_Chat(
      {@required this.id,
      @required this.fixture_id,
      @required this.message,
      @required this.userEmail,
      @required this.userImage,
      @required this.username,
      @required this.createdDate,
      this.showDay,
      this.showUsername})
      : assert(id != null),
        assert(fixture_id != null),
        assert(message != null),
        assert(userEmail != null),
        assert(userImage != null),
        assert(username != null),
        assert(createdDate != null),
        super._();

  factory _$_Chat.fromJson(Map<String, dynamic> json) =>
      _$_$_ChatFromJson(json);

  @override
  final String id;
  @override
  final int fixture_id;
  @override
  final String message;
  @override
  final String userEmail;
  @override
  final String userImage;
  @override
  final String username;
  @override
  final DateTime createdDate;
  @override
  final bool showDay;
  @override
  final bool showUsername;

  @override
  String toString() {
    return 'Chat(id: $id, fixture_id: $fixture_id, message: $message, userEmail: $userEmail, userImage: $userImage, username: $username, createdDate: $createdDate, showDay: $showDay, showUsername: $showUsername)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Chat &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.fixture_id, fixture_id) ||
                const DeepCollectionEquality()
                    .equals(other.fixture_id, fixture_id)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.userEmail, userEmail) ||
                const DeepCollectionEquality()
                    .equals(other.userEmail, userEmail)) &&
            (identical(other.userImage, userImage) ||
                const DeepCollectionEquality()
                    .equals(other.userImage, userImage)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.showDay, showDay) ||
                const DeepCollectionEquality()
                    .equals(other.showDay, showDay)) &&
            (identical(other.showUsername, showUsername) ||
                const DeepCollectionEquality()
                    .equals(other.showUsername, showUsername)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(fixture_id) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(userEmail) ^
      const DeepCollectionEquality().hash(userImage) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(showDay) ^
      const DeepCollectionEquality().hash(showUsername);

  @override
  _$ChatCopyWith<_Chat> get copyWith =>
      __$ChatCopyWithImpl<_Chat>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ChatToJson(this);
  }
}

abstract class _Chat extends Chat {
  const _Chat._() : super._();
  const factory _Chat(
      {@required String id,
      @required int fixture_id,
      @required String message,
      @required String userEmail,
      @required String userImage,
      @required String username,
      @required DateTime createdDate,
      bool showDay,
      bool showUsername}) = _$_Chat;

  factory _Chat.fromJson(Map<String, dynamic> json) = _$_Chat.fromJson;

  @override
  String get id;
  @override
  int get fixture_id;
  @override
  String get message;
  @override
  String get userEmail;
  @override
  String get userImage;
  @override
  String get username;
  @override
  DateTime get createdDate;
  @override
  bool get showDay;
  @override
  bool get showUsername;
  @override
  _$ChatCopyWith<_Chat> get copyWith;
}
