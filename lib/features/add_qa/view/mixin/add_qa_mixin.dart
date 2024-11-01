import 'dart:io';

import 'package:ai_quiz_checker/features/add_qa/view/add_qa_view.dart';
import 'package:ai_quiz_checker/features/add_qa/widget/confirmation_dialog.dart';
import 'package:ai_quiz_checker/features/add_qa/widget/image_picker_bottom_sheet.dart';
import 'package:ai_quiz_checker/features/questions/questions_store.dart';
import 'package:ai_quiz_checker/features/questions/view/questions_view.dart';
import 'package:ai_quiz_checker/product/initialize/models/answer.dart';
import 'package:ai_quiz_checker/product/initialize/models/question.dart';
import 'package:ai_quiz_checker/product/utils/constants/product_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

mixin AddQAMixin on State<AddQAView> {
  File? selectedImage;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController textController = TextEditingController();
  final ValueNotifier<bool> isImageSelected = ValueNotifier(false);

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile == null) return;
    setState(() {
      selectedImage = File(pickedFile.path);
      isImageSelected.value = selectedImage != null;
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

  void clearTextField() {
    textController.clear();
  }

  Future<void> showConfirmationDialog(
    BuildContext context,
    QuestionsStore questionsStore,
  ) {
    return showDialog(
      context: context,
      builder: (context) => ConfirmationDialog(
        content: widget.isQuestionPage
            ? Text(ProductConstants.areYouSureQuestionContent)
            : Text(ProductConstants.areYouSureAnswerContent),
        onYes: widget.isQuestionPage
            ? () => addQuestion(questionsStore)
            : () => addAnswer(questionsStore),
      ),
    );
  }

  void addQuestion(QuestionsStore questionsStore) {
    final newQuestion = Question(title: textController.text);
    questionsStore.addQuestion(newQuestion);
    textController.clear();
    isImageSelected.value = false;
    selectedImage = null;
    navigateToQuestionView();
  }

  void addAnswer(QuestionsStore questionsStore) {
    final newAnswer = Answer(title: textController.text);
    if (widget.question == null) return;
    questionsStore.addAnswer(newAnswer, widget.question!);

    textController.clear();
    isImageSelected.value = false;

    navigateToQuestionView();
  }

  void writeToCache(List<Question> questionList) {}

  void showImageSourceDialog() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return ImagePickerBottomSheet(
          onCameraTap: () {
            Navigator.of(context).pop();
            pickImage(ImageSource.camera);
          },
          onGalleryTap: () {
            Navigator.of(context).pop();
            pickImage(ImageSource.gallery);
          },
        );
      },
    );
  }

  void navigateToQuestionView() {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => QuestionsView()),
    );
  }

  @override
  void dispose() {
    textController.dispose();
    isImageSelected.dispose();
    super.dispose();
  }
}
