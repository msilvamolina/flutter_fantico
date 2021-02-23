import 'package:flutter/material.dart';

import '../../../data/models/chat/chat.dart';
import '../../../utils/utils.dart';
import '../../home/views/principal/widgets/fixture_header.dart';
import 'chat_card.dart';
import 'chat_card_own.dart';

class ChatList extends StatelessWidget {
  final List<Chat> chats;
  final String userEmail;

  const ChatList({Key key, @required this.chats, @required this.userEmail})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        reverse: true,
        itemCount: chats.length,
        itemBuilder: (BuildContext context, int i) {
          double paddingTop = (chats.length - 1) == i ? 5 : 0;

          Chat _chat = chats[i];
          String day = Utils().onlyDate(_chat.createdDate);
          String dayNow = Utils().onlyDate(DateTime.now());

          String day2Show =
              day == dayNow ? 'Hoy' : Utils().dateName(_chat.createdDate);
          return Container(
            child: Column(
              children: [
                if (_chat.showDay) FixtureHeader(text: day2Show),
                chats[i].userEmail == userEmail
                    ? Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(top: paddingTop),
                        child: ChatCardOwn(
                          chat: _chat,
                        ),
                      )
                    : Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(top: paddingTop),
                        child: ChatCard(
                          chat: _chat,
                        ),
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
