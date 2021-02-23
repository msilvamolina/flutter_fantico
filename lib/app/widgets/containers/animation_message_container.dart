import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

import '../../utils/responsive.dart';

class AnimationMessageContainer extends StatelessWidget {
  final String animationPath;
  final String animation;
  final String message;
  final Color colorTxt;

  const AnimationMessageContainer({
    Key key,
    @required this.animationPath,
    @required this.animation,
    @required this.message,
    @required this.colorTxt,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            width: Responsive.of(context).percent(35),
            height: Responsive.of(context).percent(35),
            child: FlareActor(
              animationPath,
              animation: animation,
              alignment: Alignment.center,
              sizeFromArtboard: true,
            )),
        Container(
          transform: Matrix4.translationValues(0.0, -50.0, 0.0),
          padding: EdgeInsets.symmetric(
              vertical: 0, horizontal: Responsive.of(context).percent(3)),
          child: Text(
            message,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: Responsive.of(context).percent(1.7),
                color: colorTxt),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
