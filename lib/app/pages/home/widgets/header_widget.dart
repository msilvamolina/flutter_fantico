import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class HeaderWidget extends StatelessWidget {
  final Map<String, double> mapSize;
  final String text;
  const HeaderWidget({Key key, @required this.mapSize, @required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
