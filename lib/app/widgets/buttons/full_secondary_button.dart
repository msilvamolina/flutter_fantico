import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/responsive.dart';

class FullSecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const FullSecondaryButton({
    Key key,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Container(
        padding: EdgeInsets.fromLTRB(16, 7.5, 20, 7.5),
        width: double.infinity,
        child: Container(
          width: double.infinity,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: Responsive.of(context).percent(1.7),
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
