import 'package:flutter/material.dart';
import 'package:hr_management_app/app/common/app_colors.dart';

/// Primary button.
@immutable
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({this.backgroundColor, this.text, this.onPressed, this.height = 50.0, this.hasShadow = true, this.fontSize = 16, this.fontWeight = FontWeight.normal});

  final Color backgroundColor;
  final String text;
  final Function onPressed;
  final double height;
  final bool hasShadow;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        boxShadow: hasShadow ? const <BoxShadow>[
          BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 2.0),
            blurRadius: 4.0,
            spreadRadius: -1.0
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 1.0),
            blurRadius: 10.0,
            spreadRadius: 1.0
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 4.0),
            blurRadius: 5.0,
            spreadRadius: 1.0
          )
        ] : <BoxShadow>[],
        color: AppColors.lightPrimaryColor,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: FlatButton(
        child: Text(
          text,
          style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        textColor: Colors.white,
        disabledTextColor: AppColors.secondaryGreyColor,
        disabledColor: AppColors.backgroundLightGreyColor,
        onPressed: onPressed,
      )
    );
  }
}
