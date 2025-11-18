import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/app_bar/common_app_bar.dart';
import 'package:mainland/core/component/image/common_image.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/config/route/app_router.gr.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/gen/assets.gen.dart';

class VenueAppBarWidget extends StatelessWidget {
  const VenueAppBarWidget({super.key, this.showLogo = false, required this.title});
  final bool showLogo;
  final String title;

  @override
  Widget build(BuildContext context) {
    return CommonAppBar(
      title: title,
      leading: showLogo
          ? CommonImage(
              fill: BoxFit.contain,
              imageSrc: Assets.icon.venueIcon.path,
              width: 65.w,
              height: 74.h,
            )
          : const SizedBox.shrink(),
      onBackPress: () {
        appRouter.replaceAll([const HomeRoute()]);
      },
      actions: [
        IconButton(
          onPressed: () {
            appRouter.replaceAll([const HomeRoute()]);
          },
          icon: Icon(Icons.close, color: AppColors.iconColorBlack),
        )
      ],
    );
 
  }
}
