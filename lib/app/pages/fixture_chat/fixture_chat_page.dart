import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../utils/hacks.dart';
import '../../widgets/pages/builder/page_builder.dart';
import '../../widgets/pages/failure/page_load_failure.dart';
import 'fixture_chat_controller.dart';
import 'widgets/chat_list.dart';
import 'widgets/chats_not_found.dart';
import 'widgets/new_message_widget.dart';

class FixtureChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageBuilder(
      statusBarStyleLight: true,
      child: GetBuilder<FixtureChatController>(
        builder: (_controller) {
          return Scaffold(
            backgroundColor: AppColors.colorBackground,
            appBar: AppBar(
              elevation: 0,
              title: Text(_controller.appBarTitle),
            ),
            body: Obx(
              () {
                if (_controller.chatOrFailure != null)
                  return _controller.chatOrFailure.fold((failure) {
                    return PageLoadFailure(
                      onTap: _controller.loadList,
                    );
                  }, (chats) {
                    return Container(
                      child: Column(
                        children: [
                          Expanded(
                            child: chats.length != 0
                                ? ChatList(
                                    chats: Hacks().getChatsAndDays(chats),
                                    userEmail: _controller.userLocal.email)
                                : ChatNotFound(),
                          ),
                          NewMessageWidget(),
                        ],
                      ),
                    );
                  });
                else
                  return Center(child: CircularProgressIndicator());
              },
            ),
          );
        },
      ),
    );
  }
}
