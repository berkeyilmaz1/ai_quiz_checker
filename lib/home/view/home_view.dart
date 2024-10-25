import 'package:ai_quiz_checker/home/view/mixin/home_view_mixin.dart';
import 'package:flutter/material.dart';

final class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ignore: prefer_if_elements_to_conditional_expressions
            image == null ? const SizedBox.shrink() : Image.file(image!),
            ElevatedButton(
              onPressed: pickImageFromGallery,
              child: const Text('Pick Image'),
            ),
            const SizedBox(height: 16),
            const Text('Tespit Edilen Metin:'),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(extractedText),
            ),
          ],
        ),
      ),
    );
  }
}
