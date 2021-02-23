import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class LoadingScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorBackground,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
