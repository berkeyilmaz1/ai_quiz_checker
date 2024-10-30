import 'package:ai_quiz_checker/product/utils/border_radius_general.dart';
import 'package:ai_quiz_checker/product/widget/page/page_padding.dart';
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
  });
  final TextInputType? keyboardType;
  final String Function(String?)? validator;
  final TextEditingController? controller;
  final String labelText;
  final bool obscureText;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.all(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            onChanged: onChanged,
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            validator: validator,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              labelText: labelText,
              border: const OutlineInputBorder(
                borderRadius: BorderRadiusGeneral.allLow(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
