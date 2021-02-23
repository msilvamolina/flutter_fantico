import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class HeaderDaysWidget extends StatelessWidget {
  final double textSize;

  const HeaderDaysWidget({Key key, @required this.textSize}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Text(
              'ayer',
              style: TextStyle(
                fontSize: textSize,
                color: AppColors.colorFour,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Expanded(
            child: Text(
              'hoy',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: textSize,
                color: AppColors.colorFour,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Text(
              'mañana',
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: textSize,
                color: AppColors.colorFour,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
