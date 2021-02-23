import 'package:flutter/material.dart';

class ChatDayTitle extends StatelessWidget {
  final String day;

  const ChatDayTitle({Key key, @required this.day}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Text(day),
      ),
    );
  }
}
