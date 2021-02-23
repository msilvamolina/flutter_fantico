import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart' show required;
import 'package:rxdart/rxdart.dart';

import '../../../domain/chat_failure/chat_failure.dart';
import '../../models/chat/chat.dart';
import '../../models/user/user_local.dart';

class FixtureChatRepository {
  final FirebaseFirestore _firebaseFirestore = Get.find<FirebaseFirestore>();

  Stream<Either<ChatFailure, List<Chat>>> getChats(
      {@required int fixture_id}) async* {
    try {
      int limit = 200;
      Stream<QuerySnapshot> snapshots = _firebaseFirestore
          .collection('fixtures')
          .doc(fixture_id.toString())
          .collection('chats')
          .orderBy('createdDate', descending: true)
          .limit(limit)
          .snapshots();

      yield* snapshots.map((snapshot) {
        return right<ChatFailure, List<Chat>>(
          snapshot.docs.map((doc) => Chat.fromFirestore(doc)).toList(),
        );
      }).onErrorReturnWith((e) {
        if (e is PlatformException && e.message.contains('PERMISSION_DENIED')) {
          return left(const ChatFailure.insufficientPermission());
        } else {
          return left(const ChatFailure.unexpected());
        }
      });
    } catch (e) {
      yield left(const ChatFailure.unexpected());
    }
  }

  Future<Either<ChatFailure, Unit>> saveMessage(
      int fixture_id, UserLocal user, String message) async {
    try {
      await _firebaseFirestore
          .collection('fixtures')
          .doc(fixture_id.toString())
          .collection('chats')
          .doc()
          .set({
        'fixture_id': fixture_id,
        'message': message,
        'userEmail': user.email,
        'username': user.username,
        'userImage': user.image,
        'createdDate': DateTime.now(),
      });
      return right(unit);
    } on PlatformException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        return left(const ChatFailure.insufficientPermission());
      } else {
        return left(const ChatFailure.unexpected());
      }
    }
  }
}
