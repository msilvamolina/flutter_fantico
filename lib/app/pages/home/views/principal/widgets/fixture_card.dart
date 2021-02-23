import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/models/fixture/fixture.dart';
import '../../../../../data/models/forecast/forecast.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/responsive.dart';
import '../../../../../utils/utils.dart';
import '../../../../fixture_details/circular_progress_indicator.dart';
import 'fixture_card_controller.dart';

class FixtureCard extends StatelessWidget {
  final Fixture fixture;
  final int isForecastDone;
  final Forecast forecast;
  final List<double> percents;

  const FixtureCard(
      {Key key,
      @required this.fixture,
      @required this.isForecastDone,
      this.percents,
      @required this.forecast})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Map<String, double> mapSize = Utils().getMapSize(context);
    Color colorBase = AppColors.colorPrimary;
// AppColors.colorBackgroundBox
    Color cardBackgroundColor = AppColors.colorBackgroundBox;
    Color backgroundColor = AppColors.colorPrimary;
    String fechaComienzo = '';

    int elapsed = fixture.elapsed;
    bool finalizado = fixture.status == 'Match Finished';
    bool cancelado = fixture.status == 'Match Postponed';
    bool noEmpezado = fixture.status == 'Not Started';
    bool enCurso = elapsed > 0 && !finalizado && !cancelado;

    int eventTimestamp = fixture.event_timestamp;
    DateTime date =
        Utils().getDateTimeFromTimeStramp(eventTimestamp, elapsed, finalizado);
    String hora = Utils().onlyHours(date);

    String textoComienzo = 'Comienza a las ' + hora;
    String textoFinalizado = 'Finalizado a las ' + hora;
    String textoEnCurso = 'En curso ${elapsed}min';

    if (fixture.status == 'First Half') {
      textoEnCurso = 'Primer tiempo: ${elapsed}min';
    }
    if (fixture.status == 'Second Half') {
      textoEnCurso = 'Segundo tiempo: ${elapsed}min';
    }
    if (fixture.status == 'Halftime') {
      textoEnCurso = 'Entretiempo';
    }

    if (enCurso) {
      fechaComienzo = textoEnCurso;
      cardBackgroundColor = Colors.deepPurple[700];
      colorBase = Colors.deepPurple;
      backgroundColor = Colors.deepPurple;
    }
    if (noEmpezado) {
      fechaComienzo = textoComienzo;
    }
    if (finalizado) {
      fechaComienzo = textoFinalizado;
      cardBackgroundColor = Colors.grey[700];
      colorBase = Colors.grey;
      backgroundColor = Colors.grey;
    }
    if (cancelado) {
      fechaComienzo = 'Pospuesto';
      cardBackgroundColor = Colors.orange[700];
      colorBase = Colors.orange;
      backgroundColor = Colors.orange;
    }

    Color colorGanador_1 = Colors.grey[200];
    Color colorGanador_2 = colorBase;

    bool mostrarFilaFinalizado = finalizado || cancelado;

    int goalsHomeTeam = fixture.goalsHomeTeam ?? 0;
    int goalsAwayTeam = fixture.goalsAwayTeam ?? 0;

    bool ganador1 = goalsHomeTeam > goalsAwayTeam;
    bool ganador2 = goalsAwayTeam > goalsHomeTeam;

    Color colorTeam1_1 = finalizado && ganador1 ? colorGanador_1 : colorBase;
    Color colorTeam1_2 = finalizado && ganador1 ? colorGanador_2 : colorBase;

    Color colorTeam2_1 = finalizado && ganador2 ? colorGanador_1 : colorBase;
    Color colorTeam2_2 = finalizado && ganador2 ? colorGanador_2 : colorBase;

    double paddingExterior = mapSize['paddingExterior'] * 2.25;

    String homeTeamName = fixture.homeTeam['team_name'];
    String awayTeamName = fixture.awayTeam['team_name'];

    String venue = fixture.venue ?? '';

    String homeTeamStr = fixture.homeTeam['team_name'];
    String awayTeamStr = fixture.awayTeam['team_name'];

