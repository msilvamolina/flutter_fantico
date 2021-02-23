import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/responsive.dart';
import '../../../utils/utils.dart';
import '../../../widgets/cards/card_container_widget.dart';
import '../../home/views/records/widgets/record_title.dart';
import '../user_public_profile_controller.dart';
import 'user_streak_widget.dart';

class UserPublicProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, double> mapSize = Utils().getMapSize(context);
    Color colorCard = Colors.cyan[600];
    double paddingHorizontal = mapSize['paddingInteriorHorizontal'] / 2;

    double sizeTitle = Responsive.of(context).percent(1.5);
    return GetBuilder<UserPublicProfileController>(
      builder: (_controller) {
        String createdDate = "";

        if (_controller.user.createdDate != null) {
          createdDate = Utils().dateName(_controller.user.createdDate);
        }
        return Padding(
          padding: EdgeInsets.all(mapSize['paddingExterior']),
          child: Column(
            children: [
              CardContainerWidget(
                child: RecordTitle(
                  title: 'Puntos',
                  points: _controller.user.puntos.toString(),
                ),
              ),
              UserStreakWidget(userStreaksMap: _controller.getUserRachas()),
              CardContainerWidget(
                child: RecordTitle(
                  title: 'País',
                  points: _controller.user.country,
                ),
              ),
              CardContainerWidget(
                child: RecordTitle(
                  title: 'Desde',
                  points: createdDate,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
