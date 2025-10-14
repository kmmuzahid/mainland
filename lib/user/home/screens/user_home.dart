import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mainland/common/auth/widgets/common_logo.dart';
import 'package:mainland/common/notifications/screen/notifications_screen.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/image/common_image.dart';
import 'package:mainland/core/component/mainlad/event_widget.dart';
import 'package:mainland/core/component/other_widgets/smart_list_loader.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/config/route/app_router.gr.dart';
import 'package:mainland/core/utils/app_utils.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/gen/assets.gen.dart';

class UserHome extends StatelessWidget {
  const UserHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 12.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _topChild(),
              10.height,
              _header(title: AppString.newlyAddedEvents, onTap: () {}),
              10.height,
              _suggestions(count: 8),
              Divider(color: AppColors.outlineColor),
              _header(title: AppString.popularEvents, onTap: () {}),
              10.height,
              _suggestions(count: 8),
            ],
          ),
        ),
      ),
    );
  }

  Row _header({required Function() onTap, required String title}) {
    return Row(
      children: [
        CommonText(text: title, style: AppTextStyles.titleLarge),
        const Spacer(),
        GestureDetector(
          onTap: onTap,
          child: CommonText(
            text: AppString.seeMore,
            style: AppTextStyles.titleMedium?.copyWith(color: AppColors.primaryColor),
          ),
        ),
      ],
    );
  }

  Widget _suggestions({required int count}) {
    // Give the horizontal list a fixed height when used inside SingleChildScrollView
    return SizedBox(
      height: 261.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: count,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(right: 10.w),
          child: EventWidget(
            image: Assets.images.sampleItem.path,
            onTap: () {},
            width: 167,
            height: 261,
          ),
        ),
      ),
    );
  }

  Widget _topChild() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            // navigate to account screen.
          },
          child: CommonImage(imageSrc: Assets.images.user.path, size: 36),
        ),
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
            CommonButton(
              borderColor: AppColors.iconColorBlack,
              titleColor: AppColors.primaryColor,
              buttonRadius: 12,
              buttonColor: AppColors.transparent,
              titleText: AppString.categories,
              onTap: () {},
            ),
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
        )
      ],
    );
  }
}