    String homeTeamImg = fixture.homeTeam['logo'];
    String awayTeamImg = fixture.awayTeam['logo'];

    String appBarTitle = homeTeamStr + " vs " + awayTeamStr;

    double containerVS = 80;

    double padding = (Responsive.of(context).width / 2) * 0.15;

    double paddingElemento = padding / 4;

    double sizeProgressBox =
        (((Responsive.of(context).width / 2) * 0.85) - (containerVS / 2)) -
            (paddingElemento * 2);

    double containerPadding = padding / 1.5;
    double containerNameSize =
        Responsive.of(context).width - (containerPadding * 2);

    double containerNameSizeHeight = 50;
    double paddingInterior = 4;

    double selectorSizeHeight = containerNameSizeHeight - (paddingInterior * 2);
    double selectorSize = (containerNameSize / 2) - (paddingInterior * 2);

    double _positionHome = 0;
    double _positionAway = selectorSize + (paddingInterior * 2);
    double _positionStart = _positionAway / 2;

    Color selectorColor = Colors.purple;

    double paddingCircularProgress = padding / 2;

    double percentHomeTeam = 0;
    double percentAwayTeam = 0;

    if (percents != null && percents.length > 0) {
      percentHomeTeam = percents[0];
      percentAwayTeam = percents[1];
    }

    Color colorActiveHome = Utils().getColorPercent(percentHomeTeam);
    Color colorActiveAway = Utils().getColorPercent(percentAwayTeam);

    Color colorInactive = Colors.black.withAlpha(50);

    double circleSize = 22;

    double fontSize = 24;

    int homeScore = fixture.goalsHomeTeam ?? 0;
    int awayScore = fixture.goalsAwayTeam ?? 0;

    bool dobleCero = (homeScore > 9 || awayScore > 9);

    String homeScoreStr =
        dobleCero && homeScore < 10 ? "0${homeScore}" : "${homeScore}";

    String awayScoreStr =
        dobleCero && awayScore < 10 ? "0${awayScore}" : "${awayScore}";

    homeScoreStr = fixture.goalsHomeTeam == null ? '-' : homeScoreStr;
    awayScoreStr = fixture.goalsAwayTeam == null ? '-' : awayScoreStr;

    String homeScoreForecastStr = '-';
    String awayScoreForecastStr = '-';

    Color colorForecastScore = Colors.amber[100];
    bool showForecastScore = false;

    double fontSizeForecastScore = 16;
    if (forecast != null) {
      if (forecast.predecirResultado) {
        showForecastScore = true;
        homeScoreForecastStr = forecast.homeScore.toString();
        awayScoreForecastStr = forecast.awayScore.toString();
      }
    }
    // double padding = (Responsive.of(context).width / 2) * 0.15;
    double sizeHeightCard = 140;

