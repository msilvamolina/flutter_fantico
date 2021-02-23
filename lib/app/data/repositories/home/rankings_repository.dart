import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

import '../../../domain/rankings/rankings_failure.dart';
import '../../models/user/user_local.dart';

class RankingsRepository {
  final FirebaseFirestore _firebaseFirestore = Get.find<FirebaseFirestore>();

  Stream<Either<RankingsFailure, List<UserLocal>>> getRankings() async* {
    try {
      Stream<QuerySnapshot> snapshots =
          _firebaseFirestore.collection('users').snapshots();

      yield* snapshots.map((snapshot) {
        return right<RankingsFailure, List<UserLocal>>(
          snapshot.docs.map((doc) => UserLocal.fromFirestore(doc)).toList(),
        );
      }).onErrorReturnWith((e) {
        if (e is PlatformException && e.message.contains('PERMISSION_DENIED')) {
          return left(const RankingsFailure.insufficientPermission());
        } else {
          return left(const RankingsFailure.unexpected());
        }
      });
    } catch (e) {
      yield left(const RankingsFailure.unexpected());
    }
  }
}
