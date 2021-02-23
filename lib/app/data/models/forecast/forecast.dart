import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forecast.freezed.dart';
part 'forecast.g.dart';

@freezed
abstract class Forecast implements _$Forecast {
  const Forecast._();
  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  const factory Forecast({
    @required String id,
    @required String userEmail,
    @required int fixture_id,
    @required int league_id,
    Map<String, dynamic> league,
    Map<String, dynamic> homeTeam,
    Map<String, dynamic> awayTeam,
    String event_date,
    String event_day,
    String venue,
    bool agregarAMiRacha,
    int awayScore,
    bool awayTeamWin,
    int homeScore,
    bool homeTeamWin,
    DateTime createdDate,
    DateTime updatedDate,
    bool predecirResultado,
    bool closed,
    String result,
    String resultScore,
    bool tie,
  }) = _Forecast;

  factory Forecast.fromFirestore(DocumentSnapshot doc) {
    String userEmail = '';
    int fixture_id = 0;
    int league_id = 0;
    Map<String, dynamic> league;
    Map<String, dynamic> homeTeam;
    Map<String, dynamic> awayTeam;
    String event_date = "";
    String event_day = "";
    String venue = "";

    bool agregarAMiRacha = false;
    bool tie = false;

    int awayScore;
    bool awayTeamWin;
    int homeScore;
    bool homeTeamWin;
    DateTime createdDate, updatedDate;
    bool predecirResultado;
    bool closed;
    String result = "";
    String resultScore = "";

    agregarAMiRacha = (doc.data()['agregarAMiRacha'] ?? false);
    tie = (doc.data()['tie'] ?? false);

    closed = (doc.data()['closed'] ?? false);

    homeTeamWin = (doc.data()['homeTeamWin'] ?? false);
    awayTeamWin = (doc.data()['awayTeamWin'] ?? false);
    predecirResultado = (doc.data()['predecirResultado'] ?? false);

    userEmail = (doc.data()['userEmail'] ?? '').toString();
    venue = (doc.data()['venue'] ?? '').toString();

    result = (doc.data()['result'] ?? '').toString();
    resultScore = (doc.data()['resultScore'] ?? '').toString();
    event_date = (doc.data()['event_date'] ?? '').toString();
    event_day = (doc.data()['event_day'] ?? '').toString();

    venue = (doc.data()['venue'] ?? '').toString();

    createdDate = doc.data()['createdDate'].toDate();

    if (doc.data()['updatedDate'] != null) {
      updatedDate = doc.data()['updatedDate'].toDate();
    } else {
      updatedDate = createdDate;
    }

    try {
      awayScore = int.parse((doc.data()['awayScore'] ?? '0').toString());
    } catch (e) {}

    try {
      homeScore = int.parse((doc.data()['homeScore'] ?? '0').toString());
    } catch (e) {}

    try {
      fixture_id = int.parse((doc.data()['fixture_id'] ?? '0').toString());
    } catch (e) {}

    try {
      league_id = int.parse((doc.data()['league_id'] ?? '0').toString());
    } catch (e) {}

    if (doc.data()['league'] != null) {
      league = doc.data()['league'];
    }
    if (doc.data()['awayTeam'] != null) {
      awayTeam = doc.data()['awayTeam'];
    }
    if (doc.data()['homeTeam'] != null) {
      homeTeam = doc.data()['homeTeam'];
    }

    return Forecast(
      id: doc.id,
      userEmail: userEmail,
      fixture_id: fixture_id,
      league_id: league_id,
      league: league,
      homeTeam: homeTeam,
      awayTeam: awayTeam,
      event_date: event_date,
      event_day: event_day,
      venue: venue,
      agregarAMiRacha: agregarAMiRacha,
      awayScore: awayScore,
      awayTeamWin: awayTeamWin,
      homeScore: homeScore,
      homeTeamWin: homeTeamWin,
      createdDate: createdDate,
      predecirResultado: predecirResultado,
      updatedDate: updatedDate,
      closed: closed,
      result: result,
      resultScore: resultScore,
      tie: tie,
    );
  }
}
