import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/common/auth/widgets/common_logo.dart';
import 'package:mainland/core/component/image/common_image.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/config/route/app_router.gr.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/gen/assets.gen.dart';

class VenueAppBarWidget extends StatelessWidget {
  const VenueAppBarWidget({super.key, this.showLogo = false, required this.title});
  final bool showLogo;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (showLogo)
          CommonImage(imageSrc: Assets.icon.venueIcon.path, width: 65.w, height: 74.h),
        const Spacer(),
        CommonText(text: title, fontWeight: FontWeight.w400, fontSize: 24),
        const Spacer(),
        IconButton(
          onPressed: () {
            appRouter.replaceAll([const HomeRoute()]);
          },
          icon: Icon(Icons.close, color: AppColors.iconColorBlack),
        ).end,
      ],
    );
  }
}
