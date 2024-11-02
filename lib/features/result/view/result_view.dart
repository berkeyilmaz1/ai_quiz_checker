import 'package:ai_quiz_checker/features/result/view/mixin/result_mixin.dart';
import 'package:ai_quiz_checker/product/utils/constants/product_constants.dart';
import 'package:ai_quiz_checker/product/widget/custom_elevated_button.dart';
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
  final double accuracyRate;
  final String bestAnswer;
  final String resources;

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView>
    with ResultMixin, SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..forward(); // Animasyonu başlat

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn, // Animasyon eğrisi
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Kontrolörü serbest bırak
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: checkBackgroundColor(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: navigateToQuestionView,
          icon: const Icon(Icons.close_rounded, color: Colors.white),
        ),
      ),
      body: FadeTransition(
        opacity: _animation,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '%${widget.accuracyRate.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.bestAnswer,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CustomElevatedButton(
                buttonText: ProductConstants.resources,
                onPressed: _showResourcesDialog,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showResourcesDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Resources'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(widget.resources), // resources içeriği
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop(); // Dialogu kapat
              },
            ),
          ],
        );
      },
    );
  }
}
