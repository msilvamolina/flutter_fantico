import 'dart:collection';

import '../data/models/chat/chat.dart';
import '../data/models/fixture/fixture.dart';
import '../data/models/forecast/forecast.dart';
import '../data/models/league/league.dart';
import '../data/models/team/team.dart';
import '../data/models/user/user_local.dart';
import '../data/models/user_public/user_public.dart';
import '../data/models/user_streaks/user_streaks.dart';
import '../data/models/user_streaks_min/user_streaks_min.dart';
import 'utils.dart';

class Hacks {
  Map<int, bool> getMapBoolFromListInt(List<int> list) {
    Map<int, bool> map = HashMap();
    for (var i = 0; i < list.length; i++) {
      int _league = list[i];
      map[_league] = true;
    }
    return map;
  }

  List<Chat> getChatsAndDays(List<Chat> chats) {
    Map<String, String> mapDays = HashMap();
    Map<String, bool> mapDaysBool = HashMap();
    Map<String, String> mapUsers = HashMap();
    Map<String, bool> mapUsersBool = HashMap();
    List<Chat> chatsReturn = [];
    for (var i = 0; i < chats.length; i++) {
      String day = Utils().onlyDate(chats[i].createdDate);
      String id = chats[i].id;
      String email = chats[i].username;
      mapDays[day] = id;
      mapDaysBool[id] = false;
      mapUsers[email] = id;
      mapUsersBool[id] = false;
    }

    mapDays.forEach((_, value) {
      mapDaysBool[value] = true;
    });

    mapUsers.forEach((_, value) {
      mapUsersBool[value] = true;
    });

    for (var i = 0; i < chats.length; i++) {
      String id = chats[i].id;
      bool showDay = mapDaysBool[id];
      bool showUsername = showDay ? true : mapUsersBool[id];

      Chat _newChat = Chat.fromChat(chats[i], showDay, showUsername);
      chatsReturn.add(_newChat);
    }

    return chatsReturn;
  }

  Map<int, Forecast> forecastListToMap(List<Forecast> list, UserLocal user) {
    Map<int, Forecast> map = HashMap();

    if (user != null) {
      if (list != null) {
        for (int i = 0; i < list.length; i++) {
          Forecast b = list[i];
          if (b.userEmail == user.email) {
            map[b.fixture_id] = b;
          }
        }
      }
    }

    return map;
  }

  Map<String, UserPublic> userPublicListToMap(List<UserPublic> list) {
    Map<String, UserPublic> map = HashMap();
    if (list != null) {
      for (int i = 0; i < list.length; i++) {
        UserPublic b = list[i];
        map[b.email] = b;
      }
    }
    return map;
  }

  Map<int, Forecast> forecastUserListToMap(
      List<Forecast> list, String userEmail) {
    Map<int, Forecast> map = HashMap();
    if (list != null) {
      for (int i = 0; i < list.length; i++) {
        Forecast b = list[i];
        if (b.userEmail == userEmail) {
          map[b.fixture_id] = b;
        }
      }
    }
    return map;
  }

  List<Forecast> forecastToUserList(List<Forecast> list, String userEmail) {
    List<Forecast> forecast = [];

    if (list != null) {
      for (int i = 0; i < list.length; i++) {
        Forecast b = list[i];
        if (b.userEmail == userEmail) {
          forecast.add(b);
        }
      }
    }
    return forecast;
  }

  List<UserStreakMin> usersRachas(List<Forecast> list, DateTime startDate,
      DateTime endDate, String userEmail, bool isPositive, bool current) {
    Map<String, int> rachaNegativa = HashMap();
    Map<String, int> rachaPositiva = HashMap();

    if (list != null) {
      for (int i = 0; i < list.length; i++) {
        Forecast f = list[i];
        DateTime eventDate = DateTime.parse(f.event_date);
        bool incluirForecast = false;
        bool incluirForecastUser = true;

        if (userEmail != null) {
          incluirForecastUser = f.userEmail == userEmail;
        }

        if (startDate != null && endDate != null) {
          bool isAfterStartDate = !(eventDate.difference(startDate).isNegative);
          bool isBeforeEndDate = eventDate.difference(endDate).isNegative;
          incluirForecast = isAfterStartDate && isBeforeEndDate;
        }

        if (f.agregarAMiRacha &&
            f.closed &&
            incluirForecast &&
            incluirForecastUser) {
          bool resultRight = f.result == 'right';
          bool resultFailed = f.result == 'failed';
          String userEmail = f.userEmail;
          int rachaI = 1;

          if (rachaPositiva[userEmail] == null) {
            rachaPositiva[userEmail] = 0;
            rachaNegativa[userEmail] = 0;
          }
          if (resultRight) {
            //sumar a la racha positiva
            if (rachaNegativa[userEmail] == 0) {
              rachaPositiva[userEmail]++;
            } else {
              rachaPositiva[userEmail] = 1;
              if (!current) {
                rachaNegativa[userEmail + ':old:' + rachaI.toString()] =
                    rachaNegativa[userEmail];
                rachaI++;
              }
              rachaNegativa[userEmail] = 0;
            }
          } else if (resultFailed) {
            //sumar a la racha negativa
            if (rachaPositiva[userEmail] == 0) {
              rachaNegativa[userEmail]++;
            } else {
              rachaNegativa[userEmail] = 1;
              if (!current) {
                rachaPositiva[userEmail + ':old:' + rachaI.toString()] =
                    rachaPositiva[userEmail];
                rachaI++;
              }
              rachaPositiva[userEmail] = 0;
            }
          }
        }
      }
    }

    List<UserStreakMin> listStreaks = [];

    if (isPositive) {
      rachaPositiva.forEach((userEmail, streak) {
        var _var1 = userEmail.split(':old:');
        String _userEmail = _var1[0].trim();
        UserStreakMin _userStreakMin =
            UserStreakMin(userEmail: _userEmail, racha: streak);
        listStreaks.add(_userStreakMin);
      });
    } else {
      rachaNegativa.forEach((userEmail, streak) {
        var _var1 = userEmail.split(':old:');
        String _userEmail = _var1[0].trim();
        UserStreakMin _userStreakMin =
            UserStreakMin(userEmail: _userEmail, racha: streak);
        listStreaks.add(_userStreakMin);
      });
    }
    if (listStreaks.length > 0) {
      listStreaks.sort((b, a) => a.racha.compareTo(b.racha));
    }
    return listStreaks;
  }

