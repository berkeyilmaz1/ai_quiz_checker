import 'package:ai_quiz_checker/features/add_qa/view/mixin/add_qa_mixin.dart';
import 'package:ai_quiz_checker/product/utils/border_radius_general.dart';
import 'package:ai_quiz_checker/product/utils/constants/product_constants.dart';
import 'package:ai_quiz_checker/product/widget/custom_elevated_button.dart';
import 'package:ai_quiz_checker/product/widget/custom_text_field.dart';
import 'package:ai_quiz_checker/product/widget/page/page_padding.dart';
import 'package:ai_quiz_checker/product/widget/widget_sizes.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

part '../widget/image_picker_button.dart';

class AddQAView extends StatefulWidget {
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
          selectedImage != null
              ? Padding(
                  padding: PagePadding.all(),
                  child: GestureDetector(
                    onTap: () => showZoomableImage(context),
                    child: Container(
                      height: 200,
                      child: Image.file(selectedImage!),
                    ),
                  ),
                )
              : ImagePickerButton(
                  onTap: showImageSourceDialog,
                ),
          _TextField(controller: textController),
          _Buttons(controller: textController)
        ],
      ),
    );
  }
}

final class _TextField extends StatelessWidget {
  final TextEditingController controller;

  const _TextField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PagePadding.all(),
      child: CustomTextField(
        controller: controller,
        keyboardType: TextInputType.text,
        labelText: ProductConstants.questionTitle,
      ),
    );
  }
}

final class _Buttons extends StatelessWidget {
  final TextEditingController controller;

  const _Buttons({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ValueListenableBuilder(
          valueListenable: controller,
          builder: (context, value, child) => CustomElevatedButton(
            buttonText: ProductConstants.edit,
            onPressed: () {},
          ).ext.toDisabled(disable: controller.text.isEmpty),
        ),
        CustomElevatedButton(
          buttonText: ProductConstants.save,
          onPressed: () {},
        ),
      ],
    );
  }
}
