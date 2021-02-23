import 'package:flutter/material.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/responsive.dart';

class PronosticosCard extends StatelessWidget {
  final Map<String, double> mapSize;

  const PronosticosCard({
    Key key,
    @required this.mapSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double paddingHorizontal = mapSize['paddingInteriorHorizontal'] / 2;
    EdgeInsetsGeometry padding = EdgeInsets.symmetric(
        vertical: mapSize['paddingInterior'], horizontal: paddingHorizontal);

    return Container(
      padding: EdgeInsets.all(paddingHorizontal),
      decoration: BoxDecoration(
        color: AppColors.colorPrimary,
        borderRadius: BorderRadius.all(
          Radius.circular(mapSize['borderRadius']),
        ),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(Responsive.of(context).percent(3)),
          child: Image.asset(
            'assets/images/padlock.png',
            width: Responsive.of(context).percent(20),
          ),
        ),
      ),
    );
  }
}
