import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/component/image/common_image.dart';
import 'package:mainland/gen/assets.gen.dart';

class CommonLogo extends StatelessWidget {
  const CommonLogo({super.key, this.height = 80, this.width = 117});
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) =>
      CommonImage(imageSrc: Assets.icon.appIcon.path, width: width.w, height: height.w);
}
