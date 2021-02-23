import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors.dart';
import 'principal_controller.dart';
import 'view/principal_day_view.dart';

class PrincipalView extends StatefulWidget {
  @override
  _PrincipalViewState createState() => _PrincipalViewState();
}

class _PrincipalViewState extends State<PrincipalView>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollViewController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3, initialIndex: 1);
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PrincipalController>(
      builder: (_controller) {
        return Scaffold(
          backgroundColor: AppColors.colorBackground,
          body: NestedScrollView(
            controller: _scrollViewController,
            headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.cyan[700],
                  toolbarHeight: 0,
                  centerTitle: false,
                  pinned: true,
                  floating: false,
                  bottom: TabBar(
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    indicatorColor: Colors.white,
                    tabs: <Widget>[
                      Tab(
                        text: "Ayer",
                      ),
                      Tab(
                        text: "Hoy",
                      ),
                      Tab(
                        text: "Mañana",
                      ),
                    ],
                    controller: _tabController,
                  ),
                )
              ];
            },
            body: TabBarView(
              children: <Widget>[
                PrincipalDayView(
                  day: _controller.mapDays[0],
                ),
                PrincipalDayView(
                  day: _controller.mapDays[1],
                ),
                PrincipalDayView(
                  day: _controller.mapDays[2],
                ),
              ],
              controller: _tabController,
            ),
          ),
        );
      },
    );
  }
}
