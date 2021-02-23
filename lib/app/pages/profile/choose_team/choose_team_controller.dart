import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:bmprogresshud/bmprogresshud.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/cupertino_flutter_typeahead.dart';
import 'package:get/get.dart';

import '../../../data/models/team/team.dart';
import '../../../data/models/user/user_local.dart';
import '../../../data/providers/local/local_storage.dart';
import '../../../data/repositories/choose_team/choose_team_repository.dart';
import '../../../domain/auth/value_objects.dart';
import '../../../domain/team/team_failure.dart';
import '../../../utils/hacks.dart';
import '../../../widgets/dialogs/will_pop_scope_dialog.dart';

class ChooseTeamController extends GetxController {
  final ChooseTeamRepository _chooseTeamRepository = ChooseTeamRepository();
  final LocalStorage _localStorage = Get.find<LocalStorage>();
  var isLoading = true.obs;

  bool _showErrorMessages = false;
  bool get showErrorMessages => _showErrorMessages;

  Sport _sport = Sport('');
  Sport get sport => _sport;

  TeamObject _team = TeamObject('');
  TeamObject get team => _team;

  bool _usernameErrorMsg = false;
  bool get usernameErrorMsg => _usernameErrorMsg;

  final TextEditingController _sportController = TextEditingController();
  TextEditingController get sportController => _sportController;

  final TextEditingController _typeAheadController = TextEditingController();
  TextEditingController get typeAheadController => _typeAheadController;

  CupertinoSuggestionsBoxController _suggestionsBoxController =
      CupertinoSuggestionsBoxController();

  CupertinoSuggestionsBoxController get suggestionsBoxController =>
      _suggestionsBoxController;

  bool _teamCompletado = false;
  DateTime _saveTeamFirstTime;

  Rx<List<Team>> _teamList = Rx<List<Team>>();
  List<Team> get teamList => _teamList.value;

  List<String> get teamListString => Hacks().teamsListString(_teamList.value);

  @override
  void onInit() {
    filledForm();

    super.onInit();
  }

  @override
  void onReady() async {
    await getTeam();
    super.onReady();
  }

  Future<void> getTeam() async {
    _teamList.bindStream(_chooseTeamRepository.getAllTeams());
  }

  void filledForm() async {
    UserLocal _user = await _localStorage.getUser();
    if (_user.teamCompletado) {
      _sport = Sport(_user.sport);
      _sportController.text = _user.sport;

      _team = TeamObject(_user.team);
      _typeAheadController.text = _user.team;

      _saveTeamFirstTime = _user.saveTeamFirstTime;
    }
  }

  List<String> getSuggestions(String query) {
    List<String> matches = List();

    matches.addAll(teamListString);
    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

  Future<bool> closePage() async {
    bool _check = await WillPopScopeDialog().onWillPopScopeCall(Get.context);
    if (_check) {
      goBackandSave();
    }
    return _check;
  }

  void goBackandSave() async {
    await _localStorage.saveChooseTeamCompleted(true);
    Get.back(result: 'ok');
  }

  void onSportChanged(String text) {
    _sport = Sport(text);
    _sportController.text = text;
    update(['sportUpdate']);
  }

  void onTeamSelect(String text) {
    _team = TeamObject(text);
    _typeAheadController.text = text;
    update(['teamUpdate']);
  }

  void chooseSport() async {
    int result = await _chooseSportDialog();
    if (result != null) {
      String _sport = '';
      if (result == 0) {
        _sport = 'Fútbol';
      }
      onSportChanged(_sport);
    }
  }

  Future<int> _chooseSportDialog() async {
    final result = await showConfirmationDialog(
      title: "Elegí una opción",
      context: Get.context,
      cancelLabel: 'Cancelar',
      okLabel: 'Continuar',
      actions: [
        AlertDialogAction(
          key: 0,
          label: 'Fútbol',
        ),
      ],
    );

    return result;
  }

  Future<void> saveForm(context) async {
    FocusScope.of(context).unfocus();
    _showErrorMessages = true;
    update();

    UserLocal _userLocal = await _localStorage.getUser();
    if (_userLocal != null && _sport.isValid() && _team.isValid()) {
      _usernameErrorMsg = false;
      showSubmiting(context);
      update();
      String _sportStr = _sport.getOrCrash().trim();
      String _teamStr = _team.getOrCrash().trim();

      DateTime _saveTeamFirstTimeDate = _teamCompletado
          ? (_saveTeamFirstTime ?? DateTime.now())
          : DateTime.now();

      Either<TeamFailure, Unit> authFailureOrSuccessOption =
          await _chooseTeamRepository.saveTeam(
              saveTeamFirstTime: _saveTeamFirstTimeDate,
              email: _userLocal.email,
              sport: _sportStr,
              team: _teamStr);

      authFailureOrSuccessOption.fold(
        (failure) => progressFailure(context, failure),
        (_) async {
          UserLocal newUser = UserLocal(
            id: _userLocal.id,
            username: _userLocal.username,
            email: _userLocal.email,
            firstName: _userLocal.firstName,
            lastName: _userLocal.lastName,
            birthdate: _userLocal.birthdate,
            sex: _userLocal.sex,
            country: _userLocal.country,
            city: _userLocal.city,
            image: _userLocal.image,
            telephone: _userLocal.telephone,
            puntos: _userLocal.puntos,
            savePerfilFirstTime: _userLocal.savePerfilFirstTime,
            perfilCompletado: _userLocal.perfilCompletado,
            sport: _sportStr,
            team: _teamStr,
            saveTeamFirstTime: _saveTeamFirstTimeDate,
            teamCompletado: true,
          );
          await _localStorage.saveUser(newUser);
          progressSuccess(context, true);
        },
      );
    }
  }

  void showSubmiting(context) {
    ProgressHud.of(context).show(ProgressHudType.loading, "Procesando...");
  }

  void progressSuccess(context, bool goBack) {
    ProgressHud.of(context)
        .showAndDismiss(ProgressHudType.success, "¡Bien!")
        .whenComplete(() {
      if (goBack) {
        goBackandSave();
      }
    });
  }

  void progressFailure(context, failure) {
    ProgressHud.of(context).showAndDismiss(
      ProgressHudType.error,
      failure.maybeMap(
        cancelledByUser: (_) => 'Cancelado',
        usernameAlreadyExist: (_) => 'El usuario ingresado ya existe',
        serverError: (_) => 'Hubo un error en el servidor',
        emailAlreadyInUse: (_) =>
            'El email ingresado, ya se encuentra registrado',
        invalidEmailAndPasswordCombination: (_) =>
            'Los datos ingresados son inválidos',
        insufficientPermission: (_) =>
            'No tenés los permisos suficientes para realizar esta acción',
        unexpected: (_) => 'Ocurrió un error inesperado',
        unableToGetEmail: (_) =>
            'Necesitamos saber tu email para poder continuar',
        saveUserError: (_) => 'No pudimos guardar el usuario',
        orElse: () => 'Ocurrió un error inesperado',
      ),
    );
  }
}
