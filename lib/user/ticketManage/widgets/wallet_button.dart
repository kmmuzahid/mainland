import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/component/image/common_image.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/extensions/extension.dart';

class WalletButton extends StatelessWidget {
  const WalletButton({super.key, required this.onTap, required this.title, required this.image});
  final Function() onTap;
  final String title;
  final String image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.iconColorBlack,
          borderRadius: BorderRadius.circular(6.r),
        ),
        width: 190.w,
        height: 55.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          children: [
            CommonImage(imageSrc: image, width: 37.w, height: 28.h),
            10.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const CommonText(
                  text: 'Add to',
                  fontSize: 12,
                  textColor: AppColors.textWhite,
                  fontWeight: FontWeight.w300,
                ),
                CommonText(
                  text: title,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  textColor: AppColors.textWhite,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
