import 'package:flutter/material.dart';
import 'package:lean_canvas_project/shared/components/components.dart';

class CustomListTile extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final Color? textColor;
  final double? textSize;
  final FontWeight? fontWeight;
  final Widget? leading;
  final Widget? trailing;
  const CustomListTile({
    super.key,
    this.onTap,
    required this.title,
    this.leading,
    this.trailing,
    this.textColor,
    this.textSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: CustomLabel(
        text: title,
        color: textColor,
        fontSize: textSize,
        fontWeight: fontWeight,
      ),
      leading: leading,
      trailing: trailing,
    );
  }
}
