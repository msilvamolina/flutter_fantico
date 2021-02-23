import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../utils/app_colors.dart';
import '../../utils/responsive.dart';

class TextCupertinoField extends HookWidget {
  final String validator;
  final String labelText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final void Function(String text) onChanged;
  final void Function(String) onSubmitted;
  final bool autocorrect;
  final bool obscureText;
  final VoidCallback obscureTextOnTap;
  final FocusNode focusNode;
  final VoidCallback onTap;
  final bool readOnly;
  final TextCapitalization textCapitalization;
  final TextEditingController textEditingController;
  const TextCupertinoField({
    Key key,
    @required this.validator,
    this.obscureText = false,
    this.obscureTextOnTap,
    this.onTap,
    this.readOnly = false,
    this.textCapitalization = TextCapitalization.none,
    this.textEditingController,
    @required this.labelText,
    @required this.keyboardType,
    @required this.textInputAction,
    @required this.onChanged,
    @required this.onSubmitted,
    @required this.autocorrect,
    @required this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _obscureTextEnabled = useState(obscureText);

    return Column(
      children: [
        CupertinoTextField(
          controller: textEditingController,
          focusNode: focusNode,
          onTap: onTap,
          autocorrect: autocorrect,
          readOnly: readOnly,
          placeholder: labelText,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          padding: EdgeInsets.fromLTRB(16, 10, 20, 10),
          placeholderStyle: TextStyle(color: Colors.white),
          style: TextStyle(color: Colors.white),
          cursorColor: AppColors.colorSecondary,
          obscureText: _obscureTextEnabled.value,
          onChanged: onChanged,
          textCapitalization: textCapitalization,
          onSubmitted: onSubmitted,
          suffix: obscureText
              ? InkWell(
                  onTap: () =>
                      _obscureTextEnabled.value = !_obscureTextEnabled.value,
                  child: Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      _obscureTextEnabled.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: _obscureTextEnabled.value
                          ? Colors.grey[400]
                          : Colors.white,
                      size: Responsive.of(context).percent(2),
                    ),
                  ),
                )
              : null,
          decoration: BoxDecoration(
            color: AppColors.colorPrimary,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 2),
          width: double.infinity,
          padding: EdgeInsets.only(
              top: Responsive.of(context).percent(0.6),
              left: Responsive.of(context).percent(1.6)),
          child: Wrap(
            children: <Widget>[
              validator != null
                  ? Text(
                      validator.toString(),
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: Responsive.of(context).percent(1.5),
                        fontWeight: FontWeight.normal,
                        color: Colors.pinkAccent[100],
                      ),
                    )
                  : Container(),
            ],
          ),
        )
      ],
    );
  }
}
