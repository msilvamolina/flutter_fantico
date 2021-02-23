import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/pages/builder/page_builder.dart';
import 'user_public_profile_controller.dart';
import 'widgets/user_public_profile_view.dart';

class UserPublicProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageBuilder(
      child: GetBuilder<UserPublicProfileController>(
        id: 'controllerGRAL',
        builder: (_controller) {
          return UserPublicProfileView();
        },
      ),
    );
  }
}
