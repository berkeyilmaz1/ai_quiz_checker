import 'package:ai_quiz_checker/product/utils/border_radius_general.dart';
import 'package:flutter/material.dart';

final class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    required this.buttonText,
    required this.onPressed,
    this.backgroundColor,
    this.buttonTextStyle,
    super.key,
  });
  final Color? backgroundColor;
  final VoidCallback onPressed;
  final String buttonText;
  final TextStyle? buttonTextStyle;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
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
