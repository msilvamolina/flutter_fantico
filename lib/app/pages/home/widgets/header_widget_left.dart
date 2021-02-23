import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class HeaderLeftWidget extends StatelessWidget {
  final Map<String, double> mapSize;
  final String text;
  const HeaderLeftWidget({Key key, @required this.mapSize, @required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      padding: EdgeInsets.all(mapSize['paddingExterior']),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          stops: [0, 1],
          colors: [
            AppColors.colorSecondary,
            Colors.transparent,
          ],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(mapSize['borderRadius']),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 10),
        child: Text(
          text,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: mapSize['sizeTextHeader'],
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
