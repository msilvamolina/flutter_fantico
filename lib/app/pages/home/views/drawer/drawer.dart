import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors.dart';
import '../../../../widgets/listItem/list_item_text_and_iamge.dart';
import '../../home_controller.dart';

class FanticoDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: GetBuilder<HomeController>(
        builder: (_controller) {
          String userName = (_controller.userLocal.firstName +
                  " " +
                  _controller.userLocal.lastName)
              .toString();

          String userEmail = _controller.userLocal.email;

          return Container(
            color: AppColors.colorBackground,
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(top: 30.0),
                    decoration: BoxDecoration(
                      // Box decoration takes a gradient
                      gradient: LinearGradient(
                        // Where the linear gradient begins and ends
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        // Add one stop for each color. Stops should increase from 0 to 1
                        stops: [0, 1],
                        colors: [
                          // Colors are easy thanks to Flutter's Colors class.
                          Colors.cyan[200],
                          AppColors.colorPrimary,
                        ],
                      ),
                    ),
                    child: UserAccountsDrawerHeader(
                      decoration: BoxDecoration(),
                      currentAccountPicture: Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: _controller.userLocal.image != ''
                            ? CircleAvatar(
                                backgroundColor: AppColors.colorBackgroundBox,
                                backgroundImage: CachedNetworkImageProvider(
                                    _controller.userLocal.image))
                            : Image.asset(
                                'assets/images/user.png',
                              ),
                      ),
                      accountName:
                          Text(userName, style: TextStyle(color: Colors.white)),
                      accountEmail: Text(userEmail,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  ListItemTextAndImage(
                    onTap: () {
                      Navigator.pop(context);
                      _controller.goToInfo();
                    },
                    imagePath: 'assets/images/info.png',
                    text: "Info",
                    withIcon: false,
                  ),
                  ListItemTextAndImage(
                    onTap: () {
                      Navigator.pop(context);
                      _controller.goToPerfil();
                    },
                    imagePath: 'assets/images/user.png',
                    text: "Perfil de usuario",
                    withIcon: false,
                  ),
                  ListItemTextAndImage(
                    onTap: () {
                      Navigator.pop(context);
                      _controller.goToChooseTeam();
                    },
                    imagePath: 'assets/images/football-team.png',
                    text: "Elegir equipo",
                    withIcon: false,
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  ListItemTextAndImage(
                    onTap: () {
                      Navigator.pop(context);
                      _controller.signOut();
                    },
                    imagePath: 'assets/images/logout.png',
                    text: 'Cerrar Sesión',
                    withIcon: false,
                    withBorder: false,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
