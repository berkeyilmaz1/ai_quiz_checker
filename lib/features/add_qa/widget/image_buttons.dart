part of '../view/add_qa_view.dart';

final class ImageButtons extends StatelessWidget {
  const ImageButtons({
    super.key,
    required this.cameraOnPressed,
    required this.refreshOnPressed,
  });
  final VoidCallback cameraOnPressed;
  final VoidCallback refreshOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PagePadding.horizontal16Symmetric(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
              onPressed: refreshOnPressed, icon: Icon(Icons.refresh_rounded)),
          IconButton(
              onPressed: cameraOnPressed, icon: Icon(Icons.camera_alt_rounded)),
        ],
      ),
    );
  }
}
