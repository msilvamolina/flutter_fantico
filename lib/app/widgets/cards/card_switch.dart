import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/responsive.dart';

class CardSwitch extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool active;
  final Color backgroundColor;
  final Color textColor;
  final Color switchOnColor;
  final Color switchOffColor;
  const CardSwitch({
    Key key,
    @required this.text,
    @required this.onTap,
    @required this.active,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.grey,
    this.switchOnColor = Colors.green,
    this.switchOffColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Responsive.of(context).percent(2.5),
                  vertical: Responsive.of(context).percent(1.2)),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      text,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: Responsive.of(context).percent(1.5),
                          fontWeight: FontWeight.w500,
                          color: textColor),
                    ),
                  ),
                  Container(
                    width: Responsive.of(context).percent(4.2),
                    height: Responsive.of(context).percent(4.2),
                    padding: const EdgeInsets.all(2),
                    child: SvgPicture.asset(
                      active
                          ? 'assets/svg/switchon.svg'
                          : 'assets/svg/switchoff.svg',
                      color: active ? switchOnColor : switchOffColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
