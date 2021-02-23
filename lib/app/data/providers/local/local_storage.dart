import 'package:dartz/dartz.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/forecast/forecast.dart';
import '../../models/user/user_local.dart';

class LocalStorage {
  final GetStorage _getStorage = GetStorage();
  static const USERKEY = "USER";
  static const USERPROFILEKEY = "USERPROFILEKEY";
  static const CHOOSETEAMKEY = "CHOOSETEAMKEY";

  Future<void> cleanAll() async {
    await _getStorage.remove(USERKEY);
    await _getStorage.remove(USERPROFILEKEY);
    await _getStorage.erase();
  }

  Future<UserLocal> getUser() async {
    final _userJson = await _getStorage.read(USERKEY);
    if (_userJson != null) {
      try {
        UserLocal userLocal = UserLocal.fromJson(_userJson);
        return userLocal;
      } catch (_) {}
    }
    return null;
  }

  Future<Either<Unit, Unit>> saveUser(UserLocal user) async {
    try {
      await _getStorage.write(USERKEY, user.toJson());
      return right(unit);
    } catch (e) {
      return left(unit);
    }
  }

  Future<bool> getUserProfileCompleted() async {
    return await _getStorage.read(USERPROFILEKEY) ?? false;
  }

  Future<Either<Unit, Unit>> saveUserProfileCompleted(bool completed) async {
    try {
      await _getStorage.write(USERPROFILEKEY, completed);
      return right(unit);
    } catch (e) {
      return left(unit);
    }
  }

  Future<bool> getChooseTeamCompleted() async {
    return await _getStorage.read(CHOOSETEAMKEY) ?? false;
  }

  Future<Either<Unit, Unit>> saveChooseTeamCompleted(bool completed) async {
    try {
      await _getStorage.write(CHOOSETEAMKEY, completed);
      return right(unit);
    } catch (e) {
      return left(unit);
    }
  }

  Future<Forecast> getForecast(int id) async {
    final _forecastJson = await _getStorage.read("FORECAST_$id");
    if (_forecastJson != null) {
      try {
        Forecast userLocal = Forecast.fromJson(_forecastJson);
        return userLocal;
      } catch (_) {}
    }
    return null;
  }

  Future<Either<Unit, Unit>> saveForecast(Forecast forecast) async {
    try {
      await _getStorage.write(
          "FORECAST_${forecast.fixture_id}", forecast.toJson());
      return right(unit);
    } catch (e) {
      return left(unit);
    }
  }

  Future<int> getStreakUsed(String day) async {
    final _streakFixture = await _getStorage.read("STREAK_$day");
    if (_streakFixture != null) {
      try {
        return _streakFixture;
      } catch (_) {}
    }
    return 0;
  }

  Future<Either<Unit, Unit>> saveStreakUsed(String day, int fixture_id) async {
    try {
      await _getStorage.write("STREAK_$day", fixture_id);
      return right(unit);
    } catch (e) {
      return left(unit);
    }
  }

  Future<Either<Unit, Unit>> saveForecastDayDone(String day) async {
    try {
      await _getStorage.write("FORECASTDONE_$day", true);
      return right(unit);
    } catch (e) {
      return left(unit);
    }
  }

  Future<bool> getForecastDayDone(String day) async {
    final _forecastBool = await _getStorage.read("FORECASTDONE_$day");
    if (_forecastBool != null) {
      try {
        return _forecastBool;
      } catch (_) {}
    }
    return null;
  }
}
