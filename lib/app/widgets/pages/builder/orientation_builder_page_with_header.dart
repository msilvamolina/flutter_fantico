import 'package:flutter/material.dart';

import '../../../utils/responsive.dart';
import '../design/page_header.dart';

class OrientationPageBuilderWithHeader extends StatelessWidget {
  final Widget body;
  final Decoration headerDecoration;
  final Widget header;
  final List<Widget> appBarActions;
  final bool appBar;
  const OrientationPageBuilderWithHeader(
      {Key key,
      @required this.body,
      @required this.headerDecoration,
      @required this.header,
      this.appBar = false,
      this.appBarActions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    bool horizontal = orientation == Orientation.portrait ? false : true;

    return Container(
        child: !horizontal
            ? SingleChildScrollView(
                child: Container(
                  height: Responsive.of(context).height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      PageHeader(
                        decoration: headerDecoration,
                        actions: appBarActions,
                        child: header,
                        appBar: appBar,
                      ),
                      Expanded(
                        child: SafeArea(
                          top: false,
                          child: body,
                        ),
                      )
                    ],
                  ),
                ),
              )
            : Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Container(
                        height: Responsive.of(context).height,
                        child: PageHeader(
                            orientation: Orientation.landscape,
                            decoration: headerDecoration,
                            actions: appBarActions,
                            child: header),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: SingleChildScrollView(
                      child: Container(
                        padding:
                            EdgeInsets.all(Responsive.of(context).percent(2)),
                        height: Responsive.of(context).height,
                        child: SafeArea(
                          child: Center(child: body),
                        ),
                      ),
                    ),
                  )
                ],
              ));
  }
}
