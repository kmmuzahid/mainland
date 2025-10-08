import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/component/image/common_image.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/core/utils/extensions/extension.dart';

class EventWidget extends StatelessWidget {
  const EventWidget({
    required this.image,
    this.title = '''Juice WRLD
Mon. Jan. 12, 8pm
Eko Hotel & Suites
Pre Order available
Nov. 1''',
    required this.onTap,
    required this.width,
    required this.height,
    super.key,
  });
  final String image;
  final String title;
  final Function() onTap;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: width.w,
        height: height.h,

        child: Column(
          children: [
            SizedBox(
              height: height.h - 50.w,
              width: width.w,
              child: Stack(
                children: [
                  CommonImage(imageSrc: image, borderRadius: 12),
                  Container(
                    width: width,
                    height: height.h - 50.w,
                    decoration: BoxDecoration(
                      color: AppColors.primaryText.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  Align(
                    child: CommonText(
                      text: title,
                      style: AppTextStyles.titleMedium?.copyWith(color: AppColors.textWhite),
                    ),
                  ),
                ],
              ),
            ),
            CommonText(
              text: AppString.morePlus,
              style: AppTextStyles.titleLarge?.copyWith(color: AppColors.primaryColor),
            ).start,
          ],
        ),
      ),
    );
  }
}
