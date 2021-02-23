import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/responsive.dart';
import '../../../../widgets/buttons/full_with_accent_button.dart';
import '../../../../widgets/inputs/text_cupertino_field.dart';
import '../signup_controller.dart';

class SignUpForm extends StatefulWidget {
  final BoxConstraints contraints;

  const SignUpForm({Key key, @required this.contraints}) : super(key: key);
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusNode focusNode3 = new FocusNode();
  FocusNode focusNode4 = new FocusNode();
  @override
  Widget build(BuildContext context) {
    double paddingGral = Responsive.of(context).percent(2);
    double paddingTop = Responsive.of(context).percent(3);

    return GetBuilder<SignupController>(
      builder: (_controller) {
        return Column(
          children: [
            Container(
              padding:
                  EdgeInsets.fromLTRB(paddingGral, paddingTop, paddingGral, 0),
              child: Column(
                children: [
                  GetBuilder<SignupController>(
                    id: 'usernameController',
                    builder: (_usernameController) {
                      return TextCupertinoField(
                        labelText: 'Nombre de Usuario',
                        textInputAction: TextInputAction.next,
                        autocorrect: false,
                        onSubmitted: (_) =>
                            FocusScope.of(context).requestFocus(focusNode2),
                        onChanged: _usernameController.onUsernameChanged,
                        focusNode: focusNode1,
                        keyboardType: TextInputType.text,
                        validator: _usernameController.showErrorMessages
                            ? _usernameController.username.value.fold(
                                (f) => f.maybeMap(
                                  shortString: (_) => 'Username muy corto',
                                  orElse: () => null,
                                ),
                                (_) => null,
                              )
                            : null,
                      );
                    },
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  GetBuilder<SignupController>(
                    id: 'emailController',
                    builder: (_emailController) {
                      return Hero(
                        tag: 'inputEmail',
                        child: TextCupertinoField(
                          labelText: 'Email',
                          textInputAction: TextInputAction.next,
                          autocorrect: false,
                          onSubmitted: (_) =>
                              FocusScope.of(context).requestFocus(focusNode3),
                          onChanged: _emailController.onEmailChanged,
                          focusNode: focusNode2,
                          keyboardType: TextInputType.emailAddress,
                          validator: _emailController.showErrorMessages
                              ? _emailController.emailAddress.value.fold(
                                  (f) => f.maybeMap(
                                    invalidEmail: (_) => 'Email inválido',
                                    orElse: () => null,
                                  ),
                                  (_) => null,
                                )
                              : null,
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  GetBuilder<SignupController>(
                    id: 'passwordController',
                    builder: (_passwordController) {
                      return TextCupertinoField(
                        labelText: 'Contraseña',
                        textInputAction: TextInputAction.next,
                        autocorrect: false,
                        onSubmitted: (_) =>
                            FocusScope.of(context).requestFocus(focusNode4),
                        onChanged: _passwordController.onPasswordChanged,
                        focusNode: focusNode3,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        validator: _passwordController.showErrorMessages
                            ? _passwordController.password.value.fold(
                                (f) => f.maybeMap(
                                  shortPassword: (_) =>
                                      'La contraseña es muy corta',
                                  weakPassword: (_) =>
                                      'La contraseña tiene que tener un número y letras',
                                  orElse: () => null,
                                ),
                                (_) => null,
                              )
                            : null,
                      );
                    },
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  GetBuilder<SignupController>(
                    id: 'passwordController',
                    builder: (_confirmPasswordController) {
                      return TextCupertinoField(
                        labelText: 'Confirmar contraseña',
                        textInputAction: TextInputAction.done,
                        autocorrect: false,
                        onSubmitted: (_) => FocusScope.of(context).unfocus(),
                        onChanged:
                            _confirmPasswordController.onConfirmPasswordChanged,
                        focusNode: focusNode4,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        validator: _controller.showErrorMessages
                            ? (_controller.showPasswordNotMatchedError
                                ? 'Las contraseñas tiene que ser iguales'
                                : null)
                            : null,
                      );
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Hero(
                    tag: 'buttonGral',
                    child: FullWithAccentButton(
                      text: "Registrarme",
                      onPressed: () =>
                          _controller.signUpWithEmailAndPassword(context),
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
