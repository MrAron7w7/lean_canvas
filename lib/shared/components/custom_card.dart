import 'package:flutter/material.dart';
import 'package:lean_canvas_project/core/utils/utils.dart';
import 'package:lean_canvas_project/shared/components/components.dart';

class CustomCard extends StatelessWidget {
  final void Function()? onTap;
  final String image;
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;

  const CustomCard({
    super.key,
    this.onTap,
    required this.image,
    required this.text,
    this.color,
    this.fontWeight,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      color: Theme.of(context).colorScheme.surface,
      shadowColor: Colors.lightBlueAccent,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        splashColor: Colors.lightBlueAccent,
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            spacingGap(20),
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(image),
            ),
            spacingGap(10),
            CustomLabel(
              text: text,
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
            spacingGap(20),
          ],
        ),
      ),
    );
  }
}