    return GetBuilder<FixtureCardController>(
      init: FixtureCardController(),
      builder: (_controller) {
        return Column(
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.all(0),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(paddingCircularProgress, 0,
                      paddingCircularProgress, paddingCircularProgress),
                  child: Container(
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(mapSize['borderRadius']),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: cardBackgroundColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(mapSize['borderRadius']),
                              topRight:
                                  Radius.circular(mapSize['borderRadius']),
                            ),
                          ),
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    fechaComienzo,
                                    style: TextStyle(
                                        fontSize: mapSize['sizeTextHeader']),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    venue,
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontSize: mapSize['sizeTextHeader'],
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Stack(
                          children: [
                            Row(
                              children: [
                                Expanded(
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
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(
                                              mapSize['borderRadius']),
                                        )),
                                    height: sizeHeightCard,
                                  ),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Expanded(
                                  child: Container(
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
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(
                                              mapSize['borderRadius']),
                                        )),
                                    height: sizeHeightCard,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.all(paddingElemento * 2),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.all(paddingElemento),
                                        child: Stack(
                                          children: [
                                            Hero(
                                              tag: "${fixture.fixture_id}H",
                                              child:
                                                  CircularProgressIndicatorMartin(
                                                isFinished: finalizado,
                                                circleSize: circleSize,
                                                backgroundColor:
                                                    backgroundColor,
                                                size: sizeProgressBox,
                                                imageUrl: homeTeamImg,
                                                colorActive: percentHomeTeam > 0
                                                    ? colorActiveHome
                                                    : colorInactive,
                                                colorInactive: colorInactive,
                                                percent: percentHomeTeam,
                                                colorProgress: colorActiveHome,
                                              ),
                                            ),
                                            if (ganador1 && finalizado)
                                              Positioned(
                                                left: 0,
                                                top: 0,
                                                child: Image.asset(
                                                  'assets/images/star.png',
                                                  width: 50,
                                                ),
                                              ),
                                            if (isForecastDone == 1 ||
                                                isForecastDone == 3)
                                              Positioned(
                                                right: 0,
                                                bottom: 0,
                                                child: Image.asset(
                                                  'assets/images/betting.png',
                                                  width: 50,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            width: containerVS,
                                            child: RichText(
                                              textAlign: TextAlign.center,
                                              text: TextSpan(
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: homeScoreStr,
                                                    style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: fontSize,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.white),
                                                  ),
                                                  TextSpan(
                                                    text: ' : ',
                                                    style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: fontSize,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.white
                                                            .withOpacity(0.5)),
                                                  ),
                                                  TextSpan(
                                                    text: awayScoreStr,
                                                    style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: fontSize,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          showForecastScore
                                              ? Container(
                                                  width: containerVS,
                                                  child: RichText(
                                                    textAlign: TextAlign.center,
                                                    text: TextSpan(
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                          text: '(',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Roboto',
                                                              fontSize:
                                                                  fontSizeForecastScore,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              color:
                                                                  colorForecastScore),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              homeScoreForecastStr,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Roboto',
                                                              fontSize:
                                                                  fontSizeForecastScore,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color:
                                                                  colorForecastScore),
                                                        ),
                                                        TextSpan(
                                                          text: ' : ',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Roboto',
                                                              fontSize:
                                                                  fontSizeForecastScore,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              color:
                                                                  colorForecastScore),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              awayScoreForecastStr,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Roboto',
                                                              fontSize:
                                                                  fontSizeForecastScore,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color:
                                                                  colorForecastScore),
                                                        ),
                                                        TextSpan(
                                                          text: ')',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Roboto',
                                                              fontSize:
                                                                  fontSizeForecastScore,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              color:
                                                                  colorForecastScore),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              : Container(),
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.all(paddingElemento),
                                        child: Stack(
                                          children: [
                                            Hero(
                                              tag: "${fixture.fixture_id}A",
                                              child:
                                                  CircularProgressIndicatorMartin(
                                                isFinished: finalizado,
                                                circleSize: circleSize,
                                                backgroundColor:
                                                    backgroundColor,
                                                size: sizeProgressBox,
                                                imageUrl: awayTeamImg,
                                                colorActive: percentAwayTeam > 0
                                                    ? colorActiveAway
                                                    : colorInactive,
                                                colorInactive: colorInactive,
                                                percent: percentAwayTeam,
                                                colorProgress: colorActiveAway,
                                              ),
                                            ),
                                            if (ganador2 && finalizado)
                                              Positioned(
                                                right: 0,
                                                top: 0,
                                                child: Image.asset(
                                                  'assets/images/star.png',
                                                  width: 50,
                                                ),
                                              ),
                                            if (isForecastDone == 2 ||
                                                isForecastDone == 3)
                                              Positioned(
                                                left: 0,
                                                bottom: 0,
                                                child: Image.asset(
                                                  'assets/images/betting.png',
                                                  width: 50,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: sizeProgressBox +
                                            (paddingElemento * 2),
                                        child: Text(
                                          homeTeamName,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: mapSize['sizeTextTeam'],
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Expanded(
                                        child: SizedBox(),
                                      ),
                                      Container(
                                        width: sizeProgressBox +
                                            (paddingElemento * 2),
                                        child: Text(
                                          awayTeamName,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: mapSize['sizeTextTeam'],
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  mapSize['borderRadius']),
                              child: FlatButton(
                                onPressed: () =>
                                    _controller.goToFixtureDetails(fixture),
                                child: Container(
                                  height: sizeHeightCard,
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
