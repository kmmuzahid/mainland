import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/app_bar/common_app_bar.dart';
import 'package:mainland/core/component/image/common_image.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/gen/assets.gen.dart';

@RoutePage()
class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            CommonText(
              textColor: AppColors.primaryColor,
              text: 'Locations',
              fontSize: 24,
              fontWeight: FontWeight.w600,
              bottom: 20,
            ).start,
            CommonImage(imageSrc: Assets.images.locationSampleMap.path),
            CommonText(
              text: 'Current Location',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              top: 20,
            ).start,
          ],
        ),
      ),
    );
  }
}
