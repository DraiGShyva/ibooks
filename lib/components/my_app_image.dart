import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:ibooks/utils/local_image.dart';

class MyAppImage extends StatefulWidget {
  const MyAppImage(
    this.imageUrl, {
    super.key,
    this.errorImage = ERROR_IMG,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
  });

  final String imageUrl;
  final String errorImage;
  final double? height;
  final double? width;
  final BoxFit? fit;

  @override
  State<MyAppImage> createState() => _MyAppImageState();

  static file(String avatar,
      {double? width, double? height, BoxFit fit = BoxFit.cover}) {
    return Image.file(
      File(avatar),
      height: height,
      width: width,
      fit: fit,
    );
  }
}

class _MyAppImageState extends State<MyAppImage> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.imageUrl,
      height: widget.height,
      width: widget.width,
      fit: widget.fit,
      placeholder: (context, url) => const Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: CircleAvatar(child: CircularProgressIndicator()),
        ),
      ),
      errorWidget: (context, url, error) => Image.asset(
        widget.imageUrl.contains('assets')
            ? widget.imageUrl
            : widget.errorImage,
        height: widget.height,
        width: widget.width,
        fit: widget.fit,
      ),
      cacheManager: CacheManager(
        Config(
          'myapp_image_cache',
          stalePeriod: const Duration(days: 7),
          maxNrOfCacheObjects: 1000,
        ),
      ),
    );
  }
}
