import 'package:flutter/material.dart';
import 'package:hr_management_app/app/common/app_colors.dart';
import 'package:hr_management_app/app/common/text_styles.dart';


/// Edit text field.
@immutable
class EditTextField extends StatelessWidget {
  const EditTextField({this.title, this.hint, this.obscureText = false, this.prefixIcon, this.hasLabel = true,
    this.controller, this.onTextChanged, this.error, this.line = 1, this.enabled = true, this.suffixIcon, this.onTextCompleted});

  final String title;
  final String hint;
  final String error;
  final bool hasLabel;
  final bool obscureText;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final Function onTextChanged;
  final TextEditingController controller;
  final int line;
  final bool enabled;
  final Function onTextCompleted;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        hasLabel ? Text(
          title,
          style: TextStyles.textStyle16PrimaryGrey,
        ) : Container(),
        hasLabel ? const SizedBox(height: 10) : Container(),
        Container(
          height: line * 50.0,
          child: TextField(
            onEditingComplete: onTextCompleted,
            enabled: enabled,
            decoration: InputDecoration(
              hintText: hint,
              contentPadding: const EdgeInsets.fromLTRB(13.0, 11.0, 5.0, 11.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: const BorderSide(color: AppColors.editTextFieldBorderColor, width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: const BorderSide(color: AppColors.editTextFieldBorderColor, width: 1.0),
              ),
              prefixIcon: prefixIcon == null ? null : prefixIcon,
              suffixIcon: suffixIcon == null ? null : suffixIcon,
              fillColor: !enabled ? AppColors.backgroundLightGreyColor : Colors.white,
              filled: true
            ),
            obscureText: obscureText,
            onChanged: onTextChanged,
            controller: controller,
            style: TextStyles.textStyle16PrimaryGrey,
            maxLines: line,
          )
        ),
        error != null && error.isNotEmpty ? Container(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Text(error, style: TextStyles.textStyle14PrimaryRed)
        ) : Container()
      ]
    );
  }
}
