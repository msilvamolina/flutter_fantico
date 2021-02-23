import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/responsive.dart';

class FullThirdButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color colorTxt;
  const FullThirdButton({
    Key key,
    @required this.text,
    @required this.onPressed,
    this.colorTxt,
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
              fontSize: Responsive.of(context).percent(1.75),
              fontWeight: FontWeight.w500,
              color: colorTxt ?? AppColors.colorPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
