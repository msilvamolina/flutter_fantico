import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/app_colors.dart';
import '../../utils/responsive.dart';

class CardSwitchWithImage extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final String imagePath;
  final bool active;

  const CardSwitchWithImage({
    Key key,
    @required this.text,
    @required this.onTap,
    @required this.imagePath,
    @required this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double imageSize = 30;
    return Card(
      color: AppColors.colorPrimary,
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
                  Container(
                    child: Row(
                      children: [
                        Container(
                          width: imageSize,
                          height: imageSize,
                          padding: EdgeInsets.only(
                              right: Responsive.of(context).percent(0.5)),
                          child: Image.asset(
                            imagePath,
                            width: imageSize,
                          ),
                        ),
                        Text(
                          text,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: Responsive.of(context).percent(1.5),
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
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
                      color:
                          active ? AppColors.colorSecondary : Colors.grey[400],
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
