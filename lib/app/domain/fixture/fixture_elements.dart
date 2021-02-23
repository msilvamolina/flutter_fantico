import 'package:bmprogresshud/bmprogresshud.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';

class FixtureElements {
  void showSnackbar() {
    Get.snackbar(
      'Ya no podés realizar cambios',
      'Cerramos la posibilidad de hacer un pronóstico para este partido',
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
        .showAndDismiss(ProgressHudType.success, "Guardado!")
        .whenComplete(() {
      Get.back(result: 'ok');
    });
  }

  void progressFailure(context, failure) {
    ProgressHud.of(context).showAndDismiss(
      ProgressHudType.error,
      failure.maybeMap(
        cancelledByUser: (_) => 'Cancelado',
        serverError: (_) => 'Hubo un error en el servidor',
        insufficientPermission: (_) =>
            'No tenés los permisos suficientes para realizar esta acción',
        unexpected: (_) => 'Ocurrió un error inesperado',
        saveUserError: (_) => 'No pudimos guardar el usuario',
        orElse: () => 'Ocurrió un error inesperado',
        saveForecastError: (_) => 'Necesitás indicar un ganador o empate',
        saveStreakError: (_) => 'Ya usaste tu racha hoy',
        fixtureFinalized: (_) =>
            'El partido ya finalizó, no podés hacer un pronóstico',
        forecastScoreError: (_) =>
            'El resultado tiene que coincidir con la elección anterior',
        forecastScoreTieError: (_) => 'No podés asignar un empate',
        unabledEditForm: (_) => 'No podés editar el formulario',
        unableSaveForecast: (_) =>
            'Ya no se puede hacer un pronóstico en este partido',
      ),
    );
  }
}
