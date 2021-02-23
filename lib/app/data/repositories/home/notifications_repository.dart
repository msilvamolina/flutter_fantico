import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart' show required;
import 'package:rxdart/rxdart.dart';
import 'package:uuid/uuid.dart';

import '../../../domain/notifications/notifications_failure.dart';
import '../../models/notifications/app_notification.dart';

class NotificationsRepository {
  final FirebaseFirestore _firebaseFirestore = Get.find<FirebaseFirestore>();

  Stream<Either<NotificationsFailure, List<AppNotification>>> getNotifications(
      {@required String userEmail}) async* {
    try {
      int limit = 200;
      Stream<QuerySnapshot> snapshots = _firebaseFirestore
          .collection('users')
          .doc(userEmail)
          .collection('notifications')
          .orderBy('createdDate', descending: true)
          .limit(limit)
          .snapshots();

      yield* snapshots.map((snapshot) {
        return right<NotificationsFailure, List<AppNotification>>(
          snapshot.docs
              .map((doc) => AppNotification.fromFirestore(doc))
              .toList(),
        );
      }).onErrorReturnWith((e) {
        if (e is PlatformException && e.message.contains('PERMISSION_DENIED')) {
          return left(const NotificationsFailure.insufficientPermission());
        } else {
          return left(const NotificationsFailure.unexpected());
        }
      });
    } catch (e) {
      yield left(const NotificationsFailure.unexpected());
    }
  }

  Future<Either<NotificationsFailure, Unit>> markAsRead(
      {@required String userEmail}) async {
    try {
      Query consulta = _firebaseFirestore
          .collection('users')
          .doc(userEmail)
          .collection('notifications')
          .where('leida', isEqualTo: false);

      consulta.get().then((data) {
        for (var i = 0; i < data.docs.length; i++) {
          String documentID = data.docs[i].id;
          _firebaseFirestore
              .collection('users')
              .doc(userEmail)
              .collection('notifications')
              .doc(documentID)
              .update({
            "leida": true,
            "updateDate": DateTime.now(),
          });
        }
      });
      return right(unit);
    } on PlatformException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        return left(const NotificationsFailure.insufficientPermission());
      } else {
        return left(const NotificationsFailure.unexpected());
      }
    }
  }

  Future<Either<NotificationsFailure, Unit>> sendNotification(
      {@required String userEmail, @required String userNombre}) async {
    try {
      String codigo = Uuid().v4();
      String title = "Conocé más acerca de nuestra app.";
      String mensaje = userNombre +
          ", este es un mensaje generado automáticamente\n\n($codigo)";
      await _firebaseFirestore
          .collection('users')
          .doc(userEmail)
          .collection('notifications')
          .doc()
          .set({
        'titulo': title,
        'mensaje': mensaje,
        'createdDate': DateTime.now(),
        'leida': false,
      });
      return right(unit);
    } on PlatformException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        return left(const NotificationsFailure.insufficientPermission());
      } else {
        return left(const NotificationsFailure.unexpected());
      }
    }
  }
}
