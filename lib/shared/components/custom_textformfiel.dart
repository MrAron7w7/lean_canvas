import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextformfiel extends StatelessWidget {
  final TextInputType keyboardType;
  final String? hintText;
  final String? labelText;
  final Icon? icon;
  final int? maxLength;
  final int? maxLines;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomTextformfiel({
    super.key,
    required this.keyboardType,
    this.hintText,
    required this.controller,
    this.validator,
    this.maxLength,
    this.labelText,
    this.icon,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      validator: validator,
      cursorColor: const Color(0xff576CA8),
      keyboardType: keyboardType,
      controller: controller,
      maxLength: maxLength,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(),
        labelStyle:
            GoogleFonts.poppins(color: Theme.of(context).colorScheme.tertiary),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary, width: 2.0),
          borderRadius: BorderRadius.circular(12.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.tertiary, width: 1.5),
          borderRadius: BorderRadius.circular(12.0),
        ),
        prefixIcon: icon,
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 20.0,
        ),
      ),
    );
  }
}
