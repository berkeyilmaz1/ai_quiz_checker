import 'package:ai_quiz_checker/features/result/view/mixin/result_mixin.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
final class ResultView extends StatefulWidget {
  const ResultView({
    required this.accuracyRate,
    required this.bestAnswer,
    required this.resources,
    super.key,
  });
  final String accuracyRate;
  final String bestAnswer;
  final String resources;

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> with ResultMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: navigateToQuestionView,
          icon: const Icon(Icons.close_rounded),
        ),
      ),
      body: Column(
        children: [
          Text(widget.accuracyRate),
          Text(widget.bestAnswer),
          Text(widget.resources),
        ],
      ),
    );
  }
}
