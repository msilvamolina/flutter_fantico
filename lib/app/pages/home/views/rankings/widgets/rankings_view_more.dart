import 'package:flutter/material.dart';

import '../../../../../utils/responsive.dart';

class RankingsViewMore extends StatelessWidget {
  final VoidCallback onPressed;

  const RankingsViewMore({Key key, @required this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double sizeTitle = Responsive.of(context).percent(1.5);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 10),
      child: FlatButton(
        onPressed: onPressed,
        child: Text(
          'Ver más',
          style: TextStyle(
            color: Colors.cyanAccent,
            fontSize: sizeTitle,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.end,
        ),
      ),
    );
  }
}
