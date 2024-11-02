part of '../view/add_qa_view.dart';

final class SaveButton extends StatelessWidget {
  const SaveButton(
      {required this.controller, required this.onPressed, super.key});
  final TextEditingController controller;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const PagePadding.all(),
          child: CustomElevatedButton(
            buttonTextStyle: const TextStyle(fontWeight: FontWeight.bold),
            buttonText: ProductConstants.save,
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}
