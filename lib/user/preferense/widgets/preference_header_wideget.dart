import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/common/auth/widgets/common_logo.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/core/utils/extensions/extension.dart';

class PreferenceHeaderWideget extends StatelessWidget {
  const PreferenceHeaderWideget({super.key, this.header});

  final Widget? header;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (header != null) header!,
        if (header == null) ...[
          const CommonLogo().center,
          CommonText(
            text: AppString.appName,
            style: AppTextStyles.headlineSmall?.copyWith(
              color: AppColors.primaryColor,
              fontSize: 20.sp,
            ),
          ).center,
          SizedBox(height: 16.h),
          CommonText(
            left: 16,
            text: AppString.selectYourPreference,
            style: AppTextStyles.headlineSmall?.copyWith(color: AppColors.primaryColor),
          ).start,
          CommonText(
            left: 16,
            text: AppString.eventsWillBeShownBasedOnYourPreferences,
            style: AppTextStyles.bodyMedium,
          ).start,
        ],
      ],
    );
  }
}
