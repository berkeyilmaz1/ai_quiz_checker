part of '../view/add_qa_view.dart';

final class SaveButton extends StatelessWidget {
  const SaveButton({required this.controller, required this.onPressed});
  final TextEditingController controller;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: PagePadding.all(),
          child: CustomElevatedButton(
            buttonText: ProductConstants.save,
            onPressed: onPressed,
          ).ext.toDisabled(disable: controller.text.isEmpty),
        ),
      ],
    );
  }
}
