import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/user/user_local.dart';
import '../../../data/repositories/auth/firebase_auth_repository.dart';
import '../../../domain/auth/auth_elements.dart';
import '../../../domain/auth/auth_failure.dart';
import '../../../domain/auth/value_objects.dart';
import '../../../domain/home/home_failure.dart';

class UsernameController extends GetxController {
  final FirebaseAuthRepository _firebaseAuthRepository =
      Get.find<FirebaseAuthRepository>();

  bool _showErrorMessages = false;
  bool get showErrorMessages => _showErrorMessages;

  Username _username = Username('');
  Username get username => _username;

  bool _usernameErrorMsg = false;
  bool get usernameErrorMsg => _usernameErrorMsg;

  HomeFailure _failure;
  UserLocal _userLocal;

  @override
  void onInit() {
    _failure = Get.arguments['failure'];
    _userLocal = Get.arguments['user'];

    super.onInit();
  }

  @override
  void onReady() {
    if (_failure == HomeFailure.usernameError()) {
      _usernameErrorMsg = true;
      update();
    }
    super.onReady();
  }

  void onUsernameChanged(String text) {
    _username = Username(text);
    update();
  }

  Future<void> createUsername(context) async {
    FocusScope.of(context).unfocus();
    _showErrorMessages = true;
    update();
    if (_username.isValid()) {
      _usernameErrorMsg = false;
      update();
      AuthElements().showSubmiting(context);
      String _usernameStr = _username.getOrCrash().trim();
      Either<AuthFailure, Unit> authFailureOrSuccessOption =
          await _firebaseAuthRepository.createUsername(
        username: _usernameStr,
        user: _userLocal,
      );
      authFailureOrSuccessOption.fold(
        (failure) => AuthElements().progressFailure(context, failure),
        (_) => AuthElements().progressSuccess(context),
      );
    } else {
      AuthElements().showSnackbar();
    }
  }
}
