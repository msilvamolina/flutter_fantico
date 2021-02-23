import 'package:flutter/material.dart';

import '../../../../../utils/responsive.dart';
import '../../../../../utils/utils.dart';
import 'pronosticos_card.dart';
import 'pronosticos_title.dart';

class PronosticosLockedBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double paddingExterior = 8;
    var mapSize = Utils().getMapSize(context);

    return Padding(
      padding: EdgeInsets.all(paddingExterior),
      child: Container(
        width: size.width,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(paddingExterior),
                child: PronosticosTitle(
                  text: 'Desbloquea el pronóstico de la casa',
                  size: Responsive.of(context).percent(1.8),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(paddingExterior),
                child: PronosticosCard(
                  mapSize: mapSize,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(paddingExterior),
                child: PronosticosTitle(
                  text:
                      'Para ver este contenido tienes que hacer tus picks del día',
                  size: Responsive.of(context).percent(1.3),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
