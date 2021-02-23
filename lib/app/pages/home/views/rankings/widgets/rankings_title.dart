import 'package:flutter/material.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/responsive.dart';

class RankingsTitle extends StatelessWidget {
  final String title;
  final String points;

  const RankingsTitle({Key key, @required this.title, @required this.points})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sizeTitle = Responsive.of(context).percent(1.5);

    return Container(
      padding: EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: sizeTitle,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            points,
            style: TextStyle(
              color: AppColors.colorFour,
              fontSize: sizeTitle,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