  int getUserRacha(String type, List<Forecast> forecastList, String userEmail,
      bool isPositive, bool current) {
    DateTime date = DateTime.now();

    DateTime startDate, endDate;
    if (type == 'week') {
      int weekday = date.weekday;
      int weekStart = weekday - 1;
      int weekend = 7 - weekday;

      DateTime weekStartDate = date.add(Duration(days: -weekStart));
      DateTime weekEndDate = date.add(Duration(days: weekend));

      String _weekStartStr = Utils().onlyDate(weekStartDate);
      String _weekEndStr = Utils().onlyDate(weekEndDate);

      String _newWeekStartStr = _weekStartStr + " 00:00:00";
      String _newWeekEndStr = _weekEndStr + " 23:59:59";

      startDate = DateTime.parse(_newWeekStartStr);
      endDate = DateTime.parse(_newWeekEndStr);
    }
    if (type == 'month') {
      startDate = DateTime(date.year, date.month, 1);
      endDate = DateTime(date.year, date.month + 1, 1);
    }

    if (type == 'history') {
      startDate = DateTime.parse('2020-01-01 00:00:00');
      endDate = date.add(Duration(days: 1));
    }

    List<UserStreakMin> racha = [];
    if (startDate != null && endDate != null) {
      racha = usersRachas(
          forecastList, startDate, endDate, userEmail, isPositive, current);
    }

    int rachaForReturn = 0;

    if (racha.length > 0) {
      rachaForReturn = racha[0].racha ?? 0;
    }

    return rachaForReturn;
  }

  Map<String, UserLocal> userListToMap(List<UserLocal> list) {
    Map<String, UserLocal> map = HashMap();
    if (list != null) {
      for (int i = 0; i < list.length; i++) {
        UserLocal b = list[i];
        map[b.email] = b;
      }
    }
    return map;
  }

  Map<String, UserStreaks> usersAllStreakListToMap(List<UserStreaks> list) {
    Map<String, UserStreaks> map = HashMap();
    if (list != null) {
      for (int i = 0; i < list.length; i++) {
        UserStreaks b = list[i];
        map[b.userEmail + ':' + b.timeRange] = b;
      }
    }
    return map;
  }

  Map<String, Fixture> fixturesListToMap(List<Fixture> list) {
    Map<String, Fixture> map = HashMap();
    if (list != null) {
      for (int i = 0; i < list.length; i++) {
        Fixture b = list[i];
        map[b.fixture_id.toString()] = b;
      }
    }
    return map;
  }

  List<String> teamsListString(List<Team> list) {
    List<String> teamList = [];
    if (list != null) {
      for (int i = 0; i < list.length; i++) {
        Team b = list[i];
        teamList.add(b.name);
      }
    }
    return teamList;
  }

  Map<String, League> leaguesListToMap(List<League> list) {
    Map<String, League> map = HashMap();
    if (list != null) {
      for (int i = 0; i < list.length; i++) {
        League b = list[i];
        map[b.league_id.toString()] = b;
      }
    }
    return map;
  }

  Map<String, String> fixturesDayToMap(List<Fixture> list) {
    Map<String, String> daymap = HashMap();

    if (list != null) {
      for (int i = 0; i < list.length; i++) {
        Fixture b = list[i];

        if (daymap[b.eventDay] != null) {
          daymap[b.eventDay] += "-" + b.fixture_id.toString();
        } else {
          daymap[b.eventDay] = b.fixture_id.toString();
        }
      }
    }
    return daymap;
  }

  // Map<String, UserStreaks> userStreakListToMap(List<UserStreaks> list) {
  //   Map<String, UserStreaks> map = HashMap();
  //   if (list != null) {
  //     for (int i = 0; i < list.length; i++) {
  //       UserStreaks b = list[i];
  //       map[b.timeRange] = b;
  //     }
  //   }
  //   return map;
  // }

