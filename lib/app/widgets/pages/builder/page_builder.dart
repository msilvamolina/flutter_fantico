import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PageBuilder extends StatefulWidget {
  final Widget child;
  final bool statusBarStyleLight;

  const PageBuilder(
      {Key key, @required this.child, this.statusBarStyleLight = false})
      : super(key: key);
  @override
  _PageBuilderState createState() => _PageBuilderState();
}

class _PageBuilderState extends State<PageBuilder> with AfterLayoutMixin {
  @override
  void initState() {
    super.initState();
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  }

  @override
  void afterFirstLayout(BuildContext context) {
    // final bool isTablet = MediaQuery.of(context).size.shortestSide >= 600;
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
