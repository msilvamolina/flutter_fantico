import 'dart:collection';

import 'package:get/get.dart';

import '../../../../data/models/user_public/user_public.dart';
import '../../../../data/models/user_streaks_min/user_streaks_min.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/hacks.dart';
import '../../../../utils/utils.dart';
import '../../home_controller.dart';

class RankingsController extends GetxController {
  final HomeController _homeController = Get.find<HomeController>();

  @override
  void onReady() async {
    super.onReady();
  }

  List<UserStreakMin> getUsersRacha(String type) {
    DateTime date = DateTime.now();

    DateTime startDate, endDate;
    if (type == 'week') {
      int weekday = date.weekday;
      int weekStart = weekday - 1;
      int weekend = 7 - weekday;

      DateTime weekStartDate = date.add(Duration(days: -weekStart));
      DateTime weekEndDate = date.add(Duration(days: weekend));

      String _weekStartStr = Utils().onlyDate(weekStartDate);
      String _weekEndStr = Utils().onlyDate(weekEndDate);

      String _newWeekStartStr = _weekStartStr + " 00:00:00";
      String _newWeekEndStr = _weekEndStr + " 23:59:59";

      startDate = DateTime.parse(_newWeekStartStr);
      endDate = DateTime.parse(_newWeekEndStr);
    }
    if (type == 'month') {
      startDate = DateTime(date.year, date.month, 1);
      endDate = DateTime(date.year, date.month + 1, 1);
    }

    if (type == 'history') {
      startDate = DateTime.parse('2020-01-01 00:00:00');
      endDate = date.add(Duration(days: 1));
    }

    List<UserStreakMin> racha = [];
    List<UserStreakMin> rachaForReturn = [];
    if (startDate != null && endDate != null) {
      racha = Hacks().usersRachas(
          _homeController.forecastList, startDate, endDate, null, true, false);
    }

    Map<String, bool> userEmailUsed = new HashMap();

    var allUserList = _homeController.usersPublicList;
    Map<String, UserPublic> allUserMap = _homeController.usersPublicMap;

    if (racha.length > 0) {
      for (var i = 0; i < racha.length; i++) {
        UserStreakMin _user = racha[i];
        if (userEmailUsed[_user.userEmail] == null) {
          var _u1 = allUserMap[_user.userEmail];

          UserStreakMin _u = UserStreakMin(
              userEmail: _u1.email,
              racha: _user.racha,
              username: _u1.username,
              image: _u1.image);

          rachaForReturn.add(_u);
          userEmailUsed[_user.userEmail] = true;
        }
      }
    }

    for (var i = 0; i < allUserList.length; i++) {
      UserPublic _user = allUserList[i];
      if (userEmailUsed[_user.email] == null) {
        UserStreakMin _u = UserStreakMin(
            userEmail: _user.email,
            racha: 0,
            username: _user.username,
            image: _user.image);
        rachaForReturn.add(_u);
        userEmailUsed[_user.email] = true;
      }
    }

    return rachaForReturn;
  }

  void goToRankingDetails(List<UserStreakMin> listUsers, String type) {
    Get.toNamed(AppRoutes.RANKING_DETAILS,
        arguments: {'listUsers': listUsers, 'type': type});
  }
}
