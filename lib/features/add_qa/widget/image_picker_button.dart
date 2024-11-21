part of '../view/add_qa_view.dart';

final class ImagePickerButton extends StatelessWidget {
  const ImagePickerButton({
    required this.onTap,
    super.key,
  });
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: const BorderRadiusGeneral.medium(),
        ),
        padding: const PagePadding.all(),
        child: const Icon(
          Icons.download_rounded,
          color: Colors.white,
          size: WidgetSizes.spacingXxlL12,
        ),
      ),
    );
  }
}
