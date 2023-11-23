import 'package:flutter/material.dart';

class ImageProfile extends StatelessWidget {
  final String image;
  final double? width;
  final double? height;

  const ImageProfile({
    super.key,
    this.width,
    this.height,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 120.0,
      height: height ?? 120.0,
      alignment: Alignment.bottomRight,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue,
      ),
      child: Container(
        padding: const EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          shape: BoxShape.circle,
          border: Border.all(
            width: 2.0,
            color: Colors.white,
          ),
        ),
        child: const Icon(
          Icons.edit,
          color: Colors.black,
          size: 18.0,
        ),
      ),
    );
  }
}
