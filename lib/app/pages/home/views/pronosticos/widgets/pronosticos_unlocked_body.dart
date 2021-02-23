import 'package:flutter/material.dart';

import '../../../../../utils/utils.dart';
import '../../../widgets/header_widget_left.dart';
import 'pronostico_unlocked_card.dart';

class PronosticosUnlockedBody extends StatelessWidget {
  @override
  Widget build(Object context) {
    double paddingExterior = 8;
    var mapSize = Utils().getMapSize(context);

    return Padding(
      padding: EdgeInsets.all(paddingExterior),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(paddingExterior),
            child: HeaderLeftWidget(
              mapSize: mapSize,
              text: "Pronósticos Gratuitos",
            ),
          ),
          Padding(
            padding: EdgeInsets.all(paddingExterior),
            child: Row(
              children: [
                Expanded(
                  child: PronosticoUnlockedCard(title: 'Pronóstico de la casa'),
                ),
                SizedBox(width: 14),
                Expanded(
                  child: PronosticoUnlockedCard(title: 'Pronóstico de la casa'),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(paddingExterior),
            child: HeaderLeftWidget(
              mapSize: mapSize,
              text: "Pronósticos Premium",
            ),
          ),
          Padding(
            padding: EdgeInsets.all(paddingExterior),
            child: Row(
              children: [
                Expanded(
                  child: PronosticoUnlockedCard(title: 'Pronóstico de la casa'),
                ),
                SizedBox(width: 14),
                Expanded(
                  child: PronosticoUnlockedCard(title: 'Pronóstico de la casa'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
