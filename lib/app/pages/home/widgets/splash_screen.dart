import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/responsive.dart';
import '../home_controller.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/pages/login/logo.png',
                  width: Responsive.of(context).percent(24),
                ),
                CupertinoTheme(
                    data: CupertinoTheme.of(context)
                        .copyWith(brightness: Brightness.light),
                    child: CupertinoActivityIndicator(
                        animating: true,
                        radius: Responsive.of(context).percent(1.4))),
              ],
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Material(
                color: Colors.transparent,
                child: GetBuilder<HomeController>(
                  id: 'versionController',
                  builder: (_controller) {
                    return Text(
                      _controller.version != null
                          ? "v${_controller.version}"
                          : "",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: Responsive.of(context).percent(1.7)),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
