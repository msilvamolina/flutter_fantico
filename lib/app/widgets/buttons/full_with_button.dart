import 'package:flutter/cupertino.dart';

class FullWithButton extends StatelessWidget {
  final Color backgroundColor, textColor;
  final String text;
  final VoidCallback onPressed;
  final double height, fontSize;

  const FullWithButton(
      {Key key,
      @required this.backgroundColor,
      @required this.textColor,
      @required this.text,
      @required this.fontSize,
      @required this.onPressed,
      @required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double newHeight = (height * 0.25) + height;
    return Container(
      height: newHeight,
      child: ConstrainedBox(
          constraints: const BoxConstraints(minWidth: double.infinity),
          child: CupertinoButton(
            color: backgroundColor,
            child: Text(text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Roboto',
                    color: textColor,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w500)),
            onPressed: onPressed,
          )),
    );
  }
}
