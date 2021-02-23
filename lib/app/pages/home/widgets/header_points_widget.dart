import 'package:flutter/material.dart';

class HeaderPointWidget extends StatelessWidget {
  final Map<String, double> mapSize;
  final String text;
  final String points;
  final double width;
  final double height;
  final Color color;
  const HeaderPointWidget({
    Key key,
    @required this.mapSize,
    @required this.text,
    @required this.points,
    @required this.width,
    @required this.height,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(mapSize['paddingExterior']),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          stops: [0, 1],
          colors: [
            color,
            Colors.transparent,
          ],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(mapSize['borderRadius']),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: mapSize['sizeTextHeader'],
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              points,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: mapSize['sizeTextHeader'],
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
