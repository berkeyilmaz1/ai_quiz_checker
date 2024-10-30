import 'package:ai_quiz_checker/product/widget/custom_elevated_button.dart';
import 'package:ai_quiz_checker/product/widget/page/page_padding.dart';
import 'package:ai_quiz_checker/product/widget/widget_sizes.dart';
import 'package:flutter/material.dart';

final class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
          children:[
               Padding(
                 padding: const PagePadding.verticalHigh(),
                 child: Text(
                  'MUALLİM',
                  style: TextStyle(fontSize: WidgetSizes.spacingXl, fontWeight: FontWeight.bold, color: Colors.buttonColor),
                               ),
               ),
              const CustomElevatedButton(),
            ],
        
        ),
      ),
    );
  }
}
class Colors {
  static Color backgroundColor = const Color.fromRGBO(20, 32, 55, 100);
  static Color buttonColor = const Color.fromRGBO(154, 183, 239, 100);
  }
