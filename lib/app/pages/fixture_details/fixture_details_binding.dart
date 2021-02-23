import 'package:get/get.dart';

import 'fixture_details_controller.dart';

class FixtureDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<FixtureDetailsController>(FixtureDetailsController());
  }
}
