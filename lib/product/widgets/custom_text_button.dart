import 'package:ai_quiz_checker/product/utils/border_radius_general.dart';
import 'package:flutter/material.dart';

final class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    required this.buttonText,
    required this.onPressed,
    this.buttonTextStyle,
    super.key,
  });

  final VoidCallback onPressed;
  final String buttonText;
  final TextStyle? buttonTextStyle;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusGeneral.low(),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: buttonTextStyle,
      ),
    );
  }
}
