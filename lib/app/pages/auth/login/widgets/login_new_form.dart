import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/responsive.dart';
import '../../../../widgets/buttons/full_secondary_button.dart';
import '../../../../widgets/buttons/full_third_button.dart';
import '../../../../widgets/buttons/full_with_accent_button.dart';
import '../../../../widgets/inputs/text_cupertino_field.dart';
import '../login_controller.dart';

class LoginNewForm extends StatefulWidget {
  final BoxConstraints contraints;

  const LoginNewForm({Key key, @required this.contraints}) : super(key: key);
  @override
  _LoginNewFormState createState() => _LoginNewFormState();
}

class _LoginNewFormState extends State<LoginNewForm> {
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  @override
  Widget build(BuildContext context) {
    double paddingGral = Responsive.of(context).percent(2);
    double paddingTop = Responsive.of(context).percent(3);

    return GetBuilder<LoginController>(
      builder: (_controller) {
        return Column(
          children: [
            Container(
              padding:
                  EdgeInsets.fromLTRB(paddingGral, paddingTop, paddingGral, 0),
              child: Column(
                children: [
                  GetBuilder<LoginController>(
                    id: 'emailController',
                    builder: (_emailController) {
                      return Hero(
                        tag: 'inputEmail',
                        child: TextCupertinoField(
                          labelText: 'Nombre de Usuario o Email',
                          textInputAction: TextInputAction.next,
                          autocorrect: false,
                          onSubmitted: (_) =>
                              FocusScope.of(context).requestFocus(focusNode2),
                          onChanged: _emailController.onEmailChanged,
                          focusNode: focusNode1,
                          keyboardType: TextInputType.emailAddress,
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
                    height: 13,
                  ),
                  GetBuilder<LoginController>(
                    id: 'passwordController',
                    builder: (_passwordController) {
                      return TextCupertinoField(
                        labelText: 'Contraseña',
                        textInputAction: TextInputAction.done,
                        autocorrect: false,
                        onSubmitted: (_) => FocusScope.of(context).unfocus(),
                        onChanged: _passwordController.onPasswordChanged,
                        focusNode: focusNode2,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        validator: _passwordController.showErrorMessages
                            ? _passwordController.password.value.fold(
                                (f) => f.maybeMap(
                                  shortPassword: (_) =>
                                      'La contraseña es muy corta',
                                  orElse: () => null,
                                ),
                                (_) => null,
                              )
                            : null,
                      );
                    },
                  ),
                  FullThirdButton(
                    text: "Olvidé mi contraseña",
                    onPressed: _controller.goToForgotPassword,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Hero(
                    tag: 'buttonGral',
                    child: FullWithAccentButton(
                      text: "Entrar",
                      onPressed: () =>
                          _controller.signInWithEmailAndPassword(context),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Stack(
                    children: [
                      Hero(
                        tag: 'imgFutbolistas',
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Image.asset('assets/images/futbolistas.png'),
                        ),
                      ),
                      // Positioned(
                      //   bottom: 0,
                      //   left: -22,
                      //   child: Container(
                      //     width: widget.contraints.maxWidth,
                      //     child: Text(
                      //       "Entrar con: ",
                      //       style: TextStyle(
                      //         fontSize: Responsive.of(context).percent(1.7),
                      //         fontWeight: FontWeight.w400,
                      //       ),
                      //       textAlign: TextAlign.center,
                      //     ),
                      //   ),
                      // ),
                      FullSecondaryButton(
                        text: "No tengo cuenta. Registrarme",
                        onPressed: _controller.goToSignUp,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // FullWithIconButton(
                  //   text: "Facebook",
                  //   icon: FontAwesomeIcons.facebook,
                  //   onPressed: () =>
                  //       _controller.signInWithFacebookPressed(context),
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // FullWithIconButton(
                  //   text: "Google",
                  //   icon: FontAwesomeIcons.google,
                  //   onPressed: () =>
                  //       _controller.signInWithGooglePressed(context),
                  // ),
                  SizedBox(
                    height: 10,
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
