import 'package:flutter/material.dart';
import 'package:mainland/core/component/image/common_image.dart';
import 'package:mainland/gen/assets.gen.dart';

class CommonLogo extends StatelessWidget {
  const CommonLogo({super.key});

  @override
  Widget build(BuildContext context) =>
      CommonImage(imageSrc: Assets.icon.icon.path, width: 124, height: 107);
}
