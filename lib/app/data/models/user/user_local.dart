import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_local.freezed.dart';
part 'user_local.g.dart';

@freezed
abstract class UserLocal implements _$UserLocal {
  const UserLocal._();
  factory UserLocal.fromJson(Map<String, dynamic> json) =>
      _$UserLocalFromJson(json);

  const factory UserLocal({
    @required String id,
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
    int rachaMes,
    int rachaSemana,
    int rachaHistoria,
    int pronosticosAcertados,
    int pronosticosFallados,
    int pronosticosAnulados,
    double pronosticosPorcentajeAciertos,
    bool perfilCompletado,
    DateTime savePerfilFirstTime,
    String sport,
    String team,
    bool teamCompletado,
    DateTime saveTeamFirstTime,
    DateTime createdDate,
  }) = _UserLocal;

  factory UserLocal.fromFirestore(DocumentSnapshot doc) {
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
    bool perfilCompletado = false;
    DateTime savePerfilFirstTime;
    DateTime createdDate;
    String sport = '';
    String team = '';
    DateTime saveTeamFirstTime;
    bool teamCompletado = false;
    int rachaMes = 0;
    int rachaSemana = 0;
    int rachaHistoria = 0;
    int pronosticosAcertados = 0;
    int pronosticosFallados = 0;
    int pronosticosAnulados = 0;
    double pronosticosPorcentajeAciertos = 0;
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
    perfilCompletado = doc.data()['perfilCompletado'] ?? false;
    teamCompletado = doc.data()['teamCompletado'] ?? false;

    team = (doc.data()['team'] ?? '').toString();
    sport = (doc.data()['sport'] ?? '').toString();

    if (doc.data()['birthdate'] != null) {
      birthdate = doc.data()['birthdate'].toDate();
    }

    if (doc.data()['saveTeamFirstTime'] != null) {
      saveTeamFirstTime = doc.data()['saveTeamFirstTime'].toDate();
    }

    if (doc.data()['createdDate'] != null) {
      createdDate = doc.data()['createdDate'].toDate();
    }
    if (doc.data()['savePerfilFirstTime'] != null) {
      savePerfilFirstTime = doc.data()['savePerfilFirstTime'].toDate();
    }

    if (doc.data()['puntos'] != null) {
      try {
        puntos = int.parse((doc.data()['puntos'] ?? "0").toString());
      } catch (e) {}
    }

    if (doc.data()['rachaSemana'] != null) {
      try {
        rachaSemana = int.parse((doc.data()['rachaSemana'] ?? "0").toString());
      } catch (e) {}
    }

    if (doc.data()['rachaMes'] != null) {
      try {
        rachaMes = int.parse((doc.data()['rachaMes'] ?? "0").toString());
      } catch (e) {}
    }

    if (doc.data()['rachaHistoria'] != null) {
      try {
        rachaHistoria =
            int.parse((doc.data()['rachaHistoria'] ?? "0").toString());
      } catch (e) {}
    }

    if (doc.data()['pronosticosAcertados'] != null) {
      try {
        pronosticosAcertados =
            int.parse((doc.data()['pronosticosAcertados'] ?? "0").toString());
      } catch (e) {}
    }

    if (doc.data()['pronosticosFallados'] != null) {
      try {
        pronosticosFallados =
            int.parse((doc.data()['pronosticosFallados'] ?? "0").toString());
      } catch (e) {}
    }

    if (doc.data()['pronosticosAnulados'] != null) {
      try {
        pronosticosAnulados =
            int.parse((doc.data()['pronosticosAnulados'] ?? "0").toString());
      } catch (e) {}
    }

    if (doc.data()['pronosticosPorcentajeAciertos'] != null) {
      try {
        pronosticosPorcentajeAciertos = double.parse(
            (doc.data()['pronosticosPorcentajeAciertos'] ?? "0").toString());
      } catch (e) {}
    }

    return UserLocal(
      id: doc.id,
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
      perfilCompletado: perfilCompletado,
      savePerfilFirstTime: savePerfilFirstTime,
      team: team,
      sport: sport,
      teamCompletado: teamCompletado,
      saveTeamFirstTime: saveTeamFirstTime,
      rachaSemana: rachaSemana,
      rachaMes: rachaMes,
      rachaHistoria: rachaHistoria,
      pronosticosAcertados: pronosticosAcertados,
      pronosticosFallados: pronosticosFallados,
      pronosticosAnulados: pronosticosAnulados,
      pronosticosPorcentajeAciertos: pronosticosPorcentajeAciertos,
      createdDate: createdDate,
    );
  }
}
