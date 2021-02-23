import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class IconButtonBagde extends StatelessWidget {
  final int bagde;
  final VoidCallback onTap;
  final Icon icon;

  const IconButtonBagde(
      {Key key, this.bagde = 0, this.onTap, @required this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14, right: 5),
      child: Container(
          height: 120,
          width: 40.0,
          child: InkWell(
            onTap: onTap,
            child: Stack(
              children: <Widget>[
                IconButton(
                  icon: icon,
                  onPressed: null,
                ),
                bagde == 0
                    ? Container()
                    : Positioned(
                        child: Stack(
                        children: <Widget>[
                          Icon(Icons.brightness_1,
                              size: 20.0, color: AppColors.colorSecondary),
                          Positioned(
                              top: 4.0,
                              right: bagde <= 9 ? 7 : 4,
                              child: Center(
                                child: Text(
                                  bagde.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        ],
                      )),
              ],
            ),
          )),
    );
  }
}