  // List<UserMin> getUserRacha(List<UserLocal> users, String type) {
  //   List<UserMin> listUsers = [];

  //   for (var i = 0; i < users.length; i++) {
  //     int racha = 0;
  //     UserLocal _user = users[i];
  //     if (type == 'month') {
  //       racha = _user.rachaMes;
  //     } else if (type == 'week') {
  //       racha = _user.rachaSemana;
  //     } else if (type == 'history') {
  //       racha = _user.rachaHistoria;
  //     }
  //     UserMin _userMin = UserMin(
  //       email: _user.email,
  //       username: _user.username,
  //       racha: racha,
  //       image: _user.image,
  //     );
  //     listUsers.add(_userMin);
  //   }
  //   listUsers.sort((b, a) => a.racha.compareTo(b.racha));
  //   return listUsers;
  // }

  List<Forecast> getForecastsFixture(List<Forecast> list, int fixture_id) {
    List<Forecast> forecasts = [];

    for (var i = 0; i < list.length; i++) {
      Forecast _f = list[i];

      if (_f.fixture_id == fixture_id) {
        forecasts.add(_f);
      }
    }
    return forecasts;
  }

  List<double> getPercentsFixture(List<Forecast> forecastList, int fixture_id) {
    List<Forecast> listForecast = getForecastsFixture(
      forecastList,
      fixture_id,
    );

    int fixtureCount = listForecast.length;
    double homeTeamWin = 0;
    double awayTeamWin = 0;
    if (fixtureCount > 0) {
      for (var i = 0; i < listForecast.length; i++) {
        Forecast _f = listForecast[i];
        if (_f.homeTeamWin) {
          homeTeamWin++;
        }
        if (_f.awayTeamWin) {
          awayTeamWin++;
        }
      }
    }
    double percentHomeTeam = (homeTeamWin * 100) / fixtureCount;
    double percentAwayTeam = (awayTeamWin * 100) / fixtureCount;

    return [percentHomeTeam, percentAwayTeam];
  }

  UserStreaks getHistoricStreak(
      Map<String, UserStreaks> map, String userEmail, bool positive) {
    List<UserStreaks> listStreak = [];
    map.forEach((_, streak) {
      if (streak.userEmail == userEmail) {
        listStreak.add(streak);
      }
    });

    if (listStreak.length > 0) {
      if (positive) {
        listStreak.sort((b, a) => a.streakPositive.compareTo(b.streakPositive));
      } else {
        listStreak.sort((b, a) => a.streakNegative.compareTo(b.streakNegative));
      }
      return listStreak[0];
    }
    return null;
  }

  List<Map> getFixturesReadys(
      String day,
      Map<String, String> fixtureDayMap,
      List<League> leagues,
      Map<String, Fixture> fixturesMap,
      Map<String, League> leaguesMap) {
    String fixturesStr = fixtureDayMap[day];
    var fixtureFromDay = fixturesStr.split("-");

    List<Map> listTotal = [];
    List<Fixture> listFixtureInCourse = [];
    List<Fixture> listFixtureFinished = [];
    List<Fixture> listFixtureNotStarted = [];
    List<Fixture> listFixturePostponed = [];

    DateTime now = DateTime.now();
    DateTime yesterday = now.add(Duration(days: -1));
    DateTime tomorrow = now.add(Duration(days: 1));

    bool isToday = Utils().onlyDate(now) == day;
    bool isYesterday = Utils().onlyDate(yesterday) == day;
    bool isTomorrow = Utils().onlyDate(tomorrow) == day;

    for (var i = 0; i < fixtureFromDay.length; i++) {
      String _fID = fixtureFromDay[i];
      Fixture _f = fixturesMap[_fID];

      int elapsed = _f.elapsed;

      bool isNotStarted = _f.status == 'Not Started';

      bool isFinished = _f.status == 'Match Finished';
      bool isPostponed = _f.status == 'Match Postponed';

      bool enCurso = elapsed > 0 && !isFinished && !isPostponed;
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
          listFixtureInCourse, leagues, fixturesMap, leaguesMap);

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
          listFixtureNotStarted, leagues, fixturesMap, leaguesMap);

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
          listFixturePostponed, leagues, fixturesMap, leaguesMap);

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
          listFixtureFinished, leagues, fixturesMap, leaguesMap);

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

  List<Map> orderListByLeagues(
      List<Fixture> list,
      List<League> leaguesEnabledList,
      Map<String, Fixture> fixturesMap,
      Map<String, League> leaguesMap) {
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
        League league = leaguesEnabledList[i];
        int leagueID = league.league_id;
        String fixturesList = arregloLeagues[leagueID] ?? '';
        if (fixturesList != '') {
          var _v1 = fixturesList.split('-');
          if (_v1.length > 0) {
            for (var i = 0; i < _v1.length; i++) {
              String _fID = _v1[i].trim();
              Fixture _f2 = fixturesMap[_fID];

              if (i == 0) {
                listFinal.add({
                  'tipo': 'LEAGUE',
                  'id': leagueID,
                  'child': leaguesMap[leagueID.toString()],
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
