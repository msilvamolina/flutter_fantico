import 'package:flutter/material.dart';

import '../../../utils/responsive.dart';
import '../design/page_header.dart';

class OrientationPageBuilderColumnWithHeaderAndScroll extends StatelessWidget {
  final Widget body;
  final Decoration headerDecoration;
  final Widget header;
  final List<Widget> appBarActions;
  final bool heigthWithAppBar;
  const OrientationPageBuilderColumnWithHeaderAndScroll(
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
          return Column(
            children: [
              PageHeader(
                  heigthWithAppBar: heigthWithAppBar,
                  decoration: headerDecoration,
                  actions: appBarActions,
                  child: header),
              body
            ],
          );
        } else {
          return Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Container(
                    height: Responsive.of(context).height,
                    child: PageHeader(
                        heigthWithAppBar: heigthWithAppBar,
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
                    padding: EdgeInsets.all(Responsive.of(context).percent(2)),
                    height: Responsive.of(context).height,
                    child: SafeArea(
                      child: Center(
                          child: Column(
                        children: [
                          body,
                        ],
                      )),
                    ),
                  ),
                ),
              )
            ],
          );
        }
      },
    );
  }
}
