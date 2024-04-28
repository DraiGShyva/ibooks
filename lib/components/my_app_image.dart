import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyAppImage extends StatefulWidget {
  const MyAppImage({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
  });

  final String imageUrl;
  final double? height;
  final double? width;

  @override
  State<MyAppImage> createState() => _MyAppImageState();
}

class _MyAppImageState extends State<MyAppImage> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.imageUrl,
      height: widget.height,
      width: widget.width,
      fit: BoxFit.cover,
      placeholder: (context, url) => const Center(
          child: Padding(
        padding: EdgeInsets.all(8.0),
        child:
            SizedBox(height: 50, width: 50, child: CircularProgressIndicator()),
      )),
      errorWidget: (context, url, error) => Image.asset(
        'assets/images/error/oops.jpg',
        height: widget.height,
        width: widget.width,
        fit: BoxFit.cover,
      ),
    );
  }
}
