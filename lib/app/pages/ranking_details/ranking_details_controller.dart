import 'package:get/get.dart';

import '../../data/models/user/user_local.dart';
import '../../data/models/user_streaks_min/user_streaks_min.dart';
import '../../routes/app_routes.dart';

class RankingDetailsController extends GetxController {
  List<UserStreakMin> _users;
  List<UserStreakMin> get users => _users;

  String _type;
  String get type => _type;

  String _title = "";
  String get title => _title;

  Map<String, UserLocal> userMap;
  @override
  void onInit() {
    _users = Get.arguments['listUsers'];
    _type = Get.arguments['type'];
    // userMap = new HashMap();

    if (type == 'month') {
      _title = 'Racha del mes';
    } else if (type == 'week') {
      _title = 'Racha de la semana';
    } else if (type == 'history') {
      _title = 'Racha de la historia';
    }

    super.onInit();
  }

  void onUserSelect(UserStreakMin user) async {
    Get.toNamed(AppRoutes.USER_PUBLIC_PROFILE,
        arguments: {'userEmail': user.userEmail});
  }
}
