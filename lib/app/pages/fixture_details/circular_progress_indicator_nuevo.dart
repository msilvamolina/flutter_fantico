import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

const TWO_PI = 3.14 * 2;

class CircularProgressIndicatorMartinNuevo extends StatelessWidget {
  final double size;
  final String imageUrl;
  final Color colorActive;
  final Color colorInactive;
  final double percent;
  final Color colorProgress;
  const CircularProgressIndicatorMartinNuevo({
    Key key,
    @required this.size,
    @required this.imageUrl,
    @required this.colorActive,
    @required this.colorInactive,
    @required this.colorProgress,
    @required this.percent,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color backgroundColor = AppColors.colorBackground;
    double imageLogoSize = size;

    double padding = size * 0.15;

    double sizeProgress = size - 30;

    return RotatedBox(
      quarterTurns: -1,
      child: Container(
        width: size,
        height: size,
        color: backgroundColor,
        child: Stack(
          children: [
            ShaderMask(
              shaderCallback: (react) {
                return SweepGradient(
                    startAngle: 0.0,
                    endAngle: TWO_PI,
                    stops: [percent / 100, 0.0],
                    center: Alignment.center,
                    colors: [
                      colorActive,
                      colorInactive,
                    ]).createShader(react);
              },
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
            Center(
              child: Container(
                width: sizeProgress,
                height: sizeProgress,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  shape: BoxShape.circle,
                ),
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Padding(
                    padding: EdgeInsets.all(padding),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      height: imageLogoSize,
                      width: imageLogoSize,
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              new AlwaysStoppedAnimation<Color>(colorProgress),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
