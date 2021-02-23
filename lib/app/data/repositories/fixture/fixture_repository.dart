import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

import '../../../domain/fixture/fixture_failure.dart';
import '../../../utils/utils.dart';
import '../../models/fixture/fixture.dart';
import '../../models/forecast/forecast.dart';

class FixtureRepository {
  final FirebaseFirestore _firebaseFirestore = Get.find<FirebaseFirestore>();

  Stream<Either<FixtureFailure, List<Fixture>>> getFixtures(
      {Map<int, String> mapDays}) async* {
    try {
      DateTime today = DateTime.now();
      DateTime yesteday = today.add(new Duration(days: -1));
      DateTime tomorrow = today.add(new Duration(days: 2));

      String yestedayStr = Utils().onlyDate(yesteday);
      String tomorrowStr = Utils().onlyDate(tomorrow);

      DateTime dateTime = DateTime.parse('$yestedayStr 00:00:00');
      DateTime dateTime2 = DateTime.parse('$tomorrowStr 00:00:00');

      Stream<QuerySnapshot> snapshots = _firebaseFirestore
          .collection('fixtures')
          .where("eventDateStart", isGreaterThanOrEqualTo: dateTime)
          .where("eventDateStart", isLessThanOrEqualTo: dateTime2)
          .snapshots();

      yield* snapshots.map((snapshot) {
        return right<FixtureFailure, List<Fixture>>(
          snapshot.docs.map((doc) => Fixture.fromFirestore(doc)).toList(),
        );
      }).onErrorReturnWith((e) {
        if (e is PlatformException && e.message.contains('PERMISSION_DENIED')) {
          return left(const FixtureFailure.insufficientPermission());
        } else {
          return left(const FixtureFailure.unexpected());
        }
      });
    } catch (e) {
      yield left(const FixtureFailure.unexpected());
    }
  }

  Future<Either<FixtureFailure, Unit>> saveForecast(Forecast forecast) async {
    try {
      await _firebaseFirestore.collection('forecasts').doc(forecast.id).set({
        'fixture_id': forecast.fixture_id,
        'league_id': forecast.league_id,
        'league': forecast.league,
        'event_date': forecast.event_date,
        'event_day': forecast.event_day,
        'homeTeam': forecast.homeTeam,
        'awayTeam': forecast.awayTeam,
        'agregarAMiRacha': forecast.agregarAMiRacha,
        'homeTeamWin': forecast.homeTeamWin,
        'awayTeamWin': forecast.awayTeamWin,
        'predecirResultado': forecast.predecirResultado,
        'homeScore': forecast.homeScore,
        'awayScore': forecast.awayScore,
        'userEmail': forecast.userEmail,
        'venue': forecast.venue,
        'tie': forecast.tie,
        'createdDate': forecast.createdDate,
        'updatedDate': forecast.updatedDate,
      }, SetOptions(merge: true));
      return right(unit);
    } on PlatformException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        return left(const FixtureFailure.insufficientPermission());
      } else {
        return left(const FixtureFailure.unexpected());
      }
    }
  }
}
