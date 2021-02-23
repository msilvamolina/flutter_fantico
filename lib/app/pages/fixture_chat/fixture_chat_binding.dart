import 'package:get/get.dart';

import 'fixture_chat_controller.dart';

class FixtureChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<FixtureChatController>(FixtureChatController());
  }
}
