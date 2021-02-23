import 'package:get/get.dart';

import 'ranking_details_controller.dart';

class RankingDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<RankingDetailsController>(RankingDetailsController());
  }
}
