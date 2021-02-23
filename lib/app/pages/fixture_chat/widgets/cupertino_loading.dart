import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double radius = 14;

    return CupertinoTheme(
        data: CupertinoTheme.of(context).copyWith(brightness: Brightness.dark),
        child: CupertinoActivityIndicator(animating: true, radius: radius));
  }
}
