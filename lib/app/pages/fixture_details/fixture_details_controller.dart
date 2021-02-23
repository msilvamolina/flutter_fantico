import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../data/models/fixture/fixture.dart';
import '../../data/models/forecast/forecast.dart';
import '../../data/models/user/user_local.dart';
import '../../data/providers/local/local_storage.dart';
import '../../data/repositories/fixture/fixture_repository.dart';
import '../../domain/fixture/fixture_elements.dart';
import '../../domain/fixture/fixture_failure.dart';
import '../../routes/app_routes.dart';
import '../../utils/hacks.dart';
import '../../utils/utils.dart';
import '../home/home_controller.dart';
import 'widgets/score_wheel_widget.dart';

class FixtureDetailsController extends GetxController {
  final FixtureRepository _fixtureRepository = FixtureRepository();

  final LocalStorage _localStorage = Get.find<LocalStorage>();
  final HomeController _homeController = Get.find<HomeController>();

  Fixture fixture;

  bool _selectorPosition = false;
  bool get selectorPosition => _selectorPosition;

  bool _selectorActive = false;
  bool get selectorActive => _selectorActive;

  bool _selectorActivePrev = false;

  bool _showPercent = true;
  bool get showPercent => _showPercent;

  int _homeScore;
  int get homeScore => _homeScore;

  int _awayScore;
  int get awayScore => _awayScore;

  bool _agregarAMiRacha = false;
  bool get agregarAMiRacha => _agregarAMiRacha;

  bool _sePuedeUsarRacha = true;
  bool get sePuedeUsarRacha => _sePuedeUsarRacha;

  bool _forecastExist = false;
  bool get forecastExist => _forecastExist;

  bool _tie = false;
  bool get tie => _tie;

  bool _showScreen = false;
  bool get showScreen => _showScreen;

  Forecast _forecast;

  bool _editForm = true;
  bool get editForm => _editForm;

  List<double> _percents = [0, 0];
  List<double> get percents => _percents;

