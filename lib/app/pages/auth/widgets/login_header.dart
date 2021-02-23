import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class LoginHeader extends StatelessWidget {
  final BoxConstraints contraints;

  const LoginHeader({Key key, @required this.contraints}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),

      width: contraints.maxWidth,
      height: contraints.maxHeight * 0.27,
      // margin: EdgeInsets.only(top: contraints.maxHeight * 0.22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Image.asset(
            'assets/images/fantico_logo.jpg',
            width: 300,
          ),
          SizedBox(
            height: 10,
          ),
          Material(
            color: Colors.transparent,
            child: Text(
              "Gana premios con tus pronósticos diarios.",
              style: TextStyle(
                color: AppColors.colorTxt,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
