import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mainland/common/auth/widgets/common_logo.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/image/common_image.dart';
import 'package:mainland/core/component/mainlad/event_widget.dart';
import 'package:mainland/common/home/widgets/home_top_widget.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/component/text_field/common_text_field.dart';
import 'package:mainland/core/component/text_field/input_helper.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/config/route/app_router.gr.dart';
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
              CommonTextField(
                backgroundColor: AppColors.backgroundWhite,
                prefixIcon: const Icon(Icons.search),
                hintText: AppString.searchEventsHere,
                validationType: ValidationType.notRequired,
              ),
              10.height,
              _header(
                title: AppString.newlyAddedEvents,
                onTap: () {
                  appRouter.push(AllEventRoute(title: AppString.newlyAddedEvents));
                },
              ),
              10.height,
              _suggestions(count: 8),
              Divider(color: AppColors.outlineColor),
              _header(
                title: AppString.popularEvents,
                onTap: () {
                  appRouter.push(AllEventRoute(title: AppString.popularEvents));
                },
              ),
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
      height: 272.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: count,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(right: 10.w),
          child: EventWidget(
            image: Assets.images.sampleItem.path,
            onTap: () {
              appRouter.push(EventDetailsRoute(eventId: '1'));
            },
          ),
        ),
      ),
    );
  }

  Widget _topChild() {
    return HomeTopWidget(
      startWidget: GestureDetector(
        onTap: () {
          // navigate to account screen.
          appRouter.push(SettingRoute());
        },
        child: CommonImage(imageSrc: Assets.images.user.path, size: 36),
      ),
      middleWidget: CommonButton(
        borderColor: AppColors.iconColorBlack.withValues(alpha: .6),
        titleColor: AppColors.primaryColor,
        buttonRadius: 12,
        buttonColor: AppColors.transparent,
        titleText: AppString.categories,
        onTap: () {
          // appRouter.push(const CategoriesRoute());
        },
      ),
    );
   
  }
}
