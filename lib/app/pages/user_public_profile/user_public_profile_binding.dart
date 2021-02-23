import 'package:get/get.dart';

import 'user_public_profile_controller.dart';

class UserPublicProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserPublicProfileController());
  }
}
