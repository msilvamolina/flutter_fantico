import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/responsive.dart';
import '../../../utils/utils.dart';
import '../../../widgets/cards/card_switch_with_image.dart';
import '../../home/views/principal/widgets/fixture_header.dart';
import '../circular_progress_indicator.dart';
import '../fixture_details_controller.dart';
import '../widgets/fixture_bottom_bar.dart';
import 'score_big_widget.dart';

class FixtureDetailsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FixtureDetailsController>(
      builder: (_controller) {
        Map<String, double> mapSize = Utils().getMapSize(context);

        String homeTeamStr = _controller.fixture.homeTeam['team_name'];
        String awayTeamStr = _controller.fixture.awayTeam['team_name'];

        String homeTeamImg = _controller.fixture.homeTeam['logo'];
        String awayTeamImg = _controller.fixture.awayTeam['logo'];

        String appBarTitle = homeTeamStr + " vs " + awayTeamStr;

        double containerVS = 30;

        double sizeProgressBox =
            ((Responsive.of(context).width / 2) * 0.85) - (containerVS / 2);
        double padding = (Responsive.of(context).width / 2) * 0.15;

        double paddingElemento = padding / 4;

        double percentHomeTeam = 0;
        double percentAwayTeam = 0;

        if (_controller.percents != null && _controller.percents.length > 0) {
          percentHomeTeam = _controller.percents[0];
          percentAwayTeam = _controller.percents[1];
        }

        Color colorActiveHome = Utils().getColorPercent(percentHomeTeam);
        Color colorActiveAway = Utils().getColorPercent(percentAwayTeam);

        percentHomeTeam = percentHomeTeam;
        Color colorInactive = Colors.black.withAlpha(50);

        double containerPadding = padding / 3;
        double containerNameSize =
            Responsive.of(context).width - (containerPadding * 2);

        double containerNameSizeHeight = 50;
        double paddingInterior = 4;

        double selectorSizeHeight =
            containerNameSizeHeight - (paddingInterior * 2);
        double selectorSize = (containerNameSize / 2) - (paddingInterior * 2);

        double _positionHome = 0;
        double _positionAway = selectorSize + (paddingInterior * 2);
        double _positionStart = _positionAway / 2;

        Color selectorColor = Colors.cyan;

        double paddingCircularProgress = padding / 2;
        double paddingExterior = 14;
        return Scaffold(
          backgroundColor: _controller.editForm
              ? AppColors.colorBackground
              : Colors.grey[600],
          appBar: AppBar(
            backgroundColor:
                _controller.editForm ? AppColors.colorPrimary : Colors.grey,
            title: Text(appBarTitle),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _controller.goToChatFixture,
            child: Icon(Icons.chat_sharp),
          ),
          bottomNavigationBar: _controller.editForm
              ? FixtureBottomBar(
                  onPressed: () => _controller.saveForecast(context),
                  paddingExterior: paddingExterior,
                )
              : null,
          body: SingleChildScrollView(
            child: Container(
              foregroundDecoration: !_controller.editForm
                  ? BoxDecoration(
                      color: Colors.grey,
                      backgroundBlendMode: BlendMode.saturation,
                    )
                  : null,
              child: Column(
                children: [
                  FixtureHeader(text: "¿Quién ganará el partido?"),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        paddingCircularProgress,
                        paddingCircularProgress,
                        paddingCircularProgress,
                        paddingCircularProgress / 3),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => _controller.onHomeClick(context),
                          child: Padding(
                            padding: EdgeInsets.all(paddingElemento),
                            child: Hero(
                              tag: "${_controller.fixture.fixture_id}H",
                              child: CircularProgressIndicatorMartin(
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
                          ),
                        ),
                        Container(
                          width: containerVS,
                          child: Text(
                            'Vs',
                            style: TextStyle(
                              color: colorInactive,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _controller.onAwayClick(context),
                          child: Padding(
                            padding: EdgeInsets.all(paddingElemento),
                            child: Hero(
                              tag: "${_controller.fixture.fixture_id}A",
                              child: CircularProgressIndicatorMartin(
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
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: containerPadding),
                    child: Container(
                      height: containerNameSizeHeight,
                      width: containerNameSize,
                      decoration: BoxDecoration(
                          color: AppColors.colorBackgroundBox,
                          borderRadius: BorderRadius.all(
                              Radius.circular(containerNameSize))),
                      child: Padding(
                        padding: EdgeInsets.all(paddingInterior),
                        child: GetBuilder<FixtureDetailsController>(
                          id: 'selectorController',
                          builder: (_selectorController) {
                            return Stack(
                              children: [
                                AnimatedPositioned(
                                  left: _selectorController.selectorActive
                                      ? (_selectorController.selectorPosition
                                          ? _positionAway
                                          : _positionHome)
                                      : _positionStart,
                                  duration: Duration(milliseconds: 300),
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    decoration: BoxDecoration(
                                        color:
                                            _selectorController.selectorActive
                                                ? selectorColor
                                                : Colors.transparent,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(selectorSize))),
                                    width: selectorSize,
                                    height: selectorSizeHeight,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () => _selectorController
                                            .onHomeClick(context),
                                        child: Container(
                                          height: containerNameSizeHeight,
                                          color: Colors.transparent,
                                          child: Center(
                                            child: Text(
                                              homeTeamStr,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize:
                                                    mapSize['sizeTextTeam'],
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () => _selectorController
                                            .onAwayClick(context),
                                        child: Container(
                                          height: containerNameSizeHeight,
                                          color: Colors.transparent,
                                          child: Center(
                                            child: Text(
                                              awayTeamStr,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize:
                                                    mapSize['sizeTextTeam'],
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        paddingCircularProgress,
                        paddingCircularProgress / 2,
                        paddingCircularProgress,
                        paddingCircularProgress / 2),
                    child: GetBuilder<FixtureDetailsController>(
                      id: 'tieController',
                      builder: (_tieController) {
                        return Column(
                          children: [
                            CardSwitchWithImage(
                              onTap: () => _tieController.onTiePressed(context),
                              active: _tieController.tie,
                              text: 'Terminará en empate',
                              imagePath: 'assets/images/scoreboard.png',
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  GetBuilder<FixtureDetailsController>(
                    id: 'selectorController',
                    builder: (_selectorController) {
                      return AnimatedOpacity(
                        opacity: _selectorController.showScreen ? 1 : 0,
                        duration: Duration(milliseconds: 400),
                        child: Column(
                          children: [
                            FixtureHeader(
                              text: "¿Cómo será el resultado?\n(Opcional)",
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  paddingCircularProgress,
                                  0,
                                  paddingCircularProgress,
                                  paddingCircularProgress),
                              child: ScoreBigWidget(
                                  onPressed: () => _selectorController
                                      .onScorePressed(context)),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  paddingCircularProgress,
                                  0,
                                  paddingCircularProgress,
                                  paddingCircularProgress),
                              child: GetBuilder<FixtureDetailsController>(
                                id: 'agregarARachaController',
                                builder: (_agregarARachaController) {
                                  return Column(
                                    children: [
                                      CardSwitchWithImage(
                                        onTap: () => _agregarARachaController
                                            .onAgregarRachaPressed(context),
                                        active: _agregarARachaController
                                            .agregarAMiRacha,
                                        text: 'Agregar a mi racha',
                                        imagePath: 'assets/images/star2.png',
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Recordá que solo podés agregar a tu racha un pronóstico al día.',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontSize:
                                                  mapSize['sizeTextHeader'],
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 80),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
