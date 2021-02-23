import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/utils.dart';
import '../../widgets/header_widget_left.dart';
import 'rankings_controller.dart';
import 'widgets/rankings_card.dart';

class RankingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double paddingExterior = 8;
    var mapSize = Utils().getMapSize(context);
    return GetBuilder<RankingsController>(
      init: RankingsController(),
      builder: (_controller) {
        var rachaSemanal = _controller.getUsersRacha('week');
        var rachaMensual = _controller.getUsersRacha('month');
        var rachaHistorica = _controller.getUsersRacha('history');
        return Scaffold(
          backgroundColor: AppColors.colorBackground,
          body: Padding(
            padding: EdgeInsets.all(paddingExterior),
            child: ListView(children: [
              Padding(
                padding: EdgeInsets.all(paddingExterior),
                child: HeaderLeftWidget(
                  mapSize: mapSize,
                  text: "Top 100 Racha de la semana",
                ),
              ),
              Padding(
                padding: EdgeInsets.all(paddingExterior),
                child: RankingsCard(
                  onPressed: () =>
                      _controller.goToRankingDetails(rachaSemanal, 'week'),
                  listUsers: rachaSemanal,
                  mapSize: mapSize,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(paddingExterior),
                child: HeaderLeftWidget(
                  mapSize: mapSize,
                  text: "Top 100 Racha del mes",
                ),
              ),
              Padding(
                padding: EdgeInsets.all(paddingExterior),
                child: RankingsCard(
                  onPressed: () =>
                      _controller.goToRankingDetails(rachaMensual, 'month'),
                  listUsers: rachaMensual,
                  mapSize: mapSize,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(paddingExterior),
                child: HeaderLeftWidget(
                  mapSize: mapSize,
                  text: "Top 100 Racha de la historia",
                ),
              ),
              Padding(
                padding: EdgeInsets.all(paddingExterior),
                child: RankingsCard(
                  onPressed: () =>
                      _controller.goToRankingDetails(rachaHistorica, 'history'),
                  listUsers: rachaHistorica,
                  mapSize: mapSize,
                ),
              ),
            ]),
          ),

          // if (_controller.rankingsOrFailure != null)
          //   return _controller.rankingsOrFailure.fold((failure) {
          //     return PageLoadFailure(
          //       onTap: _controller.loadList,
          //     );
          //   }, (rankings) {
          //     return SmartRefresher(
          //       controller: _controller.refreshController,
          //       onRefresh: _controller.onRefresh,
          //       header: WaterDropMaterialHeader(
          //         backgroundColor: AppColors.colorPrimary,
          //       ),
          //       child: rankings.length != 0
          //           ? Padding(
          //               padding: EdgeInsets.all(paddingExterior),
          //               child: ListView(children: [
          //                 Padding(
          //                   padding: EdgeInsets.all(paddingExterior),
          //                   child: HeaderLeftWidget(
          //                     mapSize: mapSize,
          //                     text: "Top 100 Racha de la semana",
          //                   ),
          //                 ),
          //                 Padding(
          //                   padding: EdgeInsets.all(paddingExterior),
          //                   child: RankingsCard(
          //                     onPressed: () => _controller
          //                         .goToRankingDetails(rankings, 'week'),
          //                     listUsers:
          //                         Hacks().getUserRacha(rankings, 'week'),
          //                     mapSize: mapSize,
          //                   ),
          //                 ),
          //                 Padding(
          //                   padding: EdgeInsets.all(paddingExterior),
          //                   child: HeaderLeftWidget(
          //                     mapSize: mapSize,
          //                     text: "Top 100 Racha del mes",
          //                   ),
          //                 ),
          //                 Padding(
          //                   padding: EdgeInsets.all(paddingExterior),
          //                   child: RankingsCard(
          //                     onPressed: () => _controller
          //                         .goToRankingDetails(rankings, 'month'),
          //                     listUsers:
          //                         Hacks().getUserRacha(rankings, 'month'),
          //                     mapSize: mapSize,
          //                   ),
          //                 ),
          //                 Padding(
          //                   padding: EdgeInsets.all(paddingExterior),
          //                   child: HeaderLeftWidget(
          //                     mapSize: mapSize,
          //                     text: "Top 100 Racha de la historia",
          //                   ),
          //                 ),
          //                 Padding(
          //                   padding: EdgeInsets.all(paddingExterior),
          //                   child: RankingsCard(
          //                     onPressed: () => _controller
          //                         .goToRankingDetails(rankings, 'history'),
          //                     listUsers:
          //                         Hacks().getUserRacha(rankings, 'history'),
          //                     mapSize: mapSize,
          //                   ),
          //                 ),
          //               ]),
          //             )
          //           // ListView(
          //           //     children: ListTile.divideTiles(
          //           //       color: Colors.grey[400],
          //           //       tiles: [
          //           //         for (int i = 0; i < rankings.length; i++)
          //           //           Text(rankings[i].toString())
          //           //       ],
          //           //     ).toList(),
          //           //   )
          //           : Container(),
          //     );
          //   });
          // else
          //   return Center(child: CircularProgressIndicator());
        );
      },
    );
  }
}
