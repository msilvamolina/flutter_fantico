import 'package:bmprogresshud/bmprogresshud.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';
import '../../../widgets/pages/builder/page_builder.dart';
import 'choose_team_controller.dart';
import 'widgets/choose_team_form.dart';

class ChooseTeamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageBuilder(
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ProgressHud(
            maximumDismissDuration: const Duration(seconds: 2),
            child: GetBuilder<ChooseTeamController>(
              builder: (_controller) {
                return Scaffold(
                  backgroundColor: AppColors.colorBackground,
                  appBar: AppBar(
                    leading: InkWell(
                      onTap: _controller.closePage,
                      child: Icon(
                        Icons.close, // add custom icons also
                      ),
                    ),
                    title: Text('Elegir equipo'),
                  ),
                  body: Obx(() {
                    if (_controller.teamList != null)
                      return ChooseTeamForm();
                    else
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                  }),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
