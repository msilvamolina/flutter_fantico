import 'package:flutter/material.dart';

import '../../../../../data/models/league/league.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/utils.dart';

class LeagueHeader extends StatelessWidget {
  final League league;

  const LeagueHeader({Key key, @required this.league}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, double> mapSize = Utils().getMapSize(context);

    String text = league.name;

    if (league.country != null) {
      text = text + " - " + league.country;
    }
    return Padding(
      padding: EdgeInsets.all(mapSize['paddingExterior'] * 2),
      child: Container(
        padding: EdgeInsets.all(mapSize['paddingExterior']),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            stops: [0, 0.7],
            colors: [
              Colors.transparent,
              AppColors.colorSecondary,
            ],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(mapSize['borderRadius']),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(right: 10),
          child: Text(
            text,
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: mapSize['sizeTextHeader'],
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
