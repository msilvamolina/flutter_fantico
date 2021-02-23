import 'dart:collection';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../../data/models/fixture/fixture.dart';
import '../../../../data/models/forecast/forecast.dart';
import '../../../../data/repositories/fixture/fixture_repository.dart';
import '../../../../domain/fixture/fixture_failure.dart';
import '../../../../utils/hacks.dart';
import '../../../../utils/utils.dart';
import '../../home_controller.dart';

class PrincipalController extends GetxController {
  FixtureRepository _fixtureRepository = FixtureRepository();
  var mapListFixture = Map<String, List<Map>>().obs;

  Map<int, String> _mapDays = new HashMap();
  Map<int, String> get mapDays => _mapDays;
  Rx<Either<FixtureFailure, List<Fixture>>> fixtureListOrFailure =
      Rx<Either<FixtureFailure, List<Fixture>>>();
  Either<FixtureFailure, List<Fixture>> get fixtureOrFailure =>
      fixtureListOrFailure.value;

  HomeController homeController = Get.find<HomeController>();

  @override
  void onInit() {
    consultarDias();
    super.onInit();
  }

  List<Map<dynamic, dynamic>> getOrderFixturesFromDay(String day) {
    if (homeController != null) {
      if (homeController.fixtureDayMap != null &&
          homeController.fixtureDayMap[day] != null) {
        var leagues = homeController.leaguesList;
        var fixtures = homeController.fixturesMap;
        var fixtureDayMap = homeController.fixtureDayMap;
        var leaguesMap = homeController.leaguesMap;
        return Hacks().getFixturesReadys(
            day, fixtureDayMap, leagues, fixtures, leaguesMap);
      }
    }

    return [];
  }

  void consultarDias() {
    DateTime today = DateTime.now();
    DateTime yesterday = today.add(new Duration(days: -1));
    DateTime tomorrow = today.add(new Duration(days: 1));

    String todayStr = Utils().onlyDate(today);
    String yesterdayStr = Utils().onlyDate(yesterday);
    String tomorrowStr = Utils().onlyDate(tomorrow);

    _mapDays[0] = yesterdayStr;
    _mapDays[1] = todayStr;
    _mapDays[2] = tomorrowStr;
  }

  void onRefresh(String day) async {}

  int isForecastDone(int fixture_id) {
    int value = 0;
    if (homeController.forecastUserMap[fixture_id] != null) {
      Forecast _f = homeController.forecastUserMap[fixture_id];
      if (_f.homeTeamWin) {
        value = 1;
      }
      if (_f.awayTeamWin) {
        value = 2;
      }
      if (_f.tie) {
        value = 3;
      }
    }
    return value;
  }

  Forecast getForecast(int fixture_id) {
    return homeController.forecastUserMap[fixture_id];
  }

  List<double> getPercents(int fixture_id) {
    return Hacks().getPercentsFixture(homeController.forecastList, fixture_id);
  }
}
