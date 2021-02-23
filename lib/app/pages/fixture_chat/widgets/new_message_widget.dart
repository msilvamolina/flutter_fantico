import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../utils/app_colors.dart';
import '../../../widgets/inputs/text_cupertino_field.dart';
import '../fixture_chat_controller.dart';
import 'cupertino_loading.dart';

class NewMessageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double padding = 10;
    return GetBuilder<FixtureChatController>(
      id: 'newMessageController',
      builder: (_controller) {
        return Container(
          color: AppColors.colorBottomBarBackground,
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.fromLTRB(padding, padding, padding, 0),
              child: Row(
                children: [
                  Expanded(
                    child: TextCupertinoField(
                      labelText: 'Escribí un mensaje',
                      textInputAction: TextInputAction.done,
                      textEditingController: _controller.textController,
                      focusNode: null,
                      textCapitalization: TextCapitalization.sentences,
                      autocorrect: true,
                      onSubmitted: (_) => _controller.onMessageSave(context),
                      onChanged: _controller.onMessageChange,
                      keyboardType: TextInputType.text,
                      validator: null,
                    ),
                  ),
                  SizedBox(width: 10),
                  Padding(
                    padding: EdgeInsets.only(bottom: padding / 2),
                    child: !_controller.showLoading
                        ? IconButton(
                            onPressed: () => _controller.showSendButton
                                ? _controller.onMessageSave(context)
                                : null,
                            icon: Icon(
                              Icons.send,
                              color: _controller.showSendButton
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.5),
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.all(padding),
                            child: CupertinoLoading(),
                          ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  // return Container(
  //     color: Colors.white,
  //     padding: EdgeInsets.all(8),
  //     child: Row(
  //       children: <Widget>[
  //         Expanded(
  //           child: TextField(
  //             textCapitalization: TextCapitalization.sentences,
  //             autocorrect: true,
  //             enableSuggestions: true,
  //             decoration: InputDecoration(
  //               filled: true,
  //               fillColor: Colors.grey[100],
  //               labelText: 'Type your message',
  //               border: OutlineInputBorder(
  //                 borderSide: BorderSide(width: 0),
  //                 gapPadding: 10,
  //                 borderRadius: BorderRadius.circular(25),
  //               ),
  //             ),
  //           ),
  //         ),
  //         SizedBox(width: 20),
  //         GestureDetector(
  //           onTap: () {},
  //           child: Container(
  //             padding: EdgeInsets.all(8),
  //             decoration: BoxDecoration(
  //               shape: BoxShape.circle,
  //               color: Colors.blue,
  //             ),
  //             child: Icon(Icons.send, color: Colors.white),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );

}
