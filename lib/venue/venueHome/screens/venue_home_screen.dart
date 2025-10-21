import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/common/auth/widgets/common_logo.dart';
import 'package:mainland/core/app_bar/common_app_bar.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class VenueHomeScreen extends StatelessWidget {
  const VenueHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    const CommonLogo(width: 53, height: 50),
                    CommonText(
                      text: AppString.appName,
                      style: AppTextStyles.titleMedium?.copyWith(color: AppColors.primaryColor),
                    ),

                    Badge(
                      label: const Icon(Icons.add, size: 16),
                      backgroundColor: AppColors.transparent,
                      child: CommonText(text: AppString.venue, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const Spacer(),
                const CommonText(text: 'Scanner', fontWeight: FontWeight.w400, fontSize: 24),
                const Spacer(),
                const Icon(Icons.remove),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
