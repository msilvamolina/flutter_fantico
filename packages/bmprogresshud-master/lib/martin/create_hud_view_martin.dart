import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateHudViewMartin extends StatelessWidget {
  final String text;
  final Widget child;
  final String type;

  const CreateHudViewMartin(
      {Key key, @required this.text, @required this.type, @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _color;
    Color _colorText = Colors.white;

    switch (type) {
      case 'error':
        _color = Colors.pinkAccent[200].withOpacity(0.9);
        break;
      case 'success':
        _color = Colors.cyan[800].withOpacity(0.8);
        break;
      default:
        _color = Colors.pinkAccent[200].withOpacity(0.8);
    }

    return Stack(
      children: <Widget>[
        // do not response touch event
        IgnorePointer(
          ignoring: false,
          child: Container(
            color: Colors.transparent,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                decoration: BoxDecoration(
                  color: _color,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: Offset(0, 5), // changes position of shadow
                    ),
                  ],
                ),
                constraints: BoxConstraints(minHeight: 130, minWidth: 130),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(15),
                        child: child,
                      ),
                      Container(
                        child: Text(text,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: _colorText, fontSize: 16)),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
