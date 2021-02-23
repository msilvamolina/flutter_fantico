import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors.dart';
import '../../widgets/login_header.dart';
import '../forgot_password_controller.dart';
import 'forgot_password_new_form.dart';

class ForgotPasswordBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPasswordController>(
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
                        child: ForgotPasswordNewForm(
                          contraints: contraints,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 16,
                    left: -8,
                    child: InkWell(
                      onTap: () => Get.back(),
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(10),
                        child: Icon(
                          Icons.chevron_left,
                          size: 46,
                          color: AppColors.colorPrimary,
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
