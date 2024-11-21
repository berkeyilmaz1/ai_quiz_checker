import 'package:ai_quiz_checker/product/widgets/widget_sizes.dart';
import 'package:flutter/material.dart';

final class BorderRadiusGeneral extends BorderRadius {
  /// Radius is 12 [Radius.circular]
  const BorderRadiusGeneral.medium()
      : super.all(const Radius.circular(WidgetSizes.spacingS));

  /// Radius is 8 [Radius.circular]
  const BorderRadiusGeneral.low()
      : super.all(const Radius.circular(WidgetSizes.spacingXs));
}
