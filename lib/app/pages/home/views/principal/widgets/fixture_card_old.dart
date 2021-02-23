import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../../data/models/fixture/fixture.dart';
import '../../../../../routes/app_routes.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/responsive.dart';
import '../../../../../utils/utils.dart';

class FixtureCardOld extends StatelessWidget {
  final Fixture fixture;

  const FixtureCardOld({Key key, @required this.fixture}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Map<String, double> mapSize = Utils().getMapSize(context);
    Color colorBase = AppColors.colorPrimary;

    Color colorGanador_1 = AppColors.colorSecondary;
    Color colorGanador_2 = AppColors.colorSecondary.withOpacity(0.5);

    bool finalizado = fixture.status == 'Match Finished';

    int goalsHomeTeam = fixture.goalsHomeTeam ?? 0;
    int goalsAwayTeam = fixture.goalsAwayTeam ?? 0;

    bool ganador1 = goalsHomeTeam > goalsAwayTeam;
    bool ganador2 = goalsAwayTeam > goalsHomeTeam;

    Color colorTeam1_1 = finalizado && ganador1 ? colorGanador_1 : colorBase;
    Color colorTeam1_2 = finalizado && ganador1 ? colorGanador_2 : colorBase;

    Color colorTeam2_1 = finalizado && ganador2 ? colorGanador_1 : colorBase;
    Color colorTeam2_2 = finalizado && ganador2 ? colorGanador_2 : colorBase;

    int eventTimestamp = fixture.event_timestamp;
    int elapsed = fixture.elapsed;

    DateTime date =
        Utils().getDateTimeFromTimeStramp(eventTimestamp, elapsed, finalizado);
    String hora = Utils().onlyHours(date);

    bool enCurso = elapsed > 0 && !finalizado;

    String textoComienzo = 'Comienza a las ' + hora;
    String textoFinalizado = 'Finalizado a las ' + hora;
    String textoEnCurso = 'En curso ${elapsed}min';

    String fechaComienzo =
        finalizado ? textoFinalizado : (enCurso ? textoEnCurso : textoComienzo);

    String porcentajeTeam1 = '35%';
    String porcentajeTeam2 = '65%';
    String txtGanador = "Ganador";

    String txtPorcentajeTeam1 =
        finalizado && ganador1 ? txtGanador : porcentajeTeam1;
    String txtPorcentajeTeam2 =
        finalizado && ganador2 ? txtGanador : porcentajeTeam2;

    double paddingExterior = mapSize['paddingExterior'] * 2.25;

    String homeTeamName = fixture.homeTeam['team_name'];
    String awayTeamName = fixture.awayTeam['team_name'];

    String venue = fixture.venue ?? '';
    return GestureDetector(
      onTap: () => Get.toNamed(
        AppRoutes.FIXTURE_DETAILS,
        arguments: fixture,
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            paddingExterior, 0, paddingExterior, paddingExterior),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0, 1],
              colors: [
                colorTeam1_1,
                colorTeam1_2,
              ],
            ),
            color: AppColors.colorPrimary,
            borderRadius: BorderRadius.all(
              Radius.circular(mapSize['borderRadius']),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: mapSize['paddingInterior'],
                      horizontal: mapSize['paddingInteriorHorizontal']),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          fechaComienzo,
                          style: TextStyle(fontSize: mapSize['sizeTextHeader']),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.all(
                            Radius.circular(mapSize['sizeBarWidth'])),
                        child: Stack(
                          children: [
                            Container(
                              width: mapSize['sizeBarWidth'],
                              height: mapSize['sizeBarHeight'],
                              color: AppColors.colorBackgroundBox,
                            ),
                            Container(
                              width: mapSize['sizeBarWidth'] * 0.67,
                              height: mapSize['sizeBarHeight'],
                              color: AppColors.colorThird,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: mapSize['sizePanelWidth'],
                  height: mapSize['sizePanelHeight'],
                  padding: EdgeInsets.symmetric(
                      vertical: mapSize['paddingInterior'],
                      horizontal: mapSize['paddingInteriorHorizontal']),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          homeTeamName,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: mapSize['sizeTextTeam'],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        txtPorcentajeTeam1,
                        style: TextStyle(
                          color: AppColors.colorFour,
                          fontSize: mapSize['sizeTextTeam'],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                if (!finalizado)
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: mapSize['paddingInteriorHorizontal']),
                    child: Row(
                      children: [
                        Text(
                          'Vs',
                          style: TextStyle(
                            color: Colors.tealAccent,
                            fontSize: mapSize['sizeTextTeam'],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          width: (mapSize['paddingInteriorHorizontal'] / 2),
                        ),
                        Expanded(
                          child: Container(
                            height: 3,
                            color: AppColors.colorSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                Container(
                  padding: EdgeInsets.fromLTRB(
                      mapSize['paddingInteriorHorizontal'],
                      mapSize['paddingInterior'],
                      mapSize['paddingInteriorHorizontal'],
                      0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0, 1],
                      colors: [
                        colorTeam2_1,
                        colorTeam2_2,
                      ],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(mapSize['borderRadius']),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: mapSize['sizePanelWidth'],
                        height: mapSize['sizePanelHeight'],
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                awayTeamName,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: mapSize['sizeTextTeam'],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              txtPorcentajeTeam2,
                              style: TextStyle(
                                color: AppColors.colorFour,
                                fontSize: mapSize['sizeTextTeam'],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: mapSize['sizePanelWidth'],
                        height: mapSize['sizePanelBottomHeight'],
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                venue,
                                style: TextStyle(
                                    fontSize: mapSize['sizeTextHeader']),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: AppColors.colorBackgroundBox,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(mapSize['borderRadius']),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    child: Text(
                                      'Chat',
                                      style: TextStyle(
                                          fontSize: mapSize['sizeTextHeader']),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  FaIcon(
                                    FontAwesomeIcons.comment,
                                    size: Responsive.of(context).percent(1.9),
                                    color: AppColors.colorSecondary,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
