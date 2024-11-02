import 'package:ai_quiz_checker/features/result/view/mixin/result_mixin.dart';
import 'package:ai_quiz_checker/product/utils/constants/product_constants.dart';
import 'package:ai_quiz_checker/product/widgets/custom_elevated_button.dart';
import 'package:ai_quiz_checker/product/widgets/page/page_padding.dart';
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
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..forward(); // Animasyonu başlat

    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn, // Animasyon eğrisi
    );
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
        opacity: animation,
        child: Center(
          child: Padding(
            padding: const PagePadding.all(),
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
                  textAlign: TextAlign.center,
                ),
                GestureDetector(
                  onTap: showBestAnswer,
                  child: Text(
                    widget.bestAnswer,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: maxLines,
                  ),
                ),
                CustomElevatedButton(
                  backgroundColor: Colors.white,
                  buttonTextStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  buttonText: ProductConstants.resources,
                  onPressed: showResourcesDialog,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
