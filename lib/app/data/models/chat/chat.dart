import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat.freezed.dart';
part 'chat.g.dart';

@freezed
abstract class Chat implements _$Chat {
  const Chat._();
  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);

  const factory Chat({
    @required String id,
    @required int fixture_id,
    @required String message,
    @required String userEmail,
    @required String userImage,
    @required String username,
    @required DateTime createdDate,
    bool showDay,
    bool showUsername,
  }) = _Chat;

  factory Chat.fromChat(Chat _chat, bool showDay, bool showUsername) {
    return Chat(
      id: _chat.id,
      fixture_id: _chat.fixture_id,
      message: _chat.message,
      userEmail: _chat.userEmail,
      userImage: _chat.userImage,
      username: _chat.username,
      createdDate: _chat.createdDate,
      showDay: showDay,
      showUsername: showUsername,
    );
  }

  factory Chat.fromFirestore(DocumentSnapshot doc) {
    int fixture_id = 0;
    String message = '';
    String userEmail = '';
    String userImage = '';
    String username = '';
    DateTime createdDate;

    message = (doc.data()['message'] ?? '').toString();
    userEmail = (doc.data()['userEmail'] ?? '').toString();
    userImage = (doc.data()['userImage'] ?? '').toString();
    username = (doc.data()['username'] ?? '').toString();

    if (doc.data()['createdDate'] != null) {
      createdDate = doc.data()['createdDate'].toDate();
    }

    if (doc.data()['fixture_id'] != null) {
      try {
        fixture_id = int.parse((doc.data()['fixture_id'] ?? "0").toString());
      } catch (e) {}
    }

    return Chat(
      id: doc.id,
      fixture_id: fixture_id,
      message: message,
      userEmail: userEmail,
      userImage: userImage,
      username: username,
      createdDate: createdDate,
      showDay: false,
      showUsername: false,
    );
  }
}
