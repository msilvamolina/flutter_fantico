import 'package:flutter/material.dart';

import '../../../../../widgets/containers/animation_message_container.dart';

class NotificationNotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color colorTxt = Colors.white;
    return Container(
      child: Center(
        child: AnimationMessageContainer(
            colorTxt: colorTxt,
            animationPath: "assets/animations/notifications.flr",
            animation: 'Notifications',
            message:
                'Todavía no tenés notificaciones.\n\nEn esta pantalla te aparecerán las notificaciones que te mandemos.'),
      ),
    );
  }
}
