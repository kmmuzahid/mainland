import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/common/auth/widgets/common_logo.dart';
import 'package:mainland/common/home/widgets/home_top_widget.dart';
import 'package:mainland/core/component/image/common_image.dart';
import 'package:mainland/core/component/mainlad/event_widget.dart';
import 'package:mainland/core/component/other_widgets/smart_staggered_loader.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/config/route/app_router.gr.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/gen/assets.gen.dart';

class OrgHome extends StatelessWidget {
  const OrgHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
      child: SmartStaggeredLoader(
        onRefresh: () {},
        itemCount: 20,
        appbar: PreferredSize(preferredSize: Size(double.infinity, 240.h), child: _topChild()),
        onColapsAppbar: Column(
          children: [
            Divider(color: AppColors.primaryColor, thickness: 1.h, height: 2.h),
            CommonText(
              top: 10,
              bottom: 10,
              text: AppString.upcomingEvents,
              style: AppTextStyles.titleLarge,
            ).start,
          ],
        ),
        crossAxisSpacing: 10,
        aspectRatio: 0.6434,
        mainAxisSpacing: 10,
        isSeperated: true,
        itemBuilder: (context, index) => EventWidget(
          image: Assets.images.sampleItem.path,
          onTap: () {
            appRouter.push(EventDetailsRoute(eventId: '1'));
          },
        ),
      ),
    );
  }

  HomeTopWidget _topChild() {
    return HomeTopWidget(
      startWidget: GestureDetector(
        onTap: () {
          appRouter.push(const VenueSplashRoute());
        },
        child: Container(
          padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.h),
          decoration: BoxDecoration(
            color: AppColors.white400,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: CommonImage(imageSrc: Assets.icon.venueIcon.path, width: 58.w, height: 70.h),
        ),
      ),
      middleWidget: GestureDetector(
        onTap: () {
          appRouter.push(const CreateEventRoute());
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: AppColors.white400,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            children: [
              const Icon(Icons.add),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(text: AppString.create, fontSize: 24),
                  CommonText(text: AppString.aNewTicketEvent, fontSize: 16),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
