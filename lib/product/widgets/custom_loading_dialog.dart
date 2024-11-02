import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

final class CustomLoadingDialog extends StatelessWidget {
  const CustomLoadingDialog({super.key});
  static const loading = 'Loading...';

  static Future<T> show<T>({
    required BuildContext context,
    required Future<T> future,
  }) async {
    unawaited(
      showDialog<CustomLoadingDialog>(
        context: context,
        barrierDismissible: false,
        builder: (context) => const CustomLoadingDialog(),
      ),
    );
    final result = await future;
    if (context.mounted) {
      await context.router.maybePop();
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Color(0xFF4765ff),
      ),
    );
  }
}
