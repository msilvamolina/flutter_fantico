import 'package:flutter/material.dart';
import '../../home/widgets/header_widget_left.dart';
import 'preguntas_card.dart';
import 'reglas_card.dart';

class InfoBody extends StatelessWidget {
  final Map<String, double> mapSize;
  final double paddingExterior;
  InfoBody({
    Key key,
    @required this.mapSize,
    @required this.paddingExterior,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(paddingExterior),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(paddingExterior),
            child: HeaderLeftWidget(
              mapSize: mapSize,
              text: "¿Cómo jugar en Fantico?",
            ),
          ),
          Padding(
            padding: EdgeInsets.all(paddingExterior),
            child: PreguntasCard(
              mapSize: mapSize,
              title:
                  'Haz tus pronósticos diarios para acumular puntos y enlazar la racha más larga para ganar premios semanales y/o mensuales.',
              message:
                  '\nTodos los días tendremos los mejores partidos para que hagas tus pronósticos, puedes elegir los partidos que quieras durante cada día y pronosticar el ganador o el empate.\n\nOpcionalmente puedes apostar el marcador exacto (goles) para acumular más puntos si aciertas.\n\nDurante cada día puedes agregar 1 partido a tu Racha, por cada pronóstico de racha que aciertes en días consecutivos tu racha crecerá y podrás clasificarte en el ranking de las rachas más extensas para así poder ganar premios.',
            ),
          ),
          Padding(
            padding: EdgeInsets.all(paddingExterior),
            child: HeaderLeftWidget(
              mapSize: mapSize,
              text: "Ventajas de jugar en Fantico",
            ),
          ),
          Padding(
            padding: EdgeInsets.all(paddingExterior),
            child: PreguntasCard(
              mapSize: mapSize,
              title:
                  'Puedes ganar premios de nuestros patrocinadores todas las semanas.',
              message:
                  '\nSi te gusta apostar puedes venir a Fantico todos los días y ver cuáles son los mejores pronósticos de la comunidad para usarlos en tus apuestas.\n\nPodrás recibir pronósticos exclusivos todas las semanas.\n\nTodos los partidos tienen un chat dónde puedes interactuar con el resto de la comunidad. \n\nPuedes hacerte conocer como uno de los mejores pronosticadores gracias a nuestros rankings.\n\nPuedes ver el marcador en tiempo real de los mejores partidos del día.',
            ),
          ),
          Padding(
            padding: EdgeInsets.all(paddingExterior),
            child: HeaderLeftWidget(
              mapSize: mapSize,
              text: "Reglas",
            ),
          ),
          Padding(
            padding: EdgeInsets.all(paddingExterior),
            child: PreguntasCard(
              mapSize: mapSize,
              message:
                  'El jugador podrá elegir pronósticos de ganador o empate en todos los partidos que no hayan comenzado del día en curso y del día siguiente.  El jugador podrá modificar su pronóstico en todo momento antes de que inicie el partido.\n\nAgregar un marcador exacto (goles) es opcional en el pronóstico de un partido.\n\nAgregar un pronóstico a la Racha es opcional. Si se ha elegido un pronóstico para racha siempre se puede deseleccionar ese pronóstico y seleccionar uno nuevo antes de que haya comenzado el partido.\n\nTodas las semanas Fantico establecerá un plan de premios para los ganadores con mayor cantidad de puntos o rachas más largas.',
            ),
          ),
          Padding(
            padding: EdgeInsets.all(paddingExterior),
            child: HeaderLeftWidget(
              mapSize: mapSize,
              text: "Tabla de puntación",
            ),
          ),
          Padding(
            padding: EdgeInsets.all(paddingExterior),
            child: PreguntasCard(
              mapSize: mapSize,
              message:
                  'Pronóstico de resultado acertado (ganador o empate) = +1 punto\n\nPronóstico de marcador exacto acertado (goles) = +4 puntos\n\nPronóstico de Racha acertado = +1 punto de racha',
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
