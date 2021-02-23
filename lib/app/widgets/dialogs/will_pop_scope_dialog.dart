import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';

class WillPopScopeDialog {
  Future<bool> onWillPopScopeCall(BuildContext context) async {
    final result = await showOkCancelAlertDialog(
        title: "¿Estás seguro/a que querés salir?",
        message: "Los cambios realizados no se guardarán",
        okLabel: "Salir",
        context: context,
        cancelLabel: "Cancelar");
    if (result != null) {
      if (result == OkCancelResult.ok) {
        return true;
      }
    }
    return false;
  }
}
