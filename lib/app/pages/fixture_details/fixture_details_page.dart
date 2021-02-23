import 'package:bmprogresshud/bmprogresshud.dart';
import 'package:flutter/material.dart';

import '../../widgets/pages/builder/page_builder.dart';
import 'widgets/fixture_details_body.dart';

class FixtureDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageBuilder(
      child: Scaffold(
        body: ProgressHud(
          maximumDismissDuration: const Duration(seconds: 2),
          child: FixtureDetailsBody(),
        ),
      ),
    );
  }
}
