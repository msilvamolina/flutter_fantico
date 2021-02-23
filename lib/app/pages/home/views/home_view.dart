import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/hacks.dart';
import '../home_controller.dart';
import '../widgets/app_bar_points_widget.dart';
import 'drawer/drawer.dart';
import 'notificaciones/notificaciones_view.dart';
import 'principal/principal_view.dart';
import 'rankings/rankings_view.dart';
import 'records/records_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  int tabIndex = 0;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);

    _tabController.addListener(_handleTabSelection);
  }

  _handleTabSelection() {
    changeTabIndex(_tabController.index);
  }

  void changeTabIndex(index) {
    setState(() {
      tabIndex = index;
      _tabController.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double iconSize = 32;
    Color iconColor = Colors.white;
    Color textColor = Colors.white;

    return GetBuilder<HomeController>(
      builder: (_controller) {
        String userPoints = _controller.userLocal.puntos.toString();

        int userCurrentStreak = Hacks().getUserRacha('week',
            _controller.forecastList, _controller.userLocal.email, true, true);

        String userRacha = userCurrentStreak.toString();

        return WillPopScope(
          onWillPop: () async {
            return true;
          },
          child: Scaffold(
            drawer: Drawer(child: FanticoDrawer()),
            backgroundColor: AppColors.colorBackground,
            appBar: AppBar(
              centerTitle: false,
              title: Hero(
                tag: 'logoAppBar',
                child: GestureDetector(
                  onTap: () => changeTabIndex(0),
                  child: Image.asset(
                    'assets/images/fantico-logo-bw.png',
                    width: 100,
                  ),
                ),
              ),
              elevation: 0,
              actions: [
                AppBarPointsWidgets(
                  points: userPoints,
                  image: 'assets/images/poker-chip.png',
                ),
                AppBarPointsWidgets(
                  points: userRacha,
                  image: 'assets/images/star2.png',
                ),
              ],
            ),
            body: TabBarView(
              controller: _tabController,
              children: [
                PrincipalView(),
                RecordView(),
                // PronosticosView(),
                RankingsView(),
                NotificacionesView(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: tabIndex,
              fixedColor: textColor,
              backgroundColor: AppColors.colorBottomBarBackground,
              selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: iconSize,
                    color: iconColor,
                  ),
                  label: 'Home',
                  backgroundColor: AppColors.colorBottomBarBackground,
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.emoji_events,
                    size: iconSize,
                    color: iconColor,
                  ),
                  label: 'Records',
                  backgroundColor: AppColors.colorBottomBarBackground,
                ),
                // BottomNavigationBarItem(
                //   icon: Icon(
                //     Icons.security,
                //     size: iconSize,
                //     color: iconColor,
                //   ),
                //   label: 'Pronósticos',
                //   backgroundColor: AppColors.colorBottomBarBackground,
                // ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.insights,
                    size: iconSize,
                    color: iconColor,
                  ),
                  label: 'Rankings',
                  backgroundColor: AppColors.colorBottomBarBackground,
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.notifications,
                    size: iconSize,
                    color: iconColor,
                  ),
                  label: 'Notificaciones',
                  backgroundColor: AppColors.colorBottomBarBackground,
                ),
              ],
              onTap: (index) => changeTabIndex(index),
            ),
          ),
        );
      },
    );
  }
}
