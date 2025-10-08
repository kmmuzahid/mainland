import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/component/image/common_image.dart';
import 'package:mainland/core/component/mainlad/event_widget.dart';
import 'package:mainland/core/component/other_widgets/smart_list_loader.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
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

  Expanded _suggestions({required int count}) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
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
      children: [
        GestureDetector(
          onTap: () {
            // navigate to account screen.
          },
          child: CommonImage(imageSrc: Assets.images.user.path, size: 36),
        ),
      ],
    );
  }
}
