import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repositories/auth/firebase_auth_repository.dart';
import '../../../domain/auth/auth_elements.dart';
import '../../../domain/auth/auth_failure.dart';
import '../../../domain/auth/value_objects.dart';

class SignupController extends GetxController {
  final FirebaseAuthRepository _firebaseAuthRepository =
      Get.find<FirebaseAuthRepository>();
  bool _showPasswordNotMatchedError = true;
  bool _showErrorMessages = false;

  Username _username = Username('');
  Username get username => _username;

  EmailAddress _emailAddress = EmailAddress('');
  EmailAddress get emailAddress => _emailAddress;

  StrongPassword _password = StrongPassword('');
  StrongPassword get password => _password;

  StrongPassword _confirmPassword = StrongPassword('');
  StrongPassword get confirmPassword => _confirmPassword;

  bool get showPasswordNotMatchedError => _showPasswordNotMatchedError;
  bool get showErrorMessages => _showErrorMessages;

  bool _obscureText = true;
  bool get obscureText => _obscureText;

  bool _obscureText2 = true;
  bool get obscureText2 => _obscureText2;

  void onUsernameChanged(String text) {
    _username = Username(text);
    update(['usernameController']);
  }

  void onEmailChanged(String text) {
    _emailAddress = EmailAddress(text);
    update(['emailController']);
  }

  void onPasswordChanged(String text) {
    _password = StrongPassword(text);
    confirmPasswordMatched();
  }

  void onConfirmPasswordChanged(String text) {
    _confirmPassword = StrongPassword(text);
    confirmPasswordMatched();
  }

  void confirmPasswordMatched() {
    _showPasswordNotMatchedError = _password != _confirmPassword;
    update(['passwordController']);
  }

  Future<void> signUpWithEmailAndPassword(context) async {
    FocusScope.of(context).unfocus();
    _showErrorMessages = true;
    update();
    if (_username.isValid() &&
        _emailAddress.isValid() &&
        _password.isValid() &&
        !_showPasswordNotMatchedError) {
      AuthElements().showSubmiting(context);
      String _usernameStr = _username.getOrCrash().trim();
      String _emailStr = _emailAddress.getOrCrash().trim();
      String _passwordStr = _password.getOrCrash().trim();

      Either<AuthFailure, String> authFailureOrSuccessOption =
          await _firebaseAuthRepository.getEmailFromUsername(
              username: _usernameStr.trim());
      authFailureOrSuccessOption.fold(
        (failure) => AuthElements().progressFailure(context, failure),
        (_cloudEmail) async {
          if (_cloudEmail == 'NOT_FOUND') {
            Either<AuthFailure, Unit> authFailureOrSuccessOption =
                await _firebaseAuthRepository.registerWithEmailAndPassword(
              username: _usernameStr,
              emailAddress: _emailStr,
              password: _passwordStr,
            );

            authFailureOrSuccessOption.fold(
              (failure) => AuthElements().progressFailure(context, failure),
              (_) => AuthElements().progressSuccess(context),
            );
          } else {
            AuthElements()
                .progressFailure(context, AuthFailure.usernameAlreadyInUse());
          }
        },
      );
    } else {
      AuthElements().showSnackbar();
    }
  }
}
