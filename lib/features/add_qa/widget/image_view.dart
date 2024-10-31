part of '../view/add_qa_view.dart';

final class ImageView extends StatelessWidget {
  const ImageView({
    super.key,
    required this.selectedImage,
    required this.onTap,
  });

  final File? selectedImage;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PagePadding.all(),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: WidgetSizes.spacingXxlL12,
          child: Image.file(selectedImage!),
        ),
      ),
    );
  }
}
