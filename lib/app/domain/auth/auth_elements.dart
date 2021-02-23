import 'package:bmprogresshud/bmprogresshud.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';

class AuthElements {
  void showSnackbar() {
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

  void showSubmiting(context) {
    ProgressHud.of(context).show(ProgressHudType.loading, "Procesando...");
  }

  void progressSuccess(context) {
    ProgressHud.of(context)
        .showAndDismiss(ProgressHudType.success, "¡Hola!")
        .whenComplete(() {
      Get.back(result: 'ok');
    });
  }

  void progressFailure(context, failure) {
    ProgressHud.of(context).showAndDismiss(
      ProgressHudType.error,
      failure.maybeMap(
        cancelledByUser: (_) => 'Cancelado',
        metodoInicioDeSesionNoDisponible: (_) =>
            'El método de inicio de sesión no está disponible momentaneamente',
        serverError: (_) => 'Hubo un error en el servidor',
        emailAlreadyInUse: (_) =>
            'El email ingresado, ya se encuentra registrado',
        usernameAlreadyInUse: (_) =>
            'El nombre de usuario ingresado, ya se encuentra registrado',
        invalidEmailAndPasswordCombination: (_) =>
            'Los datos ingresados son inválidos',
        insufficientPermission: (_) =>
            'No tenés los permisos suficientes para realizar esta acción',
        unexpected: (_) => 'Ocurrió un error inesperado',
        unableToGetEmail: (_) =>
            'Necesitamos saber tu email para poder continuar',
        saveUserError: (_) => 'No pudimos guardar el usuario',
        getUsernameCloudErrorUnknow: (_) => 'No pudimos consultar el usuario',
        getUsernameCloudServerError: (_) =>
            'Ocurrió un error al consultar el usuario',
        fbOperationInProgress: (_) =>
            'Ya tenés una operación de login en progreso',
        orElse: () => 'Ocurrió un error inesperado',
      ),
    );
  }
}
