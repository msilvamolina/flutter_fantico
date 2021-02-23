import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repositories/auth/firebase_auth_repository.dart';
import '../../../domain/auth/auth_elements.dart';
import '../../../domain/auth/auth_failure.dart';
import '../../../domain/auth/value_objects.dart';

class ForgotPasswordController extends GetxController {
  final FirebaseAuthRepository _firebaseAuthRepository =
      Get.find<FirebaseAuthRepository>();

  EmailAddressOrUsename _emailAddressOrUsername = EmailAddressOrUsename('');
  EmailAddressOrUsename get emailAddressorUsername => _emailAddressOrUsername;

  bool _showErrorMessages = false;
  bool get showErrorMessages => _showErrorMessages;

  bool _emailSubmit = false;
  bool get emailSubmit => _emailSubmit;

  bool _invalidEmail = false;
  bool get invalidEmail => _invalidEmail;

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

  Future<void> sendEmailForgotPassword(context) async {
    FocusScope.of(context).unfocus();
    _showErrorMessages = true;
    update();
    if (_emailAddressOrUsername.isValid()) {
      String _emailOrUsernameStr = _emailAddressOrUsername.getOrCrash();

      bool isEmail = _emailOrUsernameStr.contains('@');

      String _emailStr;
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
            await _firebaseAuthRepository.sendEmailResetPassword(
                emailAddress: _emailStr);

        authFailureOrSuccessOption.fold(
          (failure) => AuthElements().progressFailure(context, failure),
          (_) => AuthElements().progressSuccess(context),
        );
      }
    } else {
      AuthElements().showSnackbar();
    }
  }
}
