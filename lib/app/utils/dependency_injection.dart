import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../data/providers/local/local_storage.dart';
import '../data/repositories/auth/firebase_auth_repository.dart';

class DependecyInjection {
  static void init() {
    Get.put<FirebaseFirestore>(FirebaseFirestore.instance);
    Get.put<GetStorage>(GetStorage());

    //providers
    Get.put<LocalStorage>(LocalStorage());

    //repositories
    Get.put<FirebaseAuthRepository>(FirebaseAuthRepository());
  }
}
