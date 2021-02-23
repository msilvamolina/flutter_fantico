import 'package:flutter/material.dart';

class OrientationPageBuilderScroll extends StatelessWidget {
  final Widget body;
  const OrientationPageBuilderScroll({
    Key key,
    @required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (_, Orientation orientation) {
      return SafeArea(
        child: ListView(
          children: [body],
        ),
      );
    });
  }
}
