import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../widgets/pages/builder/page_builder.dart';
import '../../widgets/pages/failure/page_load_failure.dart';
import 'home_controller.dart';
import 'views/home_view.dart';
import 'widgets/splash_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_controller) => PageBuilder(
          statusBarStyleLight: true,
          child: _controller.optionHomeFailureOrUnit.fold(() {
            return SplashScreen();
          }, (homeFailureOrUnit) {
            return homeFailureOrUnit.fold((failure) {
              return PageLoadFailure(onTap: _controller.start);
            }, (_) {
              return Obx(
                () => (_controller.forecastList != null &&
                        _controller.leaguesList != null &&
                        _controller.usersPublicList != null &&
                        _controller.fixturesList != null)
                    ? HomeView()
                    : Scaffold(
                        body: Center(child: CircularProgressIndicator()),
                      ),
              );
            });
          })),
    );
  }
}
