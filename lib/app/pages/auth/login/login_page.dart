import 'package:bmprogresshud/bmprogresshud.dart';
import 'package:flutter/material.dart';

import '../../../widgets/pages/builder/page_builder.dart';
import 'widgets/login_new_body.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageBuilder(
      statusBarStyleLight: true,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ProgressHud(
            maximumDismissDuration: const Duration(seconds: 2),
            child: LoginNewBody(),
          ),
        ),
      ),
    );
  }
}
