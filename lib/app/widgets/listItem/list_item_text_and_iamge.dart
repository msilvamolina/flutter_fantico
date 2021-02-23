import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/responsive.dart';

class ListItemTextAndImage extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final String imagePath;
  final bool withIcon;
  final bool withBorder;

  const ListItemTextAndImage({
    Key key,
    @required this.onTap,
    @required this.text,
    @required this.imagePath,
    this.withIcon = true,
    this.withBorder = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            withIcon
                ? Positioned(
                    right: 5,
                    child: Icon(
                      Icons.chevron_right,
                      color: AppColors.colorFour,
                      size: Responsive.of(context).percent(3.0),
                    ),
                  )
                : Container(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(Responsive.of(context).percent(1.5)),
                  child: Row(
                    children: [
                      Image.asset(
                        imagePath,
                        width: Responsive.of(context).percent(3),
                      ),
                      SizedBox(
                        width: Responsive.of(context).percent(1),
                      ),
                      Text(
                        text,
                        style: TextStyle(
                            fontSize: Responsive.of(context).percent(1.6)),
                      ),
                    ],
                  ),
                ),
                withBorder
                    ? SizedBox(
                        height: 1,
                        child: Container(
                          color: AppColors.colorPrimary.withOpacity(0.5),
                        ),
                      )
                    : Container()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
