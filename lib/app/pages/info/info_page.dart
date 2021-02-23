import 'package:bmprogresshud/bmprogresshud.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/utils.dart';
import '../../widgets/pages/builder/page_builder.dart';
import 'widgets/info_body.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double paddingExterior = 8;

    Map<String, double> mapSize = Utils().getMapSize(context);

    return PageBuilder(
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ProgressHud(
            maximumDismissDuration: const Duration(seconds: 2),
            child: Scaffold(
              backgroundColor: AppColors.colorBackground,
              appBar: AppBar(
                title: Text('Info'),
              ),
              body: SingleChildScrollView(
                child: InfoBody(
                  mapSize: mapSize,
                  paddingExterior: paddingExterior,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
