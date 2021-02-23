import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/responsive.dart';
import 'raised_gradient_button.dart';

class FullWithAccentButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const FullWithAccentButton({
    Key key,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedGradientButton(
      child: Text(
        text,
        style: TextStyle(
            fontSize: Responsive.of(context).percent(1.7),
            fontWeight: FontWeight.bold),
      ),
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Colors.pinkAccent[200],
            Colors.pink,
          ],
          stops: [
            0.1,
            0.9
          ]),
      onPressed: onPressed,
    );
  }
}
