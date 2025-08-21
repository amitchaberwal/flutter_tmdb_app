import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:insort_assignment/core/extensions/controller_extensions.dart';
import 'package:shimmer/shimmer.dart';

class ImageView extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  const ImageView({super.key, required this.imageUrl, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      height: height,
      width: width,
      placeholder: (context, url) =>
          ImageViewerShimmer(
            height: height,
            width: width,
          ),
      errorWidget: (context, url, error) =>
          ImageViewErrorWidget(
            height: height,
            width: width,
          ),
    );
  }
}


class ImageViewerShimmer extends StatelessWidget {
  final double? height;
  final double? width;
  const ImageViewerShimmer({
    super.key,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(milliseconds: 1000),
      baseColor: context.appTheme.backgroundColorSecondary,
      highlightColor: Color(0xFFD6D6D6).withValues(alpha: 0.6),
      child: Container(
        height: height ?? double.infinity,
        width: width ?? double.infinity,
        color: Colors.white,
      ),
    );
  }
}

class ImageViewErrorWidget extends StatelessWidget {
  final double? height;
  final double? width;
  const ImageViewErrorWidget({
    super.key,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? double.infinity,
      width: width ?? double.infinity,
      color: context.appTheme.backgroundColorSecondary,
      child: Icon(
        Icons.broken_image,
        size: 40.0,
        color: context.appTheme.textColorPrimary,
      ),
    );
  }
}
