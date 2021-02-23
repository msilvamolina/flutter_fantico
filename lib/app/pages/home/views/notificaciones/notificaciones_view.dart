import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors.dart';
import '../../../../widgets/pages/failure/page_load_failure.dart';
import 'notificaciones_controller.dart';
import 'widgets/notification_not_found.dart';
import 'widgets/notifications_card.dart';

class NotificacionesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationsController>(
      init: NotificationsController(),
      builder: (_controller) {
        return Scaffold(
          backgroundColor: AppColors.colorBackground,
          body: Obx(
            () {
              if (_controller.notificationsOrFailure != null)
                return _controller.notificationsOrFailure.fold((failure) {
                  return PageLoadFailure(
                    onTap: _controller.loadList,
                  );
                }, (notifications) {
                  return notifications.length != 0
                      ? ListView(
                          children: ListTile.divideTiles(
                            color: Colors.grey[400],
                            tiles: [
                              for (int i = 0; i < notifications.length; i++)
                                NotificationCard(
                                  notification: notifications[i],
                                )
                            ],
                          ).toList(),
                        )
                      : NotificationNotFound();
                });
              else
                return Center(child: CircularProgressIndicator());
            },
          ),
        );
      },
    );
  }
}
