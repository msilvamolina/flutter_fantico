import 'package:flutter/material.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/responsive.dart';

class RecordTitle extends StatelessWidget {
  final String title;
  final String points;
  final double paddingBottom;
  const RecordTitle(
      {Key key,
      @required this.title,
      @required this.points,
      this.paddingBottom = 3})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sizeTitle = Responsive.of(context).percent(1.5);

    return Container(
      padding: EdgeInsets.only(bottom: paddingBottom),
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
