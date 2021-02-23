import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repositories/auth/firebase_auth_repository.dart';
import '../../../domain/auth/auth_elements.dart';
import '../../../domain/auth/auth_failure.dart';
import '../../../domain/auth/value_objects.dart';
import '../../../routes/app_routes.dart';

class LoginController extends GetxController {
  final FirebaseAuthRepository _firebaseAuthRepository =
      Get.find<FirebaseAuthRepository>();
  EmailAddressOrUsename _emailAddressOrUsername = EmailAddressOrUsename('');
  Password _password = Password('');

  EmailAddressOrUsename get emailAddressorUsername => _emailAddressOrUsername;
  Password get password => _password;
  bool _showErrorMessages = false;
  bool get showErrorMessages => _showErrorMessages;

  GlobalObjectKey<FormState> _formKey;
  GlobalObjectKey<FormState> get formKey => _formKey;

  bool _obscureText = true;
  bool get obscureText => _obscureText;

  bool _invalidEmail = false;
  bool get invalidEmail => _invalidEmail;

  void goToForgotPassword() => Get.toNamed(AppRoutes.FORGOT_PASSWORD_NEW);

  @override
  void onInit() {
    _formKey = new GlobalObjectKey<FormState>('login');
    super.onInit();
  }

  void goToSignUp() async {
    final result = await Get.toNamed(AppRoutes.SIGNUP);
    if (result != null && result == 'ok') {
      Get.back(result: 'ok');
    }
  }

  void onEmailChanged(String text) {
    _emailAddressOrUsername = EmailAddressOrUsename(text);
    bool isEmail = text.contains('@');
    if (isEmail) {
      EmailAddress _email = EmailAddress(text.trim());
      _invalidEmail = !_email.isValid();
    } else {
      _invalidEmail = false;
    }
    update(['emailController']);
  }

  void onPasswordChanged(String text) {
    _password = Password(text);
    update(['passwordController']);
  }

  Future<void> signInWithEmailAndPassword(context) async {
    FocusScope.of(context).unfocus();
    _showErrorMessages = true;
    update();
    if (_emailAddressOrUsername.isValid() && _password.isValid()) {
      String _emailOrUsernameStr = _emailAddressOrUsername.getOrCrash();
      String _passwordStr = _password.getOrCrash();

      String _emailStr;

      bool isEmail = _emailOrUsernameStr.contains('@');

      if (isEmail) {
        EmailAddress _email = EmailAddress(_emailOrUsernameStr);
        if (_email.isValid()) {
          _emailStr = _email.getOrCrash();
          AuthElements().showSubmiting(context);
        } else {
          AuthElements().showSnackbar();
          _invalidEmail = true;
          update(['emailController']);
        }
      } else {
        AuthElements().showSubmiting(context);
        Either<AuthFailure, String> authFailureOrSuccessOption =
            await _firebaseAuthRepository.getEmailFromUsername(
                username: _emailOrUsernameStr.trim());
        authFailureOrSuccessOption.fold(
          (failure) => AuthElements().progressFailure(context, failure),
          (_cloudEmail) {
            if (_cloudEmail != 'NOT_FOUND' && _cloudEmail.contains('@')) {
              _emailStr = _cloudEmail;
            } else {
              AuthElements().progressFailure(
                  context, AuthFailure.invalidEmailAndPasswordCombination());
            }
          },
        );
      }

      if (_emailStr != null) {
        Either<AuthFailure, Unit> authFailureOrSuccessOption =
            await _firebaseAuthRepository.signInWithEmailAndPassword(
                emailAddress: _emailStr, password: _passwordStr);

        authFailureOrSuccessOption.fold(
          (failure) => AuthElements().progressFailure(context, failure),
          (_) => AuthElements().progressSuccess(context),
        );
      }
    } else {
      AuthElements().showSnackbar();
    }
  }

  Future<void> signInWithFacebookPressed(context) async {
    FocusScope.of(context).unfocus();
    AuthElements().showSubmiting(context);
    Either<AuthFailure, Unit> authFailureOrSuccessOption =
        await _firebaseAuthRepository.signInWithFacebook();
    authFailureOrSuccessOption.fold(
      (failure) => AuthElements().progressFailure(context, failure),
      (_) => AuthElements().progressSuccess(context),
    );
  }

  Future<void> signInWithGooglePressed(context) async {
    FocusScope.of(context).unfocus();
    AuthElements().showSubmiting(context);
    Either<AuthFailure, Unit> authFailureOrSuccessOption =
        await _firebaseAuthRepository.signInWithGoogle();
    authFailureOrSuccessOption.fold(
      (failure) => AuthElements().progressFailure(context, failure),
      (_) => AuthElements().progressSuccess(context),
    );
  }
}
