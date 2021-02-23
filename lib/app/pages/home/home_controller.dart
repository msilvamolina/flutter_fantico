import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get_version/get_version.dart';

import '../../data/models/fixture/fixture.dart';
import '../../data/models/forecast/forecast.dart';
import '../../data/models/league/league.dart';
import '../../data/models/user/user_local.dart';
import '../../data/models/user_public/user_public.dart';
import '../../data/providers/local/local_storage.dart';
import '../../data/repositories/auth/firebase_auth_repository.dart';
import '../../data/repositories/home/home_repository.dart';
import '../../domain/home/home_failure.dart';
import '../../routes/app_routes.dart';
import '../../utils/hacks.dart';

class HomeController extends GetxController {
  final FirebaseAuthRepository _firebaseAuthRepository =
      Get.find<FirebaseAuthRepository>();
  final HomeRepository _homeRepository = HomeRepository();

  final LocalStorage _localStorage = Get.find<LocalStorage>();

  Option<Either<HomeFailure, Unit>> _optionHomeFailureOrUnit = none();
  Option<Either<HomeFailure, Unit>> get optionHomeFailureOrUnit =>
      _optionHomeFailureOrUnit;
  UserLocal _userLocal;
  UserLocal get userLocal => _userLocal;

  String _version;
  String get version => _version;

  Rx<List<Forecast>> _forecastsList = Rx<List<Forecast>>();
  List<Forecast> get forecastList => _forecastsList.value;
  Map<int, Forecast> get forecastUserMap =>
      Hacks().forecastListToMap(_forecastsList.value, _userLocal);

  Rx<List<UserPublic>> _usersPublicList = Rx<List<UserPublic>>();
  List<UserPublic> get usersPublicList => _usersPublicList.value;

  Map<String, UserPublic> get usersPublicMap =>
      Hacks().userPublicListToMap(_usersPublicList.value);

  Rx<List<League>> _leaguesList = Rx<List<League>>();
  List<League> get leaguesList => _leaguesList.value;

  Map<String, League> get leaguesMap =>
      Hacks().leaguesListToMap(_leaguesList.value);

  Rx<List<Fixture>> _fixturesList = Rx<List<Fixture>>();
  List<Fixture> get fixturesList => _fixturesList.value;

  Map<String, Fixture> get fixturesMap =>
      Hacks().fixturesListToMap(_fixturesList.value);

  Map<String, String> get fixtureDayMap =>
      Hacks().fixturesDayToMap(_fixturesList.value);

  void goToInfo() => Get.toNamed(AppRoutes.INFO);
  void goToNotifications() => Get.toNamed(AppRoutes.NOTIFICATIONS);

  @override
  void onReady() {
    start();
    super.onReady();
  }

  @override
  void onInit() {
    getVersion();
    super.onInit();
  }

  void start() {
    print('start');
    _optionHomeFailureOrUnit = none();
    update();
    checkLocalUser();
  }

  void getVersion() async {
    try {
      _version = await GetVersion.projectVersion;
      update(['versionController']);
    } catch (e) {
      print(e);
    }
  }

  void checkLocalUser() async {
    try {
      print('checkLocalUser');

      UserLocal user = await _homeRepository.getSignedInUser();
      if (user == null) {
        await Get.toNamed(AppRoutes.LOGIN);
        checkLocalUser();
      } else {
        checkFirebaseUser(user);
      }
    } catch (e) {
      print("error getSignedInUser");
    }
  }

  void checkFirebaseUser(UserLocal user) async {
    print('checkFirebaseUser');
    Either<HomeFailure, UserLocal> _getUserInformation =
        await _homeRepository.getUserInformation(user);

    _getUserInformation.fold((failure) async {
      if (failure == HomeFailure.usernameEmpty() ||
          failure == HomeFailure.usernameError()) {
        await Get.toNamed(AppRoutes.USERNAME, arguments: {
          'failure': failure,
          'user': user,
        });
        checkFirebaseUser(user);
      } else {
        _optionHomeFailureOrUnit = some(left(failure));
        update();
      }
    }, (__user) async {
      _userLocal = __user;
      update();
      checkEmailVerification();
    });
  }

  void checkEmailVerification() async {
    bool _check = _homeRepository.checkEmailVerification();
    if (!_check) {
      var result = await Get.toNamed(AppRoutes.EMAIL_VERIFICATION);

      if (result == 'cerrarSesion') {
        start();
      } else {
        checkEmailVerification();
      }
    } else {
      checkUserProfile();
    }
  }

  void checkUserProfile() async {
    if (!_userLocal.perfilCompletado) {
      bool _check = await _localStorage.getUserProfileCompleted();
      if (!_check) {
        var result = await Get.toNamed(AppRoutes.USER_PROFILE);
        if (result == 'ok') {
          _userLocal = await _localStorage.getUser();
          checkUserTeam();
        } else {
          checkUserProfile();
        }
      } else {
        checkUserTeam();
      }
    } else {
      checkUserTeam();
    }
  }

  void checkUserTeam() async {
    if (!_userLocal.teamCompletado) {
      bool _check = await _localStorage.getChooseTeamCompleted();
      if (!_check) {
        var result = await Get.toNamed(AppRoutes.CHOOSE_TEAM);
        if (result == 'ok') {
          _userLocal = await _localStorage.getUser();
          getAllForecast();
        } else {
          checkUserTeam();
        }
      } else {
        getAllForecast();
      }
    } else {
      getAllForecast();
    }
  }

  void getAllForecast() async {
    print('getAllForecast');
    _forecastsList.bindStream(_homeRepository.getAllForecasts());
    getAllUsers();
  }

  void getAllUsers() async {
    print('getAllUsers');
    _usersPublicList.bindStream(_homeRepository.getAllUsers());
    getAllLeagues();
  }

  void getAllLeagues() async {
    print('getAllLeagues');
    _leaguesList.bindStream(_homeRepository.getAllLeagues());
    getAllFixtures();
  }

  void getAllFixtures() async {
    print('getAllFixtures');
    _fixturesList.bindStream(_homeRepository.getAllFixtures());
    ready();
  }

  void ready() {
    print('ready');
    _optionHomeFailureOrUnit = some(right(unit));
    update();
  }

  Future<void> signOut() async {
    final result = await showOkCancelAlertDialog(
        title: "¿Estás seguro que querés salir?",
        isDestructiveAction: true,
        okLabel: "SALIR",
        context: Get.overlayContext,
        cancelLabel: "Cancelar");
    if (result != null) {
      if (result == OkCancelResult.ok) {
        try {
          await _firebaseAuthRepository.signOut();
        } catch (e) {}

        await _localStorage.cleanAll();
        start();
      }
    }
  }

  void goToPerfil() async {
    var result = await Get.toNamed(AppRoutes.USER_PROFILE);
    print(result);
    if (result == 'ok') {
      _userLocal = await _localStorage.getUser();
      update();
    }
  }

  void goToChooseTeam() async {
    var result = await Get.toNamed(AppRoutes.CHOOSE_TEAM);
    print(result);
    if (result == 'ok') {
      _userLocal = await _localStorage.getUser();
      update();
    }
  }
}
