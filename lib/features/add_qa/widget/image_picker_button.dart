part of '../view/add_qa_view.dart';

final class ImagePickerButton extends StatelessWidget {
  const ImagePickerButton({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadiusGeneral.allLow(),
        ),
        padding: PagePadding.all(),
        child: Icon(
          Icons.download_rounded,
          color: Colors.white,
          size: WidgetSizes.spacingXxlL12,
        ),
      ),
    );
  }
}
