import 'package:ai_quiz_checker/product/widgets/widget_sizes.dart';
import 'package:flutter/material.dart'; 

class PagePadding extends EdgeInsets {
  /// Padding is 20
  const PagePadding.horizontalSymmetric()
      : super.symmetric(horizontal: WidgetSizes.spacingL);

  
  /// Padding is 16
  const PagePadding.horizontal16Symmetric()
      : super.symmetric(horizontal: WidgetSizes.spacingM);

  /// Padding is 20
  const PagePadding.all() : super.all(WidgetSizes.spacingL);
}
