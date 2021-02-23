import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../../data/models/notifications/app_notification.dart';
import '../../../../data/models/user/user_local.dart';
import '../../../../data/providers/local/local_storage.dart';
import '../../../../data/repositories/home/notifications_repository.dart';
import '../../../../domain/notifications/notifications_failure.dart';

class NotificationsController extends GetxController {
  final NotificationsRepository _notificationsRepository =
      NotificationsRepository();
  final LocalStorage _localStorage = Get.find<LocalStorage>();

  Rx<Either<NotificationsFailure, List<AppNotification>>>
      notificationsListOrFailure =
      Rx<Either<NotificationsFailure, List<AppNotification>>>();

  Either<NotificationsFailure, List<AppNotification>>
      get notificationsOrFailure => notificationsListOrFailure.value;
  UserLocal _user;
  void loadList() async => await _load();

  @override
  void onReady() async {
    _user = await _localStorage.getUser();

    await _load();
    await _markAdRead();
    super.onReady();
  }

  void onRefresh() async {
    await _load();
    await _markAdRead();
    // _refreshController.refreshCompleted();
  }

  Future<void> _load() async {
    notificationsListOrFailure.bindStream(
        _notificationsRepository.getNotifications(userEmail: _user.email));
  }

  Future<void> _markAdRead() async {
    await _notificationsRepository.markAsRead(userEmail: _user.email);
  }

  void sendNotification() async {
    await _notificationsRepository.sendNotification(
        userEmail: _user.email, userNombre: _user.firstName);
  }
}
