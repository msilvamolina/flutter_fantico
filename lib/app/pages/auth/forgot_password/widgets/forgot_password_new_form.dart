import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/responsive.dart';
import '../../../../widgets/buttons/full_with_accent_button.dart';
import '../../../../widgets/inputs/text_cupertino_field.dart';
import '../forgot_password_controller.dart';

class ForgotPasswordNewForm extends StatelessWidget {
  final BoxConstraints contraints;

  const ForgotPasswordNewForm({Key key, @required this.contraints})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double paddingGral = Responsive.of(context).percent(2);
    double paddingTop = Responsive.of(context).percent(3);

    return GetBuilder<ForgotPasswordController>(
      builder: (_controller) {
        return Column(
          children: [
            _controller.emailSubmit
                ? Container(
                    padding: EdgeInsets.all(Responsive.of(context).percent(2)),
                    child: Text(
                      "¡Listo! te mandamos un email a la dirección que nos proporcionaste con las instrucciones para restablecer tu contraseña.\n\nPor favor revisá tu bandeja de entrada. Si no lo encontrás, probá con ingresar a la bandeja de spam.",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Colors.white.withOpacity(0.8),
                          fontSize: Responsive.of(context).percent(1.5),
                          fontWeight: FontWeight.w400),
                    ),
                  )
                : Container(
                    padding: EdgeInsets.fromLTRB(
                        paddingGral, paddingTop / 2, paddingGral, 0),
                    child: Column(
                      children: [
                        Text(
                          "Ingresá tu email y te mandaremos un correo con las instrucciones para restablecer tu contraseña",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.white.withOpacity(0.8),
                            fontSize: Responsive.of(context).percent(1.5),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        GetBuilder<ForgotPasswordController>(
                          id: 'emailController',
                          builder: (_emailController) {
                            return Hero(
                              tag: 'inputEmail',
                              child: TextCupertinoField(
                                labelText: 'Nombre de Usuario o Email',
                                textInputAction: TextInputAction.done,
                                autocorrect: false,
                                onSubmitted: (_) =>
                                    FocusScope.of(context).unfocus(),
                                onChanged: _emailController.onEmailChanged,
                                keyboardType: TextInputType.emailAddress,
                                focusNode: FocusScopeNode(),
                                validator: _emailController.showErrorMessages
                                    ? !_emailController.invalidEmail
                                        ? (_emailController
                                            .emailAddressorUsername.value
                                            .fold(
                                            (f) => f.maybeMap(
                                              shortString: (_) =>
                                                  'Username muy corto',
                                              orElse: () => null,
                                            ),
                                            (_) => null,
                                          ))
                                        : 'E-mail inválido'
                                    : null,
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Hero(
                          tag: 'buttonGral',
                          child: FullWithAccentButton(
                            text: "Enviar email",
                            onPressed: () =>
                                _controller.sendEmailForgotPassword(context),
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Hero(
                          tag: 'imgFutbolistas',
                          child: Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Image.asset('assets/images/futbolistas.png'),
                          ),
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
