import 'package:flutter/material.dart';

import '../../../../../data/models/user_streaks_min/user_streaks_min.dart';
import '../../../../../utils/app_colors.dart';
import 'rankings_title.dart';
import 'rankings_view_more.dart';

class RankingsCard extends StatelessWidget {
  final Map<String, double> mapSize;
  final List<UserStreakMin> listUsers;
  final VoidCallback onPressed;

  const RankingsCard({
    Key key,
    @required this.mapSize,
    @required this.listUsers,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double paddingHorizontal = mapSize['paddingInteriorHorizontal'] / 2;

    EdgeInsetsGeometry padding = EdgeInsets.fromLTRB(
        paddingHorizontal, mapSize['paddingInterior'], paddingHorizontal, 0);
    int limit = 5;
    return Container(
      padding: EdgeInsets.all(0),
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
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  paddingHorizontal, paddingHorizontal, paddingHorizontal, 0),
              child: Column(
                children: [
                  for (var i = 0; i < listUsers.length; i++) ...[
                    if (i < limit) ...[
                      RankingsTitle(
                        title: listUsers[i].username,
                        points: listUsers[i].racha.toString(),
                      ),
                    ],
                  ],
                ],
              ),
            ),
          ),
          RankingsViewMore(
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
