import 'package:bmprogresshud/bmprogresshud.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';
import '../../../widgets/pages/builder/page_builder.dart';
import 'user_profile_controller.dart';
import 'widgets/user_profile_form.dart';

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageBuilder(
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ProgressHud(
            maximumDismissDuration: const Duration(seconds: 2),
            child: GetBuilder<UserProfileController>(
              builder: (_controller) {
                return Scaffold(
                  backgroundColor: AppColors.colorBackground,
                  appBar: AppBar(
                    leading: InkWell(
                      onTap: _controller.closePage,
                      child: Icon(
                        Icons.close, // add custom icons also
                      ),
                    ),
                    title: Text('Perfil de usuario'),
                  ),
                  body: WillPopScope(
                    onWillPop: () async {
                      return await _controller.closePage();
                    },
                    child: SingleChildScrollView(
                      child: UserProfileForm(),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
