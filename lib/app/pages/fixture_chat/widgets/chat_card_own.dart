import 'package:flutter/material.dart';

import '../../../data/models/chat/chat.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/responsive.dart';
import '../../../utils/utils.dart';

class ChatCardOwn extends StatelessWidget {
  final Chat chat;

  const ChatCardOwn({Key key, @required this.chat}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var fecha = Utils().getHourOfDate(chat.createdDate);
    double size = Responsive.of(context).width;

    double textTitle = 13;
    double dateSize = 10;

    double textSize = 15;

    double sizeCard = size * 0.75;

    double radius = 10;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: sizeCard,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.colorSecondary,
                    borderRadius: BorderRadius.all(
                      Radius.circular(radius),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        spreadRadius: 5,
                        blurRadius: 3,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Wrap(
                      alignment: WrapAlignment.end,
                      runAlignment: WrapAlignment.end,
                      crossAxisAlignment: WrapCrossAlignment.end,
                      children: [
                        Text(
                          chat.message,
                          style: TextStyle(fontSize: textSize),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            fecha,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: dateSize,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ],
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
