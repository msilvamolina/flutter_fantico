import 'dart:collection';

import 'package:get/get.dart';

import '../../data/models/user_public/user_public.dart';
import '../../utils/hacks.dart';
import '../home/home_controller.dart';

class UserPublicProfileController extends GetxController {
  final HomeController homeController = Get.find<HomeController>();

  UserPublic _user;
  UserPublic get user => _user;

  String _title = "";
  String get title => _title;

  bool _loading = true;
  bool get loading => _loading;

  String userEmail;
  @override
  void onInit() {
    userEmail = Get.arguments['userEmail'];
    var userMap = homeController.usersPublicMap;
    _user = userMap[userEmail];
    super.onInit();
  }

  Map<String, int> getUserRachas() {
    Map<String, int> map = new HashMap();
    map['current'] = Hacks().getUserRacha(
        'week', homeController.forecastList, userEmail, true, true);
    map['week'] = Hacks().getUserRacha(
        'week', homeController.forecastList, userEmail, true, false);

    map['month'] = Hacks().getUserRacha(
        'month', homeController.forecastList, userEmail, true, false);
    map['history'] = Hacks().getUserRacha(
        'history', homeController.forecastList, userEmail, true, false);
    map['historyPositive'] = Hacks().getUserRacha(
        'history', homeController.forecastList, userEmail, true, false);
    map['historyNegative'] = Hacks().getUserRacha(
        'history', homeController.forecastList, userEmail, false, false);

    return map;
  }
}
