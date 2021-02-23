import 'package:get/get.dart';

import 'choose_team_controller.dart';

class ChooseTeamBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChooseTeamController());
  }
}
