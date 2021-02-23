import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/responsive.dart';

class FixtureBottomBar extends StatelessWidget {
  final double paddingExterior;
  final VoidCallback onPressed;

  const FixtureBottomBar(
      {Key key, @required this.paddingExterior, @required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double textSize = Responsive.of(context).percent(2);
    double buttonTextSize = Responsive.of(context).percent(1.8);
    double buttonPadding = Responsive.of(context).percent(1.6);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.colorBottomBarBackground,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(paddingExterior + 2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FlatButton(
                onPressed: onPressed,
                color: AppColors.colorPrimary,
                minWidth: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(buttonPadding),
                  child: Text(
                    'Guardar pronóstico',
                    style: TextStyle(
                        fontSize: buttonTextSize, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
