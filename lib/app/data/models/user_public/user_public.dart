import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_public.freezed.dart';
part 'user_public.g.dart';

@freezed
abstract class UserPublic implements _$UserPublic {
  const UserPublic._();
  factory UserPublic.fromJson(Map<String, dynamic> json) =>
      _$UserPublicFromJson(json);

  const factory UserPublic({
    @required String email,
    String username,
    String firstName,
    String lastName,
    DateTime birthdate,
    String country,
    String city,
    String sex,
    String image,
    String telephone,
    int puntos,
    String sport,
    String team,
    DateTime createdDate,
  }) = _UserPublic;

  factory UserPublic.fromFirestore(DocumentSnapshot doc) {
    String firstName = '';
    String lastName = '';
    DateTime birthdate;
    String country = '';
    String city = '';
    String sex = '';
    String image = '';
    String telephone = '';
    String email = '';
    String username = '';
    int puntos = 0;
    DateTime createdDate;
    String sport = '';
    String team = '';

    image = (doc.data()['image'] ?? '').toString();

    firstName = (doc.data()['firstName'] ?? '').toString();
    lastName = (doc.data()['lastName'] ?? '').toString();
    country = (doc.data()['country'] ?? '').toString();
    city = (doc.data()['city'] ?? '').toString();
    sex = (doc.data()['sex'] ?? '').toString();
    image = (doc.data()['image'] ?? '').toString();
    telephone = (doc.data()['telephone'] ?? '').toString();
    email = (doc.data()['email'] ?? '').toString();
    username = (doc.data()['username'] ?? '').toString();

    team = (doc.data()['team'] ?? '').toString();
    sport = (doc.data()['sport'] ?? '').toString();

    if (doc.data()['birthdate'] != null) {
      birthdate = doc.data()['birthdate'].toDate();
    }

    if (doc.data()['createdDate'] != null) {
      createdDate = doc.data()['createdDate'].toDate();
    }

    if (doc.data()['puntos'] != null) {
      try {
        puntos = int.parse((doc.data()['puntos'] ?? "0").toString());
      } catch (e) {}
    }

    return UserPublic(
      email: email,
      username: username,
      firstName: firstName,
      lastName: lastName,
      country: country,
      city: city,
      sex: sex,
      image: image,
      telephone: telephone,
      birthdate: birthdate,
      puntos: puntos,
      team: team,
      sport: sport,
      createdDate: createdDate,
    );
  }
}
