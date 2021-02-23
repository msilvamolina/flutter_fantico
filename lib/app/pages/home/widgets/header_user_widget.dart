import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import 'header_points_widget.dart';

class HeaderUserWidget extends StatelessWidget {
  final Map<String, double> mapSize;
  final double height;
  final double paddingExterior;
  final double textSize;

  const HeaderUserWidget({
    Key key,
    @required this.mapSize,
    @required this.height,
    @required this.paddingExterior,
    @required this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double pointWidth = 180;
    double pointHeight = 30;

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: AppColors.colorBackground,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.35),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/user.png'),
                    backgroundColor: AppColors.colorBackgroundBox,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Fulanito de Tal',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: textSize,
                        fontWeight: FontWeight.bold,
                        color: AppColors.colorFour),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderPointWidget(
                    mapSize: mapSize,
                    text: 'Puntos Mes',
                    points: '99999',
                    width: pointWidth,
                    height: pointHeight,
                    color: AppColors.colorPrimary),
                SizedBox(height: 7),
                HeaderPointWidget(
                  mapSize: mapSize,
                  text: 'Racha Mes',
                  points: '99',
                  width: pointWidth,
                  height: pointHeight,
                  color: AppColors.colorSecondary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