  @override
  void onInit() {
    fixture = Get.arguments as Fixture;

    calculatePercents();
    checkEditOption();
    checkForecastSave();
    checkStreakSave();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void calculatePercents() {
    _percents = Hacks()
        .getPercentsFixture(_homeController.forecastList, fixture.fixture_id);
  }

  void checkEditOption() {
    int elapsed = fixture.elapsed;

    _editForm = elapsed == 0 && fixture.status == 'Not Started';
  }

  void checkForecastSave() async {
    _forecast = _homeController.forecastUserMap[fixture.fixture_id];

    if (_forecast != null) {
      _forecastExist = true;
      _selectorPosition = _forecast.awayTeamWin;
      _homeScore = _forecast.predecirResultado ? _forecast.homeScore : null;
      _awayScore = _forecast.predecirResultado ? _forecast.awayScore : null;
      _agregarAMiRacha = _forecast.agregarAMiRacha;
      _tie = _forecast.tie;
      _showScreen = true;
      _selectorActive = !_tie;
      update();
    }
  }

  void checkStreakSave() async {
    String day = Utils().onlyDate(DateTime.now());
    int rachaFixtureID = await _localStorage.getStreakUsed(day);

    if (rachaFixtureID > 0) {
      if (rachaFixtureID != fixture.fixture_id) {
        _sePuedeUsarRacha = false;
        update();
      }
    }
  }

  void onHomeClick(context) {
    if (_editForm) {
      _selectorPosition = false;
      _selectorActive = true;
      _showScreen = true;
      _tie = false;
      update();
    } else {
      FixtureElements().showSnackbar();
    }
  }

  void onAwayClick(context) {
    if (_editForm) {
      _selectorPosition = true;
      _selectorActive = true;
      _showScreen = true;
      _tie = false;
      update();
    } else {
      FixtureElements().showSnackbar();
    }
  }

  void onScorePressed(context) {
    if (_editForm) {
      if (_showScreen) {
        Get.bottomSheet(ScoreWheelWidget());
      }
    } else {
      FixtureElements().showSnackbar();
    }
  }

  void onHomeScoreChanged(dynamic score) {
    try {
      _homeScore = int.parse(score.toString());
    } catch (e) {}
    update();
  }

  void onAwayScoreChanged(dynamic score) {
    try {
      _awayScore = int.parse(score.toString());
    } catch (e) {}
    update();
  }

  void onTiePressed(context) {
    if (_editForm) {
      _tie = !_tie;
      if (_tie) {
        _showScreen = true;
        _selectorActivePrev = _selectorActive;
        _selectorActive = false;
      } else {
        _selectorActive = _selectorActivePrev;
        _showScreen = _selectorActive;
      }

      update();
    } else {
      FixtureElements().showSnackbar();
    }
  }

  void onAgregarRachaPressed(context) {
    if (_editForm) {
      _agregarAMiRacha = !_agregarAMiRacha;
      update();
    } else {
      FixtureElements().showSnackbar();
    }
  }

  void goToChatFixture() =>
      Get.toNamed(AppRoutes.FIXTURE_CHAT, arguments: fixture);

  void saveForecast(context) async {
    if (_editForm) {
      if (_showScreen) {
        bool homeTeamWin = _selectorPosition == false;
        bool awayTeamWin = _selectorPosition == true;
        bool predecirResultado = false;
        bool _continued = true;

        if (_tie) {
          homeTeamWin = false;
          awayTeamWin = false;
        }

        if (_homeScore != null && _awayScore != null) {
          predecirResultado = true;
          if (homeTeamWin) {
            if (_awayScore >= _homeScore) {
              _continued = false;
              FixtureElements().progressFailure(
                  context, FixtureFailure.forecastScoreError());
            }
          }
          if (awayTeamWin) {
            if (_awayScore <= _homeScore) {
              _continued = false;
              FixtureElements().progressFailure(
                  context, FixtureFailure.forecastScoreError());
            }
          }
          if (_tie) {
            if (_awayScore != _homeScore) {
              _continued = false;
              FixtureElements().progressFailure(
                  context, FixtureFailure.forecastScoreError());
            }
          }
        }

        if (!sePuedeUsarRacha && agregarAMiRacha) {
          FixtureElements()
              .progressFailure(context, FixtureFailure.saveStreakError());
          _continued = false;
        }

        if (_continued) {
          UserLocal user = await _localStorage.getUser();
          String day = Utils().onlyDate(DateTime.now());

          String id = _forecastExist ? _forecast.id : Uuid().v4();

          DateTime createdDate =
              _forecastExist ? _forecast.createdDate : DateTime.now();

          Forecast forecast = Forecast(
            id: id,
            userEmail: user.email,
            fixture_id: fixture.fixture_id,
            league_id: fixture.league_id,
            league: fixture.league,
            homeTeam: fixture.homeTeam,
            awayTeam: fixture.awayTeam,
            event_date: fixture.event_date,
            event_day: Utils().onlyDateFromApiDate(fixture.event_date),
            venue: fixture.venue,
            agregarAMiRacha: agregarAMiRacha,
            awayScore: awayScore,
            awayTeamWin: awayTeamWin,
            homeScore: homeScore,
            homeTeamWin: homeTeamWin,
            updatedDate: DateTime.now(),
            createdDate: createdDate,
            predecirResultado: predecirResultado,
            tie: _tie,
          );

          FixtureElements().showSubmiting(context);
          Either<FixtureFailure, Unit> request =
              await _fixtureRepository.saveForecast(forecast);
          request.fold((failure) {
            FixtureElements().progressFailure(context, failure);
          }, (_) {
            _localStorage.saveForecast(forecast);
            _localStorage.saveForecastDayDone(day);

            if (sePuedeUsarRacha) {
              _localStorage.saveStreakUsed(
                  day, agregarAMiRacha ? fixture.fixture_id : 0);
            }
            FixtureElements().progressSuccess(context);
          });
        }
      } else {
        FixtureElements()
            .progressFailure(context, FixtureFailure.saveForecastError());
      }
    } else {
      FixtureElements().showSnackbar();
    }
  }
}
