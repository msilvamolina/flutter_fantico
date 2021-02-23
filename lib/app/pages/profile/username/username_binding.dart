import 'package:get/get.dart';

import 'username_controller.dart';

class UsernameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UsernameController());
  }
}
