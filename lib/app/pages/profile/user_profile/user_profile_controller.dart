import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:bmprogresshud/bmprogresshud.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/models/user/user_local.dart';
import '../../../data/providers/local/local_storage.dart';
import '../../../data/repositories/user_profile/user_profile_repository.dart';
import '../../../domain/auth/auth_failure.dart';
import '../../../domain/auth/value_objects.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/utils.dart';
import '../../../widgets/dialogs/will_pop_scope_dialog.dart';

class UserProfileController extends GetxController {
  final UserProfileRepository _userProfileRepository = UserProfileRepository();
  final LocalStorage _localStorage = Get.find<LocalStorage>();

  bool _showErrorMessages = false;
  bool get showErrorMessages => _showErrorMessages;

  FirstName _firstName = FirstName('');
  FirstName get firstName => _firstName;

  LastName _lastName = LastName('');
  LastName get lastName => _lastName;

  int _minimoDeEdad = 10;
  int get minimoDeEdad => _minimoDeEdad;

  Birthdate _birthdate;
  Birthdate get birthdate => _birthdate;

  DateTime _birthdateDateTime;

  UserSex _userSex = UserSex('');
  UserSex get userSex => _userSex;

  Country _country = Country('');
  Country get country => _country;

  City _city = City('');
  City get city => _city;

  Telephone _telephone = Telephone('');
  Telephone get telephone => _telephone;

  String _userImageURL = '';
  String get userImageURL => _userImageURL;

  bool _usernameErrorMsg = false;
  bool get usernameErrorMsg => _usernameErrorMsg;

  int _puntos = 0;
  bool _perfilCompletado = false;
  DateTime _savePerfilFirstTime;

  TextEditingController _firstNameController;
  TextEditingController get firstNameController => _firstNameController;

  TextEditingController _lastNameController;
  TextEditingController get lastNameController => _lastNameController;

  TextEditingController _birthdateController;
  TextEditingController get birthdateController => _birthdateController;

  TextEditingController _userSexController;
  TextEditingController get userSexController => _userSexController;

  TextEditingController _countryController;
  TextEditingController get countryController => _countryController;

  TextEditingController _cityController;
  TextEditingController get cityController => _cityController;

  TextEditingController _telephoneController;
  TextEditingController get telephoneController => _telephoneController;

  List<String> userSexOptions = [
    'Hombre',
    'Mujer',
    'Otro',
    'Prefiero no decirlo',
  ];

