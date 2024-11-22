part of '../view/add_qa_view.dart';

final class ImageView extends StatelessWidget {
  const ImageView({
    required this.selectedImage,
    required this.onTap,
    super.key,
  });

  final File? selectedImage;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.all(),
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          height: WidgetSizes.spacingtwoHundred,
          child: Image.file(selectedImage!),
        ),
      ),
    );
  }
}
