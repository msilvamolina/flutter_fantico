import 'package:get/get.dart';

import 'home_controller.dart';
import 'views/principal/principal_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    Get.put<PrincipalController>(PrincipalController());
  }
}
