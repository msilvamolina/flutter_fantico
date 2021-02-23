import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/responsive.dart';
import '../user_public_profile_controller.dart';
import 'user_public_profile_body.dart';

class UserPublicProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double titleSize = Responsive.of(context).percent(1.8);
    return GetBuilder<UserPublicProfileController>(
      builder: (_controller) {
        return Scaffold(
          backgroundColor: AppColors.colorBackground,
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      color: AppColors.colorBackgroundBox,
                      width: double.infinity,
                      child: SafeArea(
                        bottom: false,
                        child: Column(
                          children: [
                            SizedBox(height: 10),
                            Hero(
                              tag: "${_controller.user.email}img",
                              child: CircleAvatar(
                                radius: 90,
                                backgroundColor: AppColors.colorBackgroundBox,
                                backgroundImage: _controller.user.image != ''
                                    ? CachedNetworkImageProvider(
                                        _controller.user.image)
                                    : AssetImage('assets/images/user.png'),
                              ),
                            ),
                            SizedBox(height: 10),
                            Hero(
                              tag: "${_controller.user.email}title",
                              child: Material(
                                color: Colors.transparent,
                                child: Text(
                                  _controller.user.username,
                                  style: TextStyle(
                                    fontSize: titleSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                    UserPublicProfileBody(),
                  ],
                ),
                Container(
                  height: 120,
                  child: AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
