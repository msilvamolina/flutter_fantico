import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../pages/auth/auth_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/responsive.dart';
import '../../buttons/raised_gradient_button.dart';

class PageLoadFailure extends StatelessWidget {
  final VoidCallback onTap;

  const PageLoadFailure({Key key, @required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (_controller) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            actions: [
              InkWell(
                onTap: _controller.signOut,
                child: Container(
                  width: Responsive.of(context).percent(5.5),
                  child: Icon(
                    Icons.exit_to_app,
                  ),
                ),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(35),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/error-network.png',
                    width: Responsive.of(context).percent(20),
                  ),
                  SizedBox(
                    height: Responsive.of(context).percent(2),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.all(Responsive.of(context).percent(1.7)),
                    child: Text(
                      'No pudimos cargar la página.\n\nEsto se debe a que no encontramos conexión, o hubo un error al cargar los datos.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: Responsive.of(context).percent(1.7),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: Responsive.of(context).percent(2)),
                    child: RaisedGradientButton(
                      child: Text(
                        'Reintentar',
                        style: TextStyle(
                            fontSize: Responsive.of(context).percent(1.7),
                            fontWeight: FontWeight.w500),
                      ),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                            AppColors.colorSecondary,
                            AppColors.colorSecondary,
                          ],
                          stops: [
                            0.1,
                            0.9
                          ]),
                      height: Responsive.of(context).percent(4),
                      onPressed: onTap,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
