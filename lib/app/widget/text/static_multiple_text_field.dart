import 'package:flutter/material.dart';
import 'package:hr_management_app/app/common/text_styles.dart';


/// Static multiple text field.
@immutable
class StaticMultipleTextField extends StatelessWidget {
  const StaticMultipleTextField(this.label, this.values);
  final String label;
  final List<String> values;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        label.isNotEmpty ? Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyles.textStyle14PrimaryGrey,
        ) : Container(),
        Column(children: values.map((String value) => Row(
          children: <Widget>[
            Container(
              width: 5.0,
              height: 5.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue
              )
            ),
            const SizedBox(width: 14.0),
            Expanded(
              child: Text(
                value ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.textStyle20PrimaryBlack,
              )
            )
          ]
        )).toList())
      ]
    );
  }
}
