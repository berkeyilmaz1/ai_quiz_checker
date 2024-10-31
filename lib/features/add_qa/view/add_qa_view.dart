import 'dart:io';

import 'package:ai_quiz_checker/features/add_qa/view/mixin/add_qa_mixin.dart';
import 'package:ai_quiz_checker/product/utils/border_radius_general.dart';
import 'package:ai_quiz_checker/product/utils/constants/product_constants.dart';
import 'package:ai_quiz_checker/product/widget/custom_elevated_button.dart';
import 'package:ai_quiz_checker/product/widget/custom_text_field.dart';
import 'package:ai_quiz_checker/product/widget/page/page_padding.dart';
import 'package:ai_quiz_checker/product/widget/widget_sizes.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

part '../widget/image_buttons.dart';
part '../widget/image_picker_button.dart';
part '../widget/image_view.dart';
part '../widget/question_textfield.dart';
part '../widget/save_button.dart';

@RoutePage()
final class AddQAView extends StatefulWidget {
  const AddQAView({super.key});
  @override
  _AddQAViewState createState() => _AddQAViewState();
}

class _AddQAViewState extends State<AddQAView> with AddQAMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(ProductConstants.addQuestion),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ValueListenableBuilder(
            valueListenable: isImageSelected,
            builder: (context, value, child) => value
                ? ImageButtons(
                    refreshOnPressed: () =>
                        recognizeTextFromImage(selectedImage!),
                    cameraOnPressed: () => showImageSourceDialog(),
                  )
                : SizedBox.shrink(),
          ),
          selectedImage != null
              ? ImageView(
                  selectedImage: selectedImage,
                  onTap: () => showZoomableImage(context),
                )
              : ImagePickerButton(
                  onTap: showImageSourceDialog,
                ),
          Padding(
            padding: PagePadding.all(),
            child: Divider(),
          ),
          QuestionTextfield(
            controller: textController,
            onPressed: () => clearTextField(),
          ),
          SaveButton(
            controller: textController,
            onPressed: () => showConfirmationDialog(context),
          )
        ],
      ),
    );
  }
}
