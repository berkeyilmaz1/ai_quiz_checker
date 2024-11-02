import 'package:ai_quiz_checker/product/widgets/custom_loading_dialog.dart';
import 'package:flutter/material.dart';

extension CustomFutureExtension<T> on Future<T> {
  Future<T> makeWithLoadingDialog({required BuildContext context}) async {
    final result =
        await CustomLoadingDialog.show(context: context, future: this);
    return result;
  }
}
