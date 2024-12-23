part of '../view/add_qa_view.dart';

final class QuestionTextfield extends StatelessWidget {
  const QuestionTextfield(
      {required this.controller,
      required this.onPressed,
      required this.labelText});
  final TextEditingController controller;
  final VoidCallback onPressed;
  final String labelText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PagePadding.all(),
      child: CustomTextField(
        icon: ValueListenableBuilder(
            valueListenable: controller,
            builder: (context, value, child) => value.text.isNotEmpty
                ? IconButton(onPressed: onPressed, icon: Icon(Icons.close))
                : SizedBox.shrink()),
        controller: controller,
        keyboardType: TextInputType.text,
        labelText: labelText,
      ),
    );
  }
}
