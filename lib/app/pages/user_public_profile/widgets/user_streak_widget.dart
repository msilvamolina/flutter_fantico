import 'package:flutter/material.dart';

import '../../../utils/utils.dart';
import '../../../widgets/cards/card_container_widget.dart';
import '../../home/views/records/widgets/record_title.dart';

class UserStreakWidget extends StatelessWidget {
  final Map<String, int> userStreaksMap;

  const UserStreakWidget({Key key, @required this.userStreaksMap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    int currentStreak = userStreaksMap['current'];
    int weeklyStreak = userStreaksMap['week'];
    int monthlyStreak = userStreaksMap['month'];
    int historicPositiveStreak = userStreaksMap['historyPositive'];
    int historicNegativeStreak = userStreaksMap['historyNegative'];

    Map<String, double> mapSize = Utils().getMapSize(context);

    Color colorCard = Colors.cyan[600];
    double paddingHorizontal = mapSize['paddingInteriorHorizontal'] / 2;
    EdgeInsetsGeometry padding = EdgeInsets.symmetric(
        vertical: mapSize['paddingInterior'], horizontal: paddingHorizontal);

    return CardContainerWidget(
      child: Column(
        children: [
          RecordTitle(
            title: 'Racha actual',
            points: currentStreak.toString(),
          ),
          RecordTitle(
            title: 'Racha semanal',
            points: weeklyStreak.toString(),
          ),
          RecordTitle(
            title: 'Racha mensual',
            points: monthlyStreak.toString(),
          ),
          SizedBox(height: 20),
          RecordTitle(
            title: 'Racha positiva más larga',
            points: historicPositiveStreak.toString(),
          ),
          RecordTitle(
            title: 'Racha negativa más larga',
            points: historicNegativeStreak.toString(),
          ),
        ],
      ),
    );
  }
}
