import 'package:ai_quiz_checker/product/utils/constants/product_constants.dart';
import 'package:ai_quiz_checker/product/widgets/page/page_padding.dart';
import 'package:flutter/material.dart';

final class ImagePickerBottomSheet extends StatelessWidget {
  const ImagePickerBottomSheet({
    required this.onCameraTap,
    required this.onGalleryTap,
    super.key,
  });
  final VoidCallback onCameraTap;
  final VoidCallback onGalleryTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.all(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            ProductConstants.selectImageSource,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: onCameraTap,
                child: const Column(
                  children: [
                    Icon(Icons.camera_alt, size: 30),
                    SizedBox(height: 5),
                    Text(ProductConstants.camera),
                  ],
                ),
              ),
              GestureDetector(
                onTap: onGalleryTap,
                child: const Column(
                  children: [
                    Icon(Icons.photo_library, size: 30),
                    SizedBox(height: 5),
                    Text(ProductConstants.gallery),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
