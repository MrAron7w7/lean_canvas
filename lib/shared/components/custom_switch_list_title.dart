import 'package:flutter/material.dart';

import '/shared/components/components.dart';

class CustomSwitchListTitle extends StatelessWidget {
  final String text;
  final bool value;
  final void Function(bool)? onChanged;
  final Color? textColor;
  final double? textSize;
  final FontWeight? fontWeight;
  const CustomSwitchListTitle({
    super.key,
    required this.text,
    required this.value,
    this.onChanged,
    this.textColor,
    this.textSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: CustomLabel(
        text: text,
        color: textColor,
        fontSize: textSize,
        fontWeight: fontWeight,
      ),
      value: value,
      onChanged: onChanged,
    );
  }
}
