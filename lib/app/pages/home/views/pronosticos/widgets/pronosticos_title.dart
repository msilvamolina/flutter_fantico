import 'package:flutter/material.dart';

class PronosticosTitle extends StatelessWidget {
  final String text;
  final double size;
  const PronosticosTitle({Key key, @required this.text, @required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
