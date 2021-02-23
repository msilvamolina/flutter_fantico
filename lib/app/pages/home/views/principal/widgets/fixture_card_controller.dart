import 'package:get/get.dart';

import '../../../../../data/models/fixture/fixture.dart';
import '../../../../../data/providers/local/local_storage.dart';
import '../../../../../routes/app_routes.dart';

class FixtureCardController extends GetxController {
  final LocalStorage _localStorage = Get.find<LocalStorage>();

  void goToFixtureDetails(Fixture fixture) async {
    var result = await Get.toNamed(
      AppRoutes.FIXTURE_DETAILS,
      arguments: fixture,
    );
  }
}
