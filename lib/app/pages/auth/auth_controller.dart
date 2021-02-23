import 'package:get/get.dart';

import '../../data/repositories/auth/firebase_auth_repository.dart';
import '../../routes/app_routes.dart';

class AuthController extends GetxController {
  final FirebaseAuthRepository _firebaseAuthRepository =
      Get.find<FirebaseAuthRepository>();

  Future<void> signOut() async {
    try {
      await _firebaseAuthRepository.signOut();
    } catch (e) {}
    Get.offNamedUntil(AppRoutes.HOME, (_) => false);
  }
}
