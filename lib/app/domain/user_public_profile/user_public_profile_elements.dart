import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';

class UserPublicProfileElements {
  void showSnackbar(failure) {
    Get.snackbar(
      'Ocurrió un error',
      failure.maybeMap(
        insufficientPermission: (_) =>
            'No tenés los permisos suficientes para realizar esta acción',
        unexpected: (_) => 'Ocurrió un error inesperado',
        unableToUpdate: (_) => 'No pudimos actualizar',
        orElse: () => 'Ocurrió un error inesperado',
      ),
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
