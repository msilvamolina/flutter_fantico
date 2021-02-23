import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../domain/user_public_profile/user_public_profile_failure.dart';
import '../../models/user/user_local.dart';

class UserPublicProfileRepository {
  final FirebaseFirestore _firebaseFirestore = Get.find<FirebaseFirestore>();

  Future<Either<UserPublicProfileFailure, UserLocal>> getUser(
      String userEmail) async {
    try {
      final snapshot =
          await _firebaseFirestore.collection('users').doc(userEmail).get();
      return right(UserLocal.fromFirestore(snapshot));
    } catch (e) {
      return left(const UserPublicProfileFailure.unexpected());
    }
  }
}