  @override
  void onInit() {
    _firstNameController = new TextEditingController();
    _lastNameController = new TextEditingController();
    _countryController = new TextEditingController();
    _cityController = new TextEditingController();
    _telephoneController = new TextEditingController();
    _userSexController = new TextEditingController();
    _birthdateController = new TextEditingController();

    _birthdateDateTime = DateTime.now();
    _birthdate = Birthdate(_birthdateDateTime, _minimoDeEdad);

    filledForm();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void filledForm() async {
    UserLocal _user = await _localStorage.getUser();

    _userImageURL = _user.image ?? '';

    if (_user.perfilCompletado) {
      _firstName = FirstName(_user.firstName);
      _firstNameController.text = _user.firstName;

      _lastName = LastName(_user.lastName);
      _lastNameController.text = _user.lastName;

      // _userImage = ImageUrl(_user.image);
      _birthdate = Birthdate(_user.birthdate, _minimoDeEdad);
      _birthdateController.text = Utils().formatDate(_user.birthdate);
      _birthdateDateTime = _user.birthdate;

      _userSex = UserSex(_user.sex);
      _userSexController.text = _user.sex;

      _country = Country(_user.country);
      _countryController.text = _user.country;

      _city = City(_user.city);
      _cityController.text = _user.city;

      _telephone = Telephone(_user.telephone);
      _telephoneController.text = _user.telephone;

      _puntos = _user.puntos;
      _perfilCompletado = _user.perfilCompletado;
      _savePerfilFirstTime = _user.savePerfilFirstTime;
    }
    update();
  }

  Future<bool> closePage() async {
    bool _check = await WillPopScopeDialog().onWillPopScopeCall(Get.context);
    if (_check) {
      goBackandSave();
    }
    return _check;
  }

  void onFirstNameChanged(String text) {
    _firstName = FirstName(text);
    update(['fistNameUpdate']);
  }

  void onLastNameChanged(String text) {
    _lastName = LastName(text);
    update(['lastNameUpdate']);
  }

  void onBirthdateChanged(DateTime date) {
    _birthdate = Birthdate(date, _minimoDeEdad);
    _birthdateController.text = Utils().formatDate(date);
    _birthdateDateTime = date;
    update(['birthdateUpdate']);
  }

  void onUserSexChanged(String text) {
    _userSex = UserSex(text);
    _userSexController.text = text;
    update(['userSexUpdate']);
  }

  void onCountryChanged(String text) {
    _country = Country(text);
    update(['countryUpdate']);
  }

  void onCityChanged(String text) {
    _city = City(text);
    update(['cityUpdate']);
  }

  void onTelephoneChanged(String text) {
    _telephone = Telephone(text);
    update(['telephoneUpdate']);
  }

  void showDatePicker() {
    DatePicker.showDatePicker(
      Get.context,
      pickerTheme: DateTimePickerTheme(
          backgroundColor: Colors.grey[100],
          showTitle: true,
          confirm: Text('ACEPTAR', style: TextStyle(color: Colors.blue)),
          cancel: Text('CANCELAR', style: TextStyle(color: Colors.red)),
          itemTextStyle: TextStyle(color: Colors.grey[700])),
      minDateTime: DateTime.parse('1920-01-01'),
      maxDateTime: DateTime.now(),
      initialDateTime: _birthdateDateTime,
      dateFormat: 'yyyy-MMMM-dd',
      locale: DateTimePickerLocale.es,
      onConfirm: (dateTime, List<int> index) {
        onBirthdateChanged(dateTime);
      },
    );
  }

  void chooseUserSex() async {
    int result = await _addUserSexDialog();
    if (result != null) {
      String sexo = userSexOptions[result];
      onUserSexChanged(sexo);
    }
  }

  Future<int> _addUserSexDialog() async {
    final result = await showConfirmationDialog(
      title: "Elegí una opción",
      context: Get.context,
      cancelLabel: 'Cancelar',
      okLabel: 'Continuar',
      actions: [
        for (int index = 0; index < userSexOptions.length; index++)
          AlertDialogAction(
            key: index,
            label: userSexOptions[index],
          )
      ],
    );

    return result;
  }

  void choosePicture(BuildContext context) async {
    final picker = ImagePicker();
    File imageFile;
    try {
      int result = await _addImageDialog();

      if (result == 0) {
        final pickedFile = await picker.getImage(source: ImageSource.camera);
        imageFile = File(pickedFile.path);
      } else if (result == 1) {
        final pickedFile = await picker.getImage(source: ImageSource.gallery);
        imageFile = File(pickedFile.path);
      }

      if (imageFile != null) {
        cropPicture(context, imageFile);
      }
    } catch (e) {
      print(e);
    }
  }

  void cropPicture(BuildContext context, File imageFile) async {
    try {
      File croppedFile = await ImageCropper.cropImage(
          sourcePath: imageFile.path,
          maxWidth: 1024,
          maxHeight: 1024,
          cropStyle: CropStyle.circle,
          aspectRatioPresets: [CropAspectRatioPreset.square],
          androidUiSettings: AndroidUiSettings(
              toolbarTitle: 'Recortá la imagen',
              toolbarColor: Colors.purple,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.square,
              lockAspectRatio: true),
          iosUiSettings: const IOSUiSettings(
            minimumAspectRatio: 1.0,
            title: 'Recortá la imagen',
            doneButtonTitle: 'Guardar',
            cancelButtonTitle: 'Cancelar',
            aspectRatioLockEnabled: false,
            aspectRatioLockDimensionSwapEnabled: true,
            rectHeight: 1024,
            rectWidth: 1024,
          ));

      if (croppedFile != null) {
        saveImage(context, croppedFile);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<int> _addImageDialog() async {
    final result = await showConfirmationDialog(
      title: "Elegí una opción",
      context: Get.context,
      cancelLabel: 'Cancelar',
      okLabel: 'Continuar',
      actions: [
        AlertDialogAction(
          key: 0,
          label: 'Sacá una foto con tu cámara',
        ),
        AlertDialogAction(
          key: 1,
          label: 'Elegí una imagen de tu galería',
        ),
      ],
    );

    return result;
  }

  Future<void> saveImage(BuildContext context, File croppedFile) async {
    FocusScope.of(context).unfocus();

    UserLocal _userLocal = await _localStorage.getUser();

    if (_userLocal != null && croppedFile != null) {
      showSubmiting(context);

      Either<AuthFailure, String> authFailureOrSuccessOption =
          await _userProfileRepository.uploadImage(
        emailAddress: _userLocal.email,
        imageFile: croppedFile,
      );
      authFailureOrSuccessOption.fold(
        (failure) => progressFailure(context, failure),
        (imageURL) {
          if (imageURL != null && imageURL != "") {
            progressSuccess(context, false);
            _userImageURL = imageURL;
            update(["userImageUpdate"]);
          } else {
            progressFailure(context, AuthFailure.unexpected());
          }
        },
      );
    } else {
      Get.snackbar(
        'No pudimos subir tu imagen',
        'No pudimos subir tu imagen, inténtalo nuevamente más tarde',
        backgroundColor: Colors.white,
        colorText: AppColors.colorPrimary,
        icon: Image.asset('assets/pages/login/logo.png'),
        boxShadows: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(4, 4),
            blurRadius: 6,
            spreadRadius: 2,
          ),
        ],
      );
    }
  }

  Future<void> saveForm(context) async {
    FocusScope.of(context).unfocus();
    _showErrorMessages = true;
    update();

    UserLocal _userLocal = await _localStorage.getUser();

    if (_userLocal != null &&
        _firstName.isValid() &&
        _lastName.isValid() &&
        _birthdate.isValid() &&
        _userSex.isValid() &&
        _country.isValid() &&
        _city.isValid() &&
        _telephone.isValid() &&
        _userImageURL != '') {
      _usernameErrorMsg = false;
      showSubmiting(context);
      update();

      String _fistNameStr = _firstName.getOrCrash().trim();
      String _lastNameStr = _lastName.getOrCrash().trim();
      DateTime _birthdateDate = _birthdate.getOrCrash();
      String _userSexStr = _userSex.getOrCrash().trim();
      String _countryStr = _country.getOrCrash().trim();
      String _cityStr = _city.getOrCrash().trim();
      String _telephoneStr = _telephone.getOrCrash().trim();
      String _emailAddressStr = _userLocal.email;
      String _idStr = _userLocal.id;
      String usernameStr = _userLocal.username;

      DateTime _savePerfilFirstTimeDate = _perfilCompletado
          ? (_savePerfilFirstTime ?? DateTime.now())
          : DateTime.now();
      if (!_perfilCompletado) {
        _puntos = _puntos + 100;
      }

      int puntos = 0;
      bool perfilCompletado = false;
      DateTime savePerfilFirstTime;
      String sport = '';
      String team = '';
      DateTime saveTeamFirstTime;
      bool teamCompletado = false;

      UserLocal newUser = UserLocal(
        sport: _userLocal.sport,
        team: _userLocal.team,
        teamCompletado: _userLocal.teamCompletado,
        saveTeamFirstTime: _userLocal.saveTeamFirstTime,
        id: _idStr,
        username: usernameStr,
        image: _userImageURL,
        email: _emailAddressStr,
        firstName: _fistNameStr,
        lastName: _lastNameStr,
        birthdate: _birthdateDate,
        sex: _userSexStr,
        country: _countryStr,
        city: _cityStr,
        telephone: _telephoneStr,
        puntos: _puntos,
        savePerfilFirstTime: _savePerfilFirstTimeDate,
        perfilCompletado: true,
      );

      Either<AuthFailure, Unit> authFailureOrSuccessOption =
          await _userProfileRepository.saveProfile(user: newUser);

      authFailureOrSuccessOption.fold(
        (failure) => progressFailure(context, failure),
        (_) async {
          await _localStorage.saveUser(newUser);
          progressSuccess(context, true);
        },
      );
    } else {
      Get.snackbar(
        'Revisa los datos ingresados',
        'Detectamos uno o varios errores en el formulario',
        backgroundColor: Colors.white,
        colorText: AppColors.colorPrimary,
        icon: Image.asset('assets/pages/login/logo.png'),
        boxShadows: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(4, 4),
            blurRadius: 6,
            spreadRadius: 2,
          ),
        ],
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

  void goBackandSave() async {
    await _localStorage.saveUserProfileCompleted(true);
    Get.back(result: 'ok');
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
