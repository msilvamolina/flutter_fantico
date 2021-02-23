import 'package:flutter/material.dart';

import '../../../utils/responsive.dart';
import '../design/page_header.dart';

class OrientationPageBuilderWithHeaderAndScroll extends StatefulWidget {
  final Widget body;
  final Decoration headerDecoration;
  final Widget header;
  final List<Widget> appBarActions;
  final bool heigthWithAppBar;
  const OrientationPageBuilderWithHeaderAndScroll(
      {Key key,
      @required this.body,
      @required this.headerDecoration,
      @required this.header,
      this.heigthWithAppBar = false,
      this.appBarActions})
      : super(key: key);

  @override
  _OrientationPageBuilderWithHeaderAndScrollState createState() =>
      _OrientationPageBuilderWithHeaderAndScrollState();
}

class _OrientationPageBuilderWithHeaderAndScrollState
    extends State<OrientationPageBuilderWithHeaderAndScroll> {
  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    bool horizontal = orientation == Orientation.portrait ? false : true;

    return Container(
      child: !horizontal
          ? ListView(
              children: [
                PageHeader(
                    heigthWithAppBar: widget.heigthWithAppBar,
                    decoration: widget.headerDecoration,
                    actions: widget.appBarActions,
                    child: widget.header),
                widget.body
              ],
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
                          heigthWithAppBar: widget.heigthWithAppBar,
                          orientation: Orientation.landscape,
                          decoration: widget.headerDecoration,
                          actions: widget.appBarActions,
                          child: widget.header),
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
                        child: Center(
                            child: ListView(
                          children: [
                            widget.body,
                          ],
                        )),
                      ),
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
