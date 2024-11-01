import 'package:ai_quiz_checker/product/utils/constants/product_constants.dart';
import 'package:ai_quiz_checker/product/widget/page/page_padding.dart';
import 'package:flutter/material.dart';

final class ImagePickerBottomSheet extends StatelessWidget {
  const ImagePickerBottomSheet({
    super.key,
    required this.onCameraTap,
    required this.onGalleryTap,
  });
  final VoidCallback onCameraTap;
  final VoidCallback onGalleryTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PagePadding.all(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            ProductConstants.selectImageSource,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: onCameraTap,
                child: Column(
                  children: [
                    Icon(Icons.camera_alt, size: 30),
                    SizedBox(height: 5),
                    Text(ProductConstants.camera),
                  ],
                ),
              ),
              GestureDetector(
                onTap: onGalleryTap,
                child: Column(
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
