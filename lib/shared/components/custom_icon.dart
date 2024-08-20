import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final IconData? iconType;
  final double? sizeIcon;
  final Color? colorIcon;
  const CustomIcon({
    super.key,
    this.iconType,
    this.sizeIcon,
    this.colorIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconType,
      color: colorIcon ?? Theme.of(context).colorScheme.tertiary,
      size: sizeIcon,
    );
  }
}
