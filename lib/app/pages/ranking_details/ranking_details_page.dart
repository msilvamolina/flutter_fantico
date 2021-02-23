import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../widgets/pages/builder/page_builder.dart';
import 'ranking_details_controller.dart';
import 'widgets/rankings_user_title.dart';

class RankingDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double paddingExterior = 18;

    return PageBuilder(
      child: GetBuilder<RankingDetailsController>(
        builder: (_controller) {
          return Scaffold(
              backgroundColor: AppColors.colorBackground,
              appBar: AppBar(
                title: Text(_controller.title),
              ),
              body: ListView(
                children: ListTile.divideTiles(
                  color: Colors.cyan[800],
                  tiles: [
                    for (int i = 0; i < _controller.users.length; i++)
                      InkWell(
                        onTap: () =>
                            _controller.onUserSelect(_controller.users[i]),
                        child: Padding(
                          padding: EdgeInsets.all(paddingExterior),
                          child: RankingsUserCard(user: _controller.users[i]),
                        ),
                      ),
                  ],
                ).toList(),
              ));
        },
      ),
    );
  }
}
