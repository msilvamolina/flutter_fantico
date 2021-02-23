import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors.dart';
import '../../widgets/login_header.dart';
import '../login_controller.dart';
import 'login_new_form.dart';

class LoginNewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_controller) {
        return LayoutBuilder(
          builder: (_, contraints) {
            return Center(
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    child: Hero(
                      tag: 'loginHeader',
                      child: LoginHeader(contraints: contraints),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Hero(
                      tag: "backgroundGral",
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.colorBackground,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.35),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        width: contraints.maxWidth,
                        height: contraints.maxHeight * 0.73,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: contraints.maxWidth,
                      height: contraints.maxHeight * 0.73,
                      child: SingleChildScrollView(
                        child: LoginNewForm(
                          contraints: contraints,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
