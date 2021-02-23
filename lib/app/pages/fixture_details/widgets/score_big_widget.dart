import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../fixture_details_controller.dart';

class ScoreBigWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const ScoreBigWidget({Key key, @required this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double fontSize = 90;

    return GetBuilder<FixtureDetailsController>(
      id: 'scoreController',
      builder: (_controller) {
        String homeScoreStr = '-';
        String awayScoreStr = '-';

        if (_controller.homeScore != null && _controller.awayScore != null) {
          bool dobleCero =
              (_controller.homeScore > 9 || _controller.awayScore > 9);

          homeScoreStr = dobleCero && _controller.homeScore < 10
              ? "0${_controller.homeScore}"
              : "${_controller.homeScore}";

          awayScoreStr = dobleCero && _controller.awayScore < 10
              ? "0${_controller.awayScore}"
              : "${_controller.awayScore}";
        }

        // homeScoreStr = _controller.homeScore == null ? '-' : homeScoreStr;
        // awayScoreStr = _controller.awayScore == null ? '-' : awayScoreStr;

        return Container(
          child: FlatButton(
            minWidth: double.infinity,
            onPressed: onPressed,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: homeScoreStr,
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: fontSize,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  TextSpan(
                    text: ' : ',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: fontSize,
                        fontWeight: FontWeight.normal,
                        color: Colors.white.withOpacity(0.5)),
                  ),
                  TextSpan(
                    text: awayScoreStr,
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: fontSize,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
