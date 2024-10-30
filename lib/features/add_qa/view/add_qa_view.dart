import 'package:ai_quiz_checker/features/add_qa/view/mixin/add_qa_mixin.dart';
import 'package:ai_quiz_checker/product/utils/border_radius_general.dart';
import 'package:ai_quiz_checker/product/utils/constants/product_constants.dart';
import 'package:ai_quiz_checker/product/widget/custom_elevated_button.dart';
import 'package:ai_quiz_checker/product/widget/custom_text_field.dart';
import 'package:ai_quiz_checker/product/widget/page/page_padding.dart';
import 'package:ai_quiz_checker/product/widget/widget_sizes.dart';
import 'package:flutter/material.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            selectedImage != null
                ? Padding(
                    padding: PagePadding.all(),
                    child: Image.file(selectedImage!),
                  )
                : ImagePickerButton(
                    onTap: showImageSourceDialog,
                  ),
            _TextField(),
            _Buttons()
          ],
        ),
      ),
    );
  }
}

final class _TextField extends StatelessWidget {
  const _TextField();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PagePadding.all(),
      child: CustomTextField(
        keyboardType: TextInputType.text,
        labelText: ProductConstants.questionTitle,
      ),
    );
  }
}

final class _Buttons extends StatelessWidget {
  const _Buttons();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomElevatedButton(
          buttonText: ProductConstants.edit,
          onPressed: () {},
        ),
        CustomElevatedButton(
          buttonText: ProductConstants.save,
          onPressed: () {},
        ),
      ],
    );
  }
}
