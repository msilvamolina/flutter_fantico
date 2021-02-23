import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'league.freezed.dart';
part 'league.g.dart';

@freezed
abstract class League implements _$League {
  const League._();
  factory League.fromJson(Map<String, dynamic> json) => _$LeagueFromJson(json);

  const factory League({
    @required int league_id,
    @required String name,
    bool active,
    String country,
    String country_code,
    Map<String, dynamic> coverage,
    DateTime createdDate,
    String flag,
    int is_current,
    String logo,
    int order,
    int season,
    String season_start,
    String season_end,
    int standings,
    String type,
  }) = _League;

  factory League.fromFirestore(DocumentSnapshot doc) {
    int league_id = 0;
    String name = "";
    bool active = false;
    String country = "";
    String country_code = "";
    Map<String, dynamic> coverage = new HashMap();
    DateTime createdDate;
    String flag = "";
    int is_current = 0;
    String logo = "";
    int order = 0;
    int season = 0;
    String season_start = "";
    String season_end = "";
    int standings = 0;
    String type = "";

    try {
      league_id = int.parse((doc.data()['league_id'] ?? '0').toString());
    } catch (e) {}

    name = (doc.data()['name'] ?? '').toString();
    active = (doc.data()['active'] ?? false);

    country = (doc.data()['country'] ?? '').toString();
    country_code = (doc.data()['country_code'] ?? '').toString();

    if (doc.data()['coverage'] != null) {
      coverage = doc.data()['coverage'];
    }

    if (doc.data()['createdDate'] != null) {
      createdDate = doc.data()['createdDate'].toDate();
    }

    flag = (doc.data()['flag'] ?? '').toString();

    try {
      is_current = int.parse((doc.data()['is_current'] ?? '0').toString());
    } catch (e) {}

    logo = (doc.data()['logo'] ?? '').toString();

    try {
      order = int.parse((doc.data()['order'] ?? '0').toString());
    } catch (e) {}

    try {
      season = int.parse((doc.data()['season'] ?? '0').toString());
    } catch (e) {}

    season_start = (doc.data()['season_start'] ?? '').toString();
    season_end = (doc.data()['season_end'] ?? '').toString();

    try {
      standings = int.parse((doc.data()['standings'] ?? '0').toString());
    } catch (e) {}

    type = (doc.data()['type'] ?? '').toString();

    return League(
      league_id: league_id,
      name: name,
      active: active,
      country: country,
      country_code: country_code,
      coverage: coverage,
      createdDate: createdDate,
      flag: flag,
      is_current: is_current,
      logo: logo,
      order: order,
      season: season,
      season_start: season_start,
      season_end: season_end,
      standings: standings,
      type: type,
    );
  }
}
