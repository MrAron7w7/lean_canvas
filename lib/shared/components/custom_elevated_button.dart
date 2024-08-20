import 'package:flutter/material.dart';
import 'package:lean_canvas_project/shared/components/custom_label.dart';

class CustomElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final double sizeText;
  final String text;
  final double sizeWidth;
  final double sizeHeight;
  final Color? color;
  const CustomElevatedButton({
    super.key,
    this.onPressed,
    required this.sizeText,
    required this.text,
    required this.sizeWidth,
    required this.sizeHeight,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff274690),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: Size(sizeWidth, sizeHeight),
      ),
      child: CustomLabel(
        text: text,
        fontSize: sizeText,
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );
  }
}
