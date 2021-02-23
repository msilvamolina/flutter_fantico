import 'package:flutter/material.dart';

class OrientationPageBuilderSliverWithHeaderAndScroll extends StatelessWidget {
  final Widget body;
  final Decoration headerDecoration;
  final Widget header;
  final List<Widget> appBarActions;
  final bool heigthWithAppBar;
  const OrientationPageBuilderSliverWithHeaderAndScroll(
      {Key key,
      @required this.body,
      @required this.headerDecoration,
      @required this.header,
      this.heigthWithAppBar = false,
      this.appBarActions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (_, Orientation orientation) {
        if (orientation == Orientation.portrait) {
          return body;
        }
      },
    );
  }
}
