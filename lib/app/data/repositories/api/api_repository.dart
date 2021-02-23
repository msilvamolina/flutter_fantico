import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../utils/hacks.dart';
import '../../../utils/utils.dart';
import '../../models/fixture/fixture.dart';
import '../../models/league/league.dart';

class ApiRepository {
  static var client = http.Client();
  static var timezone = "america/bogota";

  Future<List<Map>> getFixtureDay(
      String day, List<int> leaguesEnabledList) async {
    String baseUrl = "api-football-v1.p.rapidapi.com";
    String reqUrl = "/v2/fixtures/date/" + day;

    Map<String, String> requestHeaders = {
      "x-rapidapi-key": "8450d3f157mshc1dd4dd475b7374p18b998jsn338fb83c600f",
      "x-rapidapi-host": "api-football-v1.p.rapidapi.com",
      "useQueryString": "true",
    };

    var queryParameters = {
      'timezone': timezone,
    };
    var uri = Uri.https(baseUrl, reqUrl, queryParameters);

    List<Map> fixtureMapList = [];
    var response = await client.get(uri, headers: requestHeaders);

    Map<int, bool> leaguesEnabledMap =
        Hacks().getMapBoolFromListInt(leaguesEnabledList);

    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      if (body["api"] != null) {
        var data = body["api"];
        var fixtures = data["fixtures"];
        if (fixtures != null) {
          List<Fixture> _fixtureList = [];
          try {
            for (var i = 0; i < fixtures.length; i++) {
              var _f = fixtures[i];
              int _l = _f['league_id'];

              if (leaguesEnabledMap[_l] != null &&
                  leaguesEnabledMap[_l] == true) {
                Fixture _fixture = Fixture.fromJson(fixtures[i]);
                _fixtureList.add(_fixture);
              }
            }
            if (_fixtureList.length > 0) {
              fixtureMapList =
                  ordenarLista(_fixtureList, leaguesEnabledList, day);
            }
          } catch (e) {
            print(e);
          }
        }
      }
      return fixtureMapList;
    } else {
      return null;
    }
  }

  List<Map> ordenarLista(
      List<Fixture> list, List<int> leaguesEnabledList, String day) {
    List<Map> listTotal = [];

    List<Fixture> listFixtureInCourse = [];
    List<Fixture> listFixtureFinished = [];
    List<Fixture> listFixtureNotStarted = [];
    List<Fixture> listFixturePostponed = [];

    Map<String, Fixture> fixturesMap = HashMap();

    DateTime now = DateTime.now();
    DateTime yesterday = now.add(Duration(days: -1));
    DateTime tomorrow = now.add(Duration(days: 1));

    bool isToday = Utils().onlyDate(now) == day;
    bool isYesterday = Utils().onlyDate(yesterday) == day;
    bool isTomorrow = Utils().onlyDate(tomorrow) == day;

    for (var i = 0; i < list.length; i++) {
      Fixture _f = list[i];
      String _fID = _f.fixture_id.toString();
      bool isNotStarted = _f.status == 'Not Started';

      bool isFinished = _f.status == 'Match Finished';
      bool isPostponed = _f.status == 'Match Postponed';

      bool enCurso = _f.elapsed > 0 && !isFinished && !isPostponed;

      fixturesMap[_fID] = _f;

      if (enCurso) {
        if (isToday) {
          listFixtureInCourse.add(_f);
        }
      }
      if (isPostponed) {
        listFixturePostponed.add(_f);
      }
      if (isFinished) {
        if (!isTomorrow) {
          listFixtureFinished.add(_f);
        }
      }
      if (isNotStarted) {
        if (!isYesterday) {
          listFixtureNotStarted.add(_f);
        }
      }
    }

    if (listFixtureInCourse.length > 0) {
      List<Map> newList = orderListByLeagues(
          listFixtureInCourse, leaguesEnabledList, fixturesMap);

      listTotal.add({
        'tipo': 'HEADER',
        'child': 'En curso',
      });

      for (var i = 0; i < newList.length; i++) {
        Map _m = newList[i];
        listTotal.add(_m);
      }
    }

    if (listFixtureNotStarted.length > 0) {
      List<Map> newList = orderListByLeagues(
          listFixtureNotStarted, leaguesEnabledList, fixturesMap);

      listTotal.add({
        'tipo': 'HEADER',
        'child': 'No empezados',
      });

      for (var i = 0; i < newList.length; i++) {
        Map _m = newList[i];
        listTotal.add(_m);
      }
    }

    if (listFixturePostponed.length > 0) {
      List<Map> newList = orderListByLeagues(
          listFixturePostponed, leaguesEnabledList, fixturesMap);

      listTotal.add({
        'tipo': 'HEADER',
        'child': 'Pospuestos',
      });

      for (var i = 0; i < newList.length; i++) {
        Map _m = newList[i];
        listTotal.add(_m);
      }
    }

    if (listFixtureFinished.length > 0) {
      List<Map> newList = orderListByLeagues(
          listFixtureFinished, leaguesEnabledList, fixturesMap);

      listTotal.add({
        'tipo': 'HEADER',
        'child': 'Finalizados',
      });

      for (var i = 0; i < newList.length; i++) {
        Map _m = newList[i];
        listTotal.add(_m);
      }
    }

    return listTotal;
  }

  List<Map> orderListByLeagues(List<Fixture> list, List<int> leaguesEnabledList,
      Map<String, Fixture> fixturesMap) {
    Map<int, String> arregloLeagues = new HashMap();
    List<Map> listFinal = [];

    for (var i = 0; i < list.length; i++) {
      Fixture _f = list[i];
      String _fID = _f.fixture_id.toString();
      int _lID = _f.league_id;
      String _anterior = arregloLeagues[_lID] ?? '';
      arregloLeagues[_lID] = _anterior != '' ? _anterior + '-' + _fID : _fID;
    }

    if (arregloLeagues != null) {
      for (var i = 0; i < leaguesEnabledList.length; i++) {
        int leagueID = leaguesEnabledList[i];
        String fixturesList = arregloLeagues[leagueID] ?? '';
        if (fixturesList != '') {
          var _v1 = fixturesList.split('-');
          if (_v1.length > 0) {
            for (var i = 0; i < _v1.length; i++) {
              String _fID = _v1[i].trim();
              Fixture _f2 = fixturesMap[_fID];
              if (i == 0) {
                League _l = League.fromJson(_f2.league);
                listFinal.add({
                  'tipo': 'LEAGUE',
                  'id': leagueID,
                  'child': _l,
                });
              }
              listFinal.add({
                'tipo': 'FIXTURE',
                'child': _f2,
              });
            }
          }
        }
      }
    }
    return listFinal;
  }
}
