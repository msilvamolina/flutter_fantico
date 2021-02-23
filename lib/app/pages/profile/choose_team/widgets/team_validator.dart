import 'package:flutter/material.dart';

import '../../../../utils/responsive.dart';

class TeamValidator extends StatelessWidget {
  final String validator;

  const TeamValidator({Key key, @required this.validator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 2),
      width: double.infinity,
      padding: EdgeInsets.only(
          top: Responsive.of(context).percent(0.6),
          left: Responsive.of(context).percent(1.6)),
      child: Wrap(
        children: <Widget>[
          validator != null
              ? Text(
                  validator.toString(),
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: Responsive.of(context).percent(1.5),
                    fontWeight: FontWeight.normal,
                    color: Colors.pinkAccent[100],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
