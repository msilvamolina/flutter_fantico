import 'package:flutter/material.dart';

import '../../../utils/responsive.dart';

class PageHeader extends StatelessWidget {
  final Decoration decoration;
  final Widget child;
  final List<Widget> actions;
  final bool appBar;
  final bool heigthWithAppBar;
  final Orientation orientation;
  final bool topSpace;

  const PageHeader(
      {Key key,
      @required this.decoration,
      @required this.child,
      this.actions,
      this.appBar = false,
      this.heigthWithAppBar = false,
      this.topSpace = false,
      this.orientation = Orientation.portrait})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: orientation == Orientation.portrait
              ? Responsive.of(context).percent(heigthWithAppBar ? 20 : 25)
              : Responsive.of(context).height,
          width: Responsive.of(context).width,
          decoration: decoration,
          child: Container(
              padding: EdgeInsets.all(Responsive.of(context).percent(3)),
              child: orientation == Orientation.landscape
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        child,
                        SizedBox(
                          height: Responsive.of(context).percent(7),
                        )
                      ],
                    )
                  : child),
        ),
        appBar
            ? AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: actions)
            : Container(),
      ],
    );
  }
}
