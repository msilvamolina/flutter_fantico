import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/responsive.dart';
import '../../../../widgets/buttons/full_third_button.dart';
import '../../../../widgets/buttons/full_with_accent_button.dart';
import '../email_verification_controller.dart';

class EmailVerificationForm extends StatelessWidget {
  final BoxConstraints contraints;

  const EmailVerificationForm({Key key, @required this.contraints})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double paddingGral = Responsive.of(context).percent(2);
    double paddingTop = Responsive.of(context).percent(3);

    return GetBuilder<EmailVerificationController>(
      builder: (_controller) {
        return Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(
                  paddingGral, paddingTop / 2, paddingGral, 0),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 2),
                    width: double.infinity,
                    padding: EdgeInsets.only(
                        top: Responsive.of(context).percent(0.6)),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.center,
                      children: <Widget>[
                        Text(
                          'Necesitás verificar tu email para continuar',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.white.withOpacity(0.8),
                            fontSize: Responsive.of(context).percent(1.6),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    child: Wrap(
                      children: <Widget>[
                        Text(
                          'Te mandamos a tu cuenta de email, un correo con las instrucciones para verificar tu cuenta.\n\nSi no lo recibiste, te lo podemos volver enviar.',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: Responsive.of(context).percent(1.55),
                              fontWeight: FontWeight.normal,
                              color: Colors.cyanAccent),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Hero(
                    tag: 'buttonGral',
                    child: FullWithAccentButton(
                      text: "Ya verifiqué mi cuenta",
                      onPressed: () =>
                          _controller.checkEmailVerification(context),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  FullThirdButton(
                    text: "Necesito que me reenvien el email",
                    colorTxt: Colors.white,
                    onPressed: () =>
                        _controller.reenviarEmailVerification(context),
                  ),
                  Hero(
                    tag: 'imgFutbolistas',
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Image.asset('assets/images/futbolistas.png'),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FullThirdButton(
                    text: "Cerrar Sesión",
                    colorTxt: Colors.cyanAccent,
                    onPressed: _controller.signOut,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
