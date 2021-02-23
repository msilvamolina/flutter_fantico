import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/responsive.dart';

class PreguntasCard extends StatelessWidget {
  final Map<String, double> mapSize;
  final String title;
  final String message;
  PreguntasCard({
    Key key,
    @required this.mapSize,
    this.title = "",
    @required this.message,
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
                if (title != '') ...[
                  Container(
                    width: double.infinity,
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: sizeTitle,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 6),
                ],
                Container(
                  width: double.infinity,
                  child: Text(
                    message,
                    style: TextStyle(
                      color: AppColors.colorFour,
                      fontSize: sizeTitle,
                      fontWeight: FontWeight.normal,
                    ),
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
