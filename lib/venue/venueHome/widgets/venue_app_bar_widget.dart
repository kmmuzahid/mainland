import 'package:flutter/material.dart';
import 'package:mainland/common/auth/widgets/common_logo.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/config/route/app_router.gr.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/core/utils/extensions/extension.dart';

class VenueAppBarWidget extends StatelessWidget {
  const VenueAppBarWidget({super.key, this.showLogo = false, required this.title});
  final bool showLogo;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (showLogo)
          Column(
            children: [
              const CommonLogo(width: 53, height: 50),
              CommonText(
                text: title,
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
