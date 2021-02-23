import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class HeaderWidgetPrincipal extends StatelessWidget {
  final Map<String, double> mapSize;
  final String text;
  const HeaderWidgetPrincipal(
      {Key key, @required this.mapSize, @required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(mapSize['paddingExterior']),
      decoration: BoxDecoration(
        color: AppColors.colorPrimary,
        borderRadius: BorderRadius.all(
          Radius.circular(mapSize['borderRadius']),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
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
