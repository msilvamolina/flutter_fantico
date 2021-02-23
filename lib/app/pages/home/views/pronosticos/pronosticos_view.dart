import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pronosticos_controller.dart';
import 'widgets/pronosticos_locked_body.dart';
import 'widgets/pronosticos_unlocked_body.dart';

class PronosticosView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PronosticosController>(
      id: 'contenedorGral',
      init: PronosticosController(),
      builder: (_controller) {
        return _controller.showScreen
            ? PronosticosUnlockedBody()
            : PronosticosLockedBody();
      },
    );
  }
}
