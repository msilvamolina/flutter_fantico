import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart' show required;

import '../../../domain/team/team_failure.dart';
import '../../models/team/team.dart';

class ChooseTeamRepository {
  final FirebaseFirestore _firebaseFirestore = Get.find<FirebaseFirestore>();

  Stream<List<Team>> getAllTeams() async* {
    try {
      Stream<QuerySnapshot> snapshots = _firebaseFirestore
          .collection('teams')
          .where('country', isEqualTo: "Colombia")
          .snapshots();

      yield* snapshots.map((snapshot) {
        List<Team> list =
            snapshot.docs.map((doc) => Team.fromFirestore(doc)).toList();
        return orderTeams(list);
      });
    } catch (e) {
      print(e);
    }
  }

  List<Team> orderTeams(List<Team> list) {
    list.sort((a, b) => a.name.compareTo(b.name));
    return list;
  }

  Future<Either<TeamFailure, Unit>> saveTeam({
    @required String email,
    @required String sport,
    @required String team,
    @required DateTime saveTeamFirstTime,
  }) async {
    try {
      await _firebaseFirestore.collection('users').doc(email).update({
        'sport': sport,
        'team': team,
        'updatedDate': DateTime.now(),
        'chooseTeamDate': DateTime.now(),
        'teamCompletado': true,
        'saveTeamFirstTime': saveTeamFirstTime,
      });
      return right(unit);
    } on PlatformException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        return left(const TeamFailure.insufficientPermission());
      } else {
        return left(const TeamFailure.unexpected());
      }
    }
  }
}
