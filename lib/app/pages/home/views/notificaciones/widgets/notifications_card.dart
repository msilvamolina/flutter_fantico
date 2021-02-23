import 'package:flutter/material.dart';

import '../../../../../data/models/notifications/app_notification.dart';
import '../../../../../utils/responsive.dart';
import '../../../../../utils/utils.dart';

class NotificationCard extends StatelessWidget {
  final AppNotification notification;

  const NotificationCard({Key key, this.notification}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var fecha = Utils().getDateHourName(notification.createdDate);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ListTile(
            isThreeLine: true,
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30,
              child: Image.asset(
                'assets/images/fantico.png',
                width: Responsive.of(context).percent(4),
              ),
              foregroundColor: Colors.white,
            ),
            title: Text(
              notification.titulo,
              style: TextStyle(
                fontSize: Responsive.of(context).percent(1.6),
              ),
            ),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  child: Text(
                    notification.mensaje,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: Responsive.of(context).percent(1.5),
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: Responsive.of(context).percent(0.5)),
                  width: double.infinity,
                  child: Text(
                    fecha,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: Responsive.of(context).percent(1.3),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
