import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../utils/responsive.dart';
import '../../../../widgets/buttons/full_with_accent_button.dart';
import '../../../../widgets/inputs/text_cupertino_field.dart';
import '../username_controller.dart';

class UsernameForm extends StatelessWidget {
  final BoxConstraints contraints;

  const UsernameForm({Key key, @required this.contraints}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double paddingGral = Responsive.of(context).percent(2);
    double paddingTop = Responsive.of(context).percent(3);

    return GetBuilder<UsernameController>(
      builder: (_controller) {
        return Column(
          children: [
            Container(
              padding:
                  EdgeInsets.fromLTRB(paddingGral, paddingTop, paddingGral, 0),
              child: Column(
                children: [
                  !_controller.usernameErrorMsg
                      ? Column(
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
                                    'Crea un usuario para poder continuar',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: Colors.white.withOpacity(0.8),
                                      fontSize:
                                          Responsive.of(context).percent(1.6),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                          ],
                        )
                      : Container(),
                  _controller.usernameErrorMsg
                      ? Column(
                          children: [
                            Container(
                              width: double.infinity,
                              child: Wrap(
                                children: <Widget>[
                                  Text(
                                    'El username ingresado, ya se encuentra registrado en nuestro sistema. Por favor, ingresa otro distinto.',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: Responsive.of(context)
                                            .percent(1.55),
                                        fontWeight: FontWeight.normal,
                                        color: Colors.cyanAccent),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        )
                      : Container(),
                  GetBuilder<UsernameController>(
                    id: 'usernameController',
                    builder: (_usernameController) {
                      return Hero(
                        tag: 'inputUsername',
                        child: TextCupertinoField(
                          labelText: 'Nombre de usuario',
                          textInputAction: TextInputAction.done,
                          autocorrect: false,
                          onSubmitted: (_) => FocusScope.of(context).unfocus(),
                          onChanged: _usernameController.onUsernameChanged,
                          keyboardType: TextInputType.text,
                          focusNode: FocusScopeNode(),
                          validator: _usernameController.showErrorMessages
                              ? _usernameController.username.value.fold(
                                  (f) => f.maybeMap(
                                    shortString: (_) => 'Username muy corto',
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
                    height: 20,
                  ),
                  Hero(
                    tag: 'buttonGral',
                    child: FullWithAccentButton(
                      text: "Continuar",
                      onPressed: () => _controller.createUsername(context),
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
