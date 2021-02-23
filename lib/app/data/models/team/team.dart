import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'team.freezed.dart';
part 'team.g.dart';

@freezed
abstract class Team implements _$Team {
  const Team._();
  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);

  const factory Team({
    @required int team_id,
    @required String name,
    String country,
    int founded,
    bool is_national,
    int league,
    String logo,
    String venue_address,
    int venue_capacity,
    String venue_city,
    String venue_name,
    String venue_surface,
    DateTime createdDate,
  }) = _Team;

  factory Team.fromFirestore(DocumentSnapshot doc) {
    int team_id = 0;
    String name = '';
    String country = '';
    int founded = 0;
    bool is_national = false;
    int league = 0;
    String logo = '';
    String venue_address = '';
    int venue_capacity = 0;
    String venue_city = '';
    String venue_name = '';
    String venue_surface = '';
    DateTime createdDate;

    try {
      team_id = int.parse((doc.data()['team_id'] ?? '0').toString());
    } catch (e) {}

    name = (doc.data()['name'] ?? '').toString();
    country = (doc.data()['country'] ?? '').toString();

    try {
      founded = int.parse((doc.data()['founded'] ?? '0').toString());
    } catch (e) {}

    is_national = (doc.data()['is_national'] ?? false);

    try {
      league = int.parse((doc.data()['league'] ?? '0').toString());
    } catch (e) {}

    logo = (doc.data()['logo'] ?? '').toString();

    venue_address = (doc.data()['venue_address'] ?? '').toString();

    try {
      venue_capacity =
          int.parse((doc.data()['venue_capacity'] ?? '0').toString());
    } catch (e) {}

    venue_city = (doc.data()['venue_city'] ?? '').toString();
    venue_name = (doc.data()['venue_name'] ?? '').toString();
    venue_surface = (doc.data()['venue_surface'] ?? '').toString();

    createdDate = doc.data()['createdDate'].toDate();

    return Team(
      team_id: team_id,
      name: name,
      country: country,
      founded: founded,
      is_national: is_national,
      league: league,
      logo: logo,
      venue_address: venue_address,
      venue_capacity: venue_capacity,
      venue_city: venue_city,
      venue_name: venue_name,
      venue_surface: venue_surface,
      createdDate: createdDate,
    );
  }
}
