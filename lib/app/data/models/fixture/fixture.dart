import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fixture.freezed.dart';
part 'fixture.g.dart';

@freezed
abstract class Fixture implements _$Fixture {
  const Fixture._();
  factory Fixture.fromJson(Map<String, dynamic> json) =>
      _$FixtureFromJson(json);

  const factory Fixture({
    @required int fixture_id,
    @required int league_id,
    Map<String, dynamic> league,
    String event_date,
    int event_timestamp,
    int firstHalfStart,
    int secondHalfStart,
    String round,
    String status,
    String statusShort,
    int elapsed,
    String venue,
    String referee,
    Map<String, dynamic> homeTeam,
    Map<String, dynamic> awayTeam,
    int goalsHomeTeam,
    int goalsAwayTeam,
    Map<String, dynamic> score,
    DateTime eventDateStart,
    DateTime eventDateEnd,
    String eventDay,
  }) = _Fixture;

  factory Fixture.fromFirestore(DocumentSnapshot doc) {
    int fixture_id = 0;
    int league_id = 0;
    Map<String, dynamic> league = new HashMap();
    String event_date = "";
    int event_timestamp = 0;
    int firstHalfStart = 0;
    int secondHalfStart = 0;
    String round = "";
    String status = "";
    String statusShort = "";
    int elapsed = 0;
    String venue = "";
    String referee = "";
    Map<String, dynamic> homeTeam = new HashMap();
    Map<String, dynamic> awayTeam = new HashMap();
    int goalsHomeTeam = 0;
    int goalsAwayTeam = 0;
    Map<String, dynamic> score = new HashMap();
    DateTime createdDate;
    DateTime eventDateStart;
    DateTime eventDateEnd;
    String eventDay;

    try {
      fixture_id = int.parse((doc.data()['fixture_id'] ?? '0').toString());
    } catch (e) {}
    try {
      league_id = int.parse((doc.data()['league_id'] ?? '0').toString());
    } catch (e) {}

    if (doc.data()['league'] != null) {
      league = doc.data()['league'];
    }

    event_date = (doc.data()['event_date'] ?? '').toString();

    if (doc.data()['createdDate'] != null) {
      createdDate = doc.data()['createdDate'].toDate();
    }
    try {
      event_timestamp =
          int.parse((doc.data()['event_timestamp'] ?? '0').toString());
    } catch (e) {}

    try {
      firstHalfStart =
          int.parse((doc.data()['firstHalfStart'] ?? '0').toString());
    } catch (e) {}

    round = (doc.data()['round'] ?? '').toString();
    status = (doc.data()['status'] ?? '').toString();
    statusShort = (doc.data()['statusShort'] ?? '').toString();
    eventDay = (doc.data()['eventDay'] ?? '').toString();

    try {
      secondHalfStart =
          int.parse((doc.data()['secondHalfStart'] ?? '0').toString());
    } catch (e) {}
    try {
      elapsed = int.parse((doc.data()['elapsed'] ?? '0').toString());
    } catch (e) {}
    venue = (doc.data()['venue'] ?? '').toString();
    referee = (doc.data()['referee'] ?? '').toString();

    if (doc.data()['homeTeam'] != null) {
      homeTeam = doc.data()['homeTeam'];
    }
    if (doc.data()['awayTeam'] != null) {
      awayTeam = doc.data()['awayTeam'];
    }
    try {
      goalsHomeTeam =
          int.parse((doc.data()['goalsHomeTeam'] ?? '0').toString());
    } catch (e) {}
    try {
      goalsAwayTeam =
          int.parse((doc.data()['goalsAwayTeam'] ?? '0').toString());
    } catch (e) {}

    if (doc.data()['score'] != null) {
      score = doc.data()['score'];
    }

    if (doc.data()['createdDate'] != null) {
      createdDate = doc.data()['createdDate'].toDate();
    }

    if (doc.data()['eventDateStart'] != null) {
      eventDateStart = doc.data()['eventDateStart'].toDate();
    }

    if (doc.data()['eventDateEnd'] != null) {
      eventDateEnd = doc.data()['eventDateEnd'].toDate();
    }

    return Fixture(
      fixture_id: fixture_id,
      league_id: league_id,
      league: league,
      event_date: event_date,
      event_timestamp: event_timestamp,
      firstHalfStart: firstHalfStart,
      secondHalfStart: secondHalfStart,
      round: round,
      status: status,
      statusShort: statusShort,
      elapsed: elapsed,
      venue: venue,
      referee: referee,
      homeTeam: homeTeam,
      awayTeam: awayTeam,
      goalsHomeTeam: goalsHomeTeam,
      goalsAwayTeam: goalsAwayTeam,
      score: score,
      eventDateStart: eventDateStart,
      eventDateEnd: eventDateEnd,
      eventDay: eventDay,
    );
  }
}
