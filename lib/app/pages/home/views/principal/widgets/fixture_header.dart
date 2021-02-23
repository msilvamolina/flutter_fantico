import 'package:flutter/material.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/utils.dart';

class FixtureHeader extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  const FixtureHeader(
      {Key key, @required this.text, this.textAlign = TextAlign.start})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, double> mapSize = Utils().getMapSize(context);

    double pE2 = mapSize['paddingExterior'] * 2;
    return Padding(
      padding: EdgeInsets.fromLTRB(0, pE2, pE2, 0),
      child: Container(
        padding: EdgeInsets.all(mapSize['paddingExterior']),
        child: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            text,
            textAlign: textAlign,
            style: TextStyle(
              fontSize: mapSize['sizeTextTopHeader'],
              color: AppColors.colorFour,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
