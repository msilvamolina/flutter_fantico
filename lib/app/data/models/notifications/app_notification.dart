import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_notification.freezed.dart';

@freezed
abstract class AppNotification implements _$AppNotification {
  const AppNotification._();

  const factory AppNotification({
    @required String id,
    @required String titulo,
    String mensaje,
    bool leida,
    String tipo,
    DateTime createdDate,
  }) = _AppNotification;

  factory AppNotification.fromFirestore(DocumentSnapshot doc) {
    DateTime createdDate;

    if (doc.data()['createdDate'] != null) {
      createdDate = doc.data()['createdDate'].toDate();
    }
    return AppNotification(
      id: doc.id,
      titulo: doc.data()['titulo'].toString() ?? '',
      mensaje: doc.data()['mensaje'].toString() ?? '',
      createdDate: createdDate ?? DateTime.now(),
    );
  }
}
