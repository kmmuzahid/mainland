import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mainland/common/auth/widgets/common_logo.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/config/route/app_router.gr.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/core/utils/extensions/extension.dart';

class HomeTopWidget extends StatelessWidget {
  const HomeTopWidget({super.key, required this.startWidget, required this.middleWidget});
  final Widget middleWidget;
  final Widget startWidget;

  Widget _topChild() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        startWidget,
        const Spacer(),
        Column(
          children: [
            const CommonLogo(),
            CommonText(
              text: AppString.appName,
              style: AppTextStyles.titleLarge?.copyWith(color: AppColors.primaryColor),
            ),
            CommonText(
              text: DateFormat(DateFormat.MONTH_WEEKDAY_DAY).format(DateTime.now()),
              style: AppTextStyles.titleLarge,
            ),
            8.height,
            middleWidget,
          ],
        ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.all(10.w),
          child: GestureDetector(
            onTap: () {
              appRouter.push(const NotificationRoute());
            },
            child: Badge.count(count: 8, child: Icon(Icons.notifications_outlined, size: 26.w)),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => _topChild();
}
