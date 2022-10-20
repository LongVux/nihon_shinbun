import 'package:flutter/material.dart';

class ImageHeroWidget extends StatelessWidget {
  const ImageHeroWidget(
      {super.key,
      required this.imageUrl,
      this.onTap,
      required this.width,
      required this.tag});

  final String tag;
  final String imageUrl;
  final VoidCallback? onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: tag,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
              onTap: onTap,
              child: Image(
                image: NetworkImage(imageUrl),
                fit: BoxFit.contain,
              )),
        ),
      ),
    );
  }
}
