import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/common/auth/cubit/auth_cubit.dart';
import 'package:mainland/common/setting/cubit/faq_cubit.dart';
import 'package:mainland/common/show_info/cubit/info_state.dart';
import 'package:mainland/core/component/image/common_image.dart';
import 'package:mainland/core/component/mainlad/common_switch.dart';
import 'package:mainland/core/component/other_widgets/common_dialog.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/config/route/app_router.gr.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/gen/assets.gen.dart';
import 'package:mainland/venue/venueHome/widgets/venue_app_bar_widget.dart';

import 'venue_validate_dialogue_widget.dart';

class VenueSettingWidget extends StatelessWidget {
  const VenueSettingWidget({super.key, required this.about, required this.faqHelp});
  final String about;
  final String faqHelp;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        10.height,
        VenueAppBarWidget(title: AppString.settings),
        CommonImage(imageSrc: Assets.images.user.path, size: 36).start,
        CommonText(
          top: 8,
          text: context.read<AuthCubit>().state.profileModel?.name ?? '',
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ).start,
        15.height,
        _menuItems(
          title: AppString.insertEventCode,
          onTap: () {
            commonDialog(
              isDismissible: true,
              child: VenueValidateDialogueWidget(
                title: AppString.insertNewEventCode,
                onConfim: (value) {},
              ),
              context: context,
            );
          },
        ),
        Divider(color: AppColors.white600),
        _menuItems(
          title: AppString.faqHelp,
          onTap: () {
            appRouter.push(FaqRoute(faqType: FaqType.venue));
          },
          trailing: Icon(Icons.arrow_forward_ios, color: AppColors.primaryColor),
        ),
        Divider(color: AppColors.white600),
        _menuItems(
          title: AppString.about,
          onTap: () {
            appRouter.push(ShowInfoRoute(title: AppString.about, infoType: InfoType.about_us));
          },
          trailing: Icon(Icons.arrow_forward_ios, color: AppColors.primaryColor),
        ),
        Divider(color: AppColors.white600),
        _menuItems(
          title: AppString.vibrate,
          trailing: CommonSwitch(isActive: true, onChanged: (value) {}),
        ),
        Divider(color: AppColors.white600),
        _menuItems(
          title: AppString.sound,
          trailing: CommonSwitch(isActive: true, onChanged: (value) {}),
        ),
      ],
    );
  }

  Widget _menuItems({required String title, Widget? trailing, Function()? onTap}) {
    final Widget container = Container(
      height: 54.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColors.white400,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          CommonText(fontSize: 14, fontWeight: FontWeight.w400, text: title.capitalizeEachWord()),
          const Spacer(),
          trailing ?? const SizedBox.shrink(),
        ],
      ),
    );
    if (onTap != null) {
      return GestureDetector(onTap: onTap, child: container);
    }
    return container;
  }
}
