import 'dart:io';

import 'package:ai_quiz_checker/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

mixin HomeViewMixin on State<HomeView> {
  late final ImagePicker _picker;
  File? _image;
  File? get image => _image;
  String _extractedText = '';
  String get extractedText => _extractedText;
  @override
  void initState() {
    super.initState();
    _picker = ImagePicker();
  }

  Future<void> pickImageFromGallery() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    setState(() {
      _image = File(image.path);
    });
    await recognizeText(_image!);
  }

  Future<void> recognizeText(File image) async {
    final inputImage = InputImage.fromFile(image);
    final textDetector = TextRecognizer();
    final recognizedText = await textDetector.processImage(inputImage);
    setState(() {
      _extractedText = recognizedText.text;
    });
  }
}
