import 'package:ai_quiz_checker/product/utils/border_radius_general.dart';
import 'package:flutter/material.dart';

/// CustomTextField is a custom text field widget that can be used to
/// create text fields with a label and hint text.
final class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.keyboardType,
    required this.labelText,
    this.obscureText = false,
    super.key,
    this.validator,
    this.controller,
    this.onChanged,
    this.icon,
  });
  final TextInputType? keyboardType;
  final String Function(String?)? validator;
  final TextEditingController? controller;
  final String labelText;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          onChanged: onChanged,
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          validator: validator,
          decoration: InputDecoration(
            floatingLabelStyle: const TextStyle(
              color: Color(0xFF4765ff),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF4765ff),
              ),
            ),
            suffixIcon: icon,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            labelText: labelText,
            border: const OutlineInputBorder(
              borderRadius: BorderRadiusGeneral.medium(),
            ),
          ),
        ),
      ],
    );
  }
}
