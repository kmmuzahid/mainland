import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mainland/core/utils/log/error_log.dart';
import 'package:mainland/gen/assets.gen.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CommonImage extends StatelessWidget {
  const CommonImage({
    required this.imageSrc,
    this.imageColor,
    this.height,
    this.borderRadius = 0,
    this.width,
    this.size,
    this.fill = BoxFit.fill,
    this.defaultImage,
    super.key,
  });
  final String imageSrc;
  final String? defaultImage;
  final Color? imageColor;
  final double? height;
  final double? width;
  final double borderRadius;
  final double? size;

  final BoxFit fill;

  void checkImageType() {}

  @override
  Widget build(BuildContext context) {
    if (imageSrc.isEmpty) return const SizedBox();

    if (imageSrc.startsWith('assets/svg')) {
      return _buildSvgImage();
    } else if (imageSrc.startsWith('assets/')) {
      return _buildPngImage();
    } else if (imageSrc.startsWith('http')) {
      return _buildNetworkImage();
    } else {
      return _buildFileImage();
    }
  }

  Widget _buildErrorWidget() {
    return Image.asset(defaultImage ?? Assets.icon.icon.path);
  }

  Widget _buildNetworkImage() {
    return CachedNetworkImage(
      height: size ?? height,
      width: size ?? width,
      imageUrl: imageSrc,
      fit: fill,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          image: DecorationImage(image: imageProvider, fit: fill),
        ),
      ),
      progressIndicatorBuilder: (context, url, downloadProgress) {
        return Skeletonizer(
          enabled: (downloadProgress.progress ?? 0) < 1,
          child: CommonImage(imageSrc: Assets.icon.icon.path),
        );
      },
      errorWidget: (context, url, error) {
        errorLog(error, source: 'Common Image');

        return _buildErrorWidget();
      },
    );
  }

  Widget _buildSvgImage() {
    return SvgPicture.asset(
      imageSrc,
      colorFilter: imageColor != null ? ColorFilter.mode(imageColor!, BlendMode.srcIn) : null,
      height: size ?? height,
      width: size ?? width,
      fit: fill,
    );
  }

  Widget _buildFileImage() {
    return Image.file(
      File(imageSrc),
      color: imageColor,
      height: size ?? height,
      width: size ?? width,
      fit: fill,
    );
  }

  Widget _buildPngImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.asset(
        imageSrc,
        color: imageColor,
        height: size ?? height,
        width: size ?? width,
        fit: fill,
        errorBuilder: (context, error, stackTrace) {
          errorLog(error, source: 'Common Image');
          return _buildErrorWidget();
        },
      ),
    );
  }
}
