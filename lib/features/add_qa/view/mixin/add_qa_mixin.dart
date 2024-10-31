import 'dart:io';

import 'package:ai_quiz_checker/features/add_qa/view/add_qa_view.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

mixin AddQAMixin on State<AddQAView> {
  File? selectedImage;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController textController = TextEditingController();

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile == null) return;
    setState(() {
      selectedImage = File(pickedFile.path);
    });
    await recognizeTextFromImage(File(pickedFile.path));
  }

  Future<void> recognizeTextFromImage(File image) async {
    final inputImage = InputImage.fromFile(image);
    final textRecognizer = TextRecognizer();
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);

    setState(() {
      textController.text = recognizedText.text;
    });

    textRecognizer.close();
  }

  void showZoomableImage(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: InteractiveViewer(
            child: Image.file(selectedImage!),
          ),
        );
      },
    );
  }

  void showImageSourceDialog() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Select Image Source",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Kamera Seçeneği
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      pickImage(ImageSource.camera);
                    },
                    child: Column(
                      children: [
                        Icon(Icons.camera_alt, size: 30),
                        SizedBox(height: 5),
                        Text("Camera"),
                      ],
                    ),
                  ),
                  // Galeri Seçeneği
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      pickImage(ImageSource.gallery);
                    },
                    child: Column(
                      children: [
                        Icon(Icons.photo_library, size: 30),
                        SizedBox(height: 5),
                        Text("Gallery"),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
