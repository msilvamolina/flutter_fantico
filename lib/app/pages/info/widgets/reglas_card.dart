import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/responsive.dart';

class ReglasCard extends StatelessWidget {
  final Map<String, double> mapSize;
  ReglasCard({
    Key key,
    @required this.mapSize,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double paddingHorizontal = mapSize['paddingInteriorHorizontal'] / 2;
    EdgeInsetsGeometry padding = EdgeInsets.symmetric(
        vertical: mapSize['paddingInterior'], horizontal: paddingHorizontal);
    double sizeTitle = Responsive.of(context).percent(1.5);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(paddingHorizontal),
      decoration: BoxDecoration(
        color: AppColors.colorPrimary,
        borderRadius: BorderRadius.all(
          Radius.circular(mapSize['borderRadius']),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: padding,
            child: Column(
              children: [
                Text(
                  'Lorem ipsum dolor sit amet consectetur adipiscing elit laoreet, cum eget natoque potenti',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: sizeTitle,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
