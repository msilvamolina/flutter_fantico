import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../utils/responsive.dart';
import '../../../../widgets/buttons/full_third_button.dart';
import '../../../../widgets/buttons/full_with_accent_button.dart';
import '../../../../widgets/inputs/text_cupertino_field.dart';
import '../user_profile_controller.dart';

class UserProfileForm extends StatefulWidget {
  @override
  _UserProfileFormState createState() => _UserProfileFormState();
}

class _UserProfileFormState extends State<UserProfileForm> {
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusNode focusNode3 = new FocusNode();
  FocusNode focusNode4 = new FocusNode();
  FocusNode focusNode5 = new FocusNode();
  FocusNode focusNode6 = new FocusNode();
  FocusNode focusNode7 = new FocusNode();

  @override
  Widget build(BuildContext context) {
    double paddingGral = Responsive.of(context).percent(2);
    double paddingTop = Responsive.of(context).percent(3);

    double separationheight = 13;

    double imageSize = Responsive.of(context).percent(16);

    return GetBuilder<UserProfileController>(
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
                          'Completá tu perfil para ganar 100 puntos',
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
                  GetBuilder<UserProfileController>(
                    id: 'userImageUpdate',
                    builder: (_userImageController) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () => _controller.choosePicture(context),
                            child: _userImageController.userImageURL != ''
                                ? ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(imageSize),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          _userImageController.userImageURL,
                                      width: imageSize,
                                      placeholder: (context, url) => Center(
                                        child: Container(
                                            width: imageSize,
                                            height: imageSize,
                                            child: Center(
                                                child:
                                                    CircularProgressIndicator())),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Image.asset(
                                        'assets/images/user.png',
                                        width: imageSize,
                                      ),
                                    ),
                                  )
                                : Image.asset(
                                    'assets/images/user.png',
                                    width: imageSize,
                                  ),
                          ),
                          SizedBox(height: separationheight / 2),
                          _userImageController.showErrorMessages &&
                                  _userImageController.userImageURL == ''
                              ? Container(
                                  width: double.infinity,
                                  child: Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    alignment: WrapAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Tenés que subir una imagen',
                                        style: TextStyle(
                                          color: Colors.pinkAccent[100],
                                          fontSize: Responsive.of(context)
                                              .percent(1.3),
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                )
                              : Container(
                                  width: double.infinity,
                                  child: Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    alignment: WrapAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Presioná en la imagen\npara cambiarla',
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.8),
                                          fontSize: Responsive.of(context)
                                              .percent(1.3),
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                )
                        ],
                      );
                    },
                  ),
                  SizedBox(height: separationheight),
                  FullThirdButton(
                    colorTxt: Colors.cyanAccent,
                    text: "Completar el perfil más adelante",
                    onPressed: _controller.closePage,
                  ),
                  SizedBox(height: separationheight),
                  GetBuilder<UserProfileController>(
                    id: 'fistNameUpdate',
                    builder: (_fistNameController) {
                      return TextCupertinoField(
                        labelText: 'Tu nombre real',
                        textInputAction: TextInputAction.next,
                        textEditingController:
                            _fistNameController.firstNameController,
                        focusNode: focusNode1,
                        textCapitalization: TextCapitalization.words,
                        autocorrect: true,
                        onSubmitted: (_) =>
                            FocusScope.of(context).requestFocus(focusNode2),
                        onChanged: _fistNameController.onFirstNameChanged,
                        keyboardType: TextInputType.text,
                        validator: _fistNameController.showErrorMessages
                            ? _fistNameController.firstName.value.fold(
                                (f) => f.maybeMap(
                                  shortString: (_) =>
                                      'Tenés que ingresar un nombre',
                                  orElse: () => null,
                                ),
                                (_) => null,
                              )
                            : null,
                      );
                    },
                  ),
                  SizedBox(height: separationheight),
                  GetBuilder<UserProfileController>(
                    id: 'lastNameUpdate',
                    builder: (_lastNameController) {
                      return TextCupertinoField(
                        labelText: 'Tu apellido real',
                        textInputAction: TextInputAction.next,
                        autocorrect: true,
                        textCapitalization: TextCapitalization.words,
                        onChanged: _lastNameController.onLastNameChanged,
                        textEditingController:
                            _lastNameController.lastNameController,
                        keyboardType: TextInputType.text,
                        onSubmitted: (_) =>
                            FocusScope.of(context).requestFocus(focusNode3),
                        focusNode: focusNode2,
                        validator: _lastNameController.showErrorMessages
                            ? _lastNameController.lastName.value.fold(
                                (f) => f.maybeMap(
                                  shortString: (_) =>
                                      'Tenés que ingresar un apellido',
                                  orElse: () => null,
                                ),
                                (_) => null,
                              )
                            : null,
                      );
                    },
                  ),
                  SizedBox(height: separationheight),
                  GetBuilder<UserProfileController>(
                    id: 'birthdateUpdate',
                    builder: (_birthdateController) {
                      return TextCupertinoField(
                        onTap: _birthdateController.showDatePicker,
                        readOnly: true,
                        textEditingController: _controller.birthdateController,
                        labelText: 'Fecha de nacimiento',
                        textInputAction: TextInputAction.next,
                        autocorrect: false,
                        onChanged: (_) {},
                        keyboardType: TextInputType.text,
                        onSubmitted: (_) =>
                            FocusScope.of(context).requestFocus(focusNode4),
                        focusNode: focusNode3,
                        validator: _birthdateController.showErrorMessages
                            ? _birthdateController.birthdate.value.fold(
                                (f) => f.maybeMap(
                                  invalidDate: (_) => 'Fecha inválida',
                                  invalidMinimumDate: (_) =>
                                      'Tenés que ser mayor de 10 años',
                                  orElse: () => null,
                                ),
                                (_) => null,
                              )
                            : null,
                      );
                    },
                  ),
                  SizedBox(height: separationheight),
                  GetBuilder<UserProfileController>(
                    id: 'userSexUpdate',
                    builder: (_userSexController) {
                      return TextCupertinoField(
                        onTap: _userSexController.chooseUserSex,
                        textEditingController:
                            _userSexController.userSexController,
                        labelText: 'Sexo',
                        textInputAction: TextInputAction.done,
                        readOnly: true,
                        autocorrect: false,
                        onChanged: (_) {},
                        keyboardType: TextInputType.text,
                        onSubmitted: (_) =>
                            FocusScope.of(context).requestFocus(focusNode5),
                        focusNode: focusNode4,
                        validator: _userSexController.showErrorMessages
                            ? _userSexController.userSex.value.fold(
                                (f) => f.maybeMap(
                                  shortString: (_) =>
                                      'Tenés que elegir un sexo',
                                  orElse: () => null,
                                ),
                                (_) => null,
                              )
                            : null,
                      );
                    },
                  ),
                  SizedBox(height: separationheight),
                  GetBuilder<UserProfileController>(
                    id: 'countryUpdate',
                    builder: (_countryController) {
                      return TextCupertinoField(
                        labelText: 'País',
                        textInputAction: TextInputAction.next,
                        autocorrect: true,
                        textEditingController:
                            _countryController.countryController,
                        onChanged: _controller.onCountryChanged,
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.text,
                        onSubmitted: (_) =>
                            FocusScope.of(context).requestFocus(focusNode6),
                        focusNode: focusNode5,
                        validator: _countryController.showErrorMessages
                            ? _countryController.country.value.fold(
                                (f) => f.maybeMap(
                                  shortString: (_) =>
                                      'Tenés que ingresar un país',
                                  orElse: () => null,
                                ),
                                (_) => null,
                              )
                            : null,
                      );
                    },
                  ),
                  SizedBox(height: separationheight),
                  GetBuilder<UserProfileController>(
                    id: 'cityUpdate',
                    builder: (_cityController) {
                      return TextCupertinoField(
                        labelText: 'Ciudad',
                        textInputAction: TextInputAction.next,
                        autocorrect: true,
                        onChanged: _cityController.onCityChanged,
                        textEditingController: _cityController.cityController,
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.text,
                        onSubmitted: (_) =>
                            FocusScope.of(context).requestFocus(focusNode7),
                        focusNode: focusNode6,
                        validator: _cityController.showErrorMessages
                            ? _cityController.city.value.fold(
                                (f) => f.maybeMap(
                                  shortString: (_) =>
                                      'Tenés que ingresar un apellido',
                                  orElse: () => null,
                                ),
                                (_) => null,
                              )
                            : null,
                      );
                    },
                  ),
                  SizedBox(height: separationheight),
                  GetBuilder<UserProfileController>(
                    id: 'telephoneUpdate',
                    builder: (_telephoneController) {
                      return TextCupertinoField(
                        labelText: 'Teléfono',
                        textInputAction: TextInputAction.done,
                        autocorrect: false,
                        onSubmitted: (_) => FocusScope.of(context).unfocus(),
                        onChanged: _telephoneController.onTelephoneChanged,
                        textEditingController:
                            _telephoneController.telephoneController,
                        keyboardType: TextInputType.phone,
                        focusNode: focusNode7,
                        validator: _telephoneController.showErrorMessages
                            ? _telephoneController.telephone.value.fold(
                                (f) => f.maybeMap(
                                  invalidPhoneNumber: (_) =>
                                      'Telefono inválido',
                                  orElse: () => null,
                                ),
                                (_) => null,
                              )
                            : null,
                      );
                    },
                  ),
                  SizedBox(height: separationheight * 2),
                  FullWithAccentButton(
                    text: "Guardar Perfil",
                    onPressed: () => _controller.saveForm(context),
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
