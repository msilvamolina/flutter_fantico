import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class CardContainerWidget extends StatelessWidget {
  final Widget child;

  const CardContainerWidget({Key key, @required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Map<String, double> mapSize = Utils().getMapSize(context);

    Color colorCard = Colors.cyan[600];
    double paddingHorizontal = mapSize['paddingInteriorHorizontal'] / 2;
    EdgeInsetsGeometry padding = EdgeInsets.symmetric(
        vertical: mapSize['paddingInterior'], horizontal: paddingHorizontal);
    return Padding(
      padding: EdgeInsets.all(mapSize['paddingExterior']),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(paddingHorizontal),
        decoration: BoxDecoration(
          color: colorCard,
          borderRadius: BorderRadius.all(
            Radius.circular(mapSize['borderRadius']),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: padding,
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
