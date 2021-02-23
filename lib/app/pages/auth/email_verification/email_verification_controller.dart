import 'dart:async';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:bmprogresshud/bmprogresshud.dart';
import 'package:get/get.dart';

import '../../../data/repositories/auth/firebase_auth_repository.dart';

class EmailVerificationController extends GetxController {
  final FirebaseAuthRepository _firebaseAuthRepository =
      Get.find<FirebaseAuthRepository>();

  void reenviarEmailVerification(context) {
    ProgressHud.of(context).show(ProgressHudType.loading, "Procesando...");
    _firebaseAuthRepository.reenviarEmailVerification();
    Timer(const Duration(milliseconds: 500), () {
      progressSuccess(context, "¡Email Enviado!", false);
    });
  }

  void checkEmailVerification(context) async {
    ProgressHud.of(context).show(ProgressHudType.loading, "Procesando...");

    bool check = await _firebaseAuthRepository.checkEmailVerification();
    if (check) {
      progressSuccess(context, "¡Listo!", true);
    } else {
      progressFailure(context);
    }
  }

  void progressSuccess(context, msg, bool back) {
    ProgressHud.of(context)
        .showAndDismiss(ProgressHudType.success, msg)
        .whenComplete(() {
      if (back) {
        Get.back(result: 'ok');
      }
    });
  }

  void progressFailure(context) {
    ProgressHud.of(context).showAndDismiss(ProgressHudType.error,
        "Necesitás verificar tu cuenta de email para continuar");
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
          Get.back(result: 'cerrarSesion');
        } catch (e) {}
      }
    }
  }
}
