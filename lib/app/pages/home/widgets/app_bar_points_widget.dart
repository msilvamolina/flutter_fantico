import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class AppBarPointsWidgets extends StatelessWidget {
  final String points;
  final String image;

  const AppBarPointsWidgets(
      {Key key, @required this.points, @required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, double> mapSize = Utils().getMapSize(context);

    double sizeText = mapSize['sizePointsTextHeader'];
    double sizeImage = mapSize['sizePointsImageHeader'];

    return Container(
      margin: const EdgeInsets.only(top: 0, right: 14),
      height: 120,
      child: Row(
        children: [
          Image.asset(
            image,
            width: sizeImage,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            points,
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: mapSize['sizePointsTextHeader'],
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
