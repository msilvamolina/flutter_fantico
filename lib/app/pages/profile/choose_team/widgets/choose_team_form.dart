import 'package:flutter/material.dart';
import 'package:flutter_typeahead/cupertino_flutter_typeahead.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/responsive.dart';
import '../../../../widgets/buttons/full_third_button.dart';
import '../../../../widgets/buttons/full_with_accent_button.dart';
import '../../../../widgets/inputs/text_cupertino_field.dart';
import '../choose_team_controller.dart';
import 'team_validator.dart';

class ChooseTeamForm extends StatefulWidget {
  @override
  _ChooseTeamFormState createState() => _ChooseTeamFormState();
}

class _ChooseTeamFormState extends State<ChooseTeamForm> {
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();

  @override
  Widget build(BuildContext context) {
    double paddingGral = Responsive.of(context).percent(2);
    double paddingTop = Responsive.of(context).percent(3);

    double separationheight = 13;

    double imageSize = Responsive.of(context).percent(16);

    return GetBuilder<ChooseTeamController>(
      builder: (_controller) {
        return Column(
          children: [
            Container(
              padding:
                  EdgeInsets.fromLTRB(paddingGral, paddingTop, paddingGral, 0),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.center,
                      children: <Widget>[
                        Text(
                          'Elige tu equipo para ganar más puntos',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Responsive.of(context).percent(1.6),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: separationheight),
                  GetBuilder<ChooseTeamController>(
                    id: 'sportUpdate',
                    builder: (_fistNameController) {
                      return TextCupertinoField(
                        labelText: 'Deporte',
                        textInputAction: TextInputAction.next,
                        focusNode: focusNode1,
                        readOnly: true,
                        textEditingController: _controller.sportController,
                        onTap: _controller.chooseSport,
                        textCapitalization: TextCapitalization.words,
                        autocorrect: true,
                        keyboardType: TextInputType.text,
                        onChanged: (_) {},
                        onSubmitted: (_) =>
                            FocusScope.of(context).requestFocus(focusNode2),
                        validator: _fistNameController.showErrorMessages
                            ? _fistNameController.sport.value.fold(
                                (f) => f.maybeMap(
                                  shortString: (_) =>
                                      'Tenés que elegir un deporte',
                                  orElse: () => null,
                                ),
                                (_) => null,
                              )
                            : null,
                      );
                    },
                  ),
                  SizedBox(height: separationheight),
                  GetBuilder<ChooseTeamController>(
                    id: "teamUpdate",
                    builder: (_teamController) {
                      return Column(
                        children: [
                          CupertinoTypeAheadFormField(
                            getImmediateSuggestions: true,
                            suggestionsBoxController:
                                _controller.suggestionsBoxController,
                            textFieldConfiguration:
                                CupertinoTextFieldConfiguration(
                              style: TextStyle(color: Colors.white),
                              cursorColor: AppColors.colorSecondary,
                              controller: _controller.typeAheadController,
                              placeholder: "Equipo",
                              padding: EdgeInsets.fromLTRB(16, 10, 20, 10),
                              decoration: BoxDecoration(
                                color: AppColors.colorPrimary,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                            ),
                            suggestionsCallback: (pattern) =>
                                _controller.getSuggestions(pattern),
                            itemBuilder: (context, suggestion) {
                              return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Material(
                                  color: Colors.transparent,
                                  child: Text(
                                    suggestion,
                                    style: TextStyle(
                                      color: Colors.cyan[800],
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              );
                            },
                            onSuggestionSelected: _controller.onTeamSelect,
                          ),
                          TeamValidator(
                            validator: _teamController.showErrorMessages
                                ? _teamController.team.value.fold(
                                    (f) => f.maybeMap(
                                      shortString: (_) =>
                                          'Tenés que elegir un equipo',
                                      orElse: () => null,
                                    ),
                                    (_) => null,
                                  )
                                : null,
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: separationheight * 2),
                  FullWithAccentButton(
                    text: "Guardar",
                    onPressed: () => _controller.saveForm(context),
                  ),
                  SizedBox(height: separationheight),
                  FullThirdButton(
                    colorTxt: Colors.cyanAccent,
                    text: "Agregaré mi equipo favorito después",
                    onPressed: _controller.closePage,
                  ),
                  SizedBox(
                    height: 60,
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
