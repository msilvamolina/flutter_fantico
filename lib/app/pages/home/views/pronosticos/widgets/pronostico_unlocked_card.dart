import 'package:flutter/material.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/responsive.dart';
import '../../../../../utils/utils.dart';
import 'pronosticos_title.dart';

class PronosticoUnlockedCard extends StatelessWidget {
  final String title;

  const PronosticoUnlockedCard({Key key, @required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mapSize = Utils().getMapSize(context);

    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.colorPrimary,
        borderRadius: BorderRadius.all(
          Radius.circular(mapSize['borderRadius']),
        ),
      ),
      child: Center(
        child: Padding(
          padding:
              EdgeInsets.symmetric(vertical: Responsive.of(context).percent(2)),
          child: Column(
            children: [
              Image.asset(
                'assets/images/lightning.png',
                width: Responsive.of(context).percent(10),
              ),
              SizedBox(
                height: 10,
              ),
              PronosticosTitle(
                text: title,
                size: Responsive.of(context).percent(1.8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
