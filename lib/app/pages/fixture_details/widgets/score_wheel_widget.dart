import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

import '../../../utils/app_colors.dart';
import '../fixture_details_controller.dart';

class ScoreWheelWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double fontSizeSelect = 26;

    Color colorUnselect = Colors.white.withOpacity(0.25);
    return GetBuilder<FixtureDetailsController>(
      builder: (_controller) {
        return Container(
          height: 300,
          color: AppColors.colorBackground,
          child: Column(
            children: [
              Container(
                height: 300,
                child: Row(
                  children: [
                    Expanded(
                      child: WheelChooser.integer(
                        onValueChanged: _controller.onHomeScoreChanged,
                        maxValue: 20,
                        minValue: 0,
                        initValue: _controller.homeScore,
                        selectTextStyle: TextStyle(
                            color: Colors.white, fontSize: fontSizeSelect),
                        unSelectTextStyle:
                            TextStyle(color: colorUnselect, fontSize: 20),
                      ),
                    ),
                    Container(
                      child: Text(':',
                          style: TextStyle(
                              color: colorUnselect, fontSize: fontSizeSelect)),
                    ),
                    Expanded(
                      child: WheelChooser.integer(
                        onValueChanged: _controller.onAwayScoreChanged,
                        maxValue: 20,
                        minValue: 0,
                        initValue: _controller.awayScore,
                        selectTextStyle: TextStyle(
                            color: Colors.white, fontSize: fontSizeSelect),
                        unSelectTextStyle:
                            TextStyle(color: colorUnselect, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20),
              //   child: FlatButton(
              //     minWidth: double.infinity,
              //     height: 50,
              //     color: AppColors.colorPrimary,
              //     onPressed: () {},
              //     child: Text('Aceptar',
              //         style: TextStyle(color: Colors.white, fontSize: 16)),
              //   ),
              // )
            ],
          ),
        );
      },
    );
  }
}
