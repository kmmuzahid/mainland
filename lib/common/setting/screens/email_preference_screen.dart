import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mainland/core/app_bar/common_app_bar.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/mainlad/common_switch.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class EmailPreferenceScreen extends StatelessWidget {
  const EmailPreferenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            CommonText(
              text: AppString.emailPreferences,
              fontSize: 24,
              fontWeight: FontWeight.w600,
              style: AppTextStyles.titleMedium?.copyWith(color: AppColors.primaryColor),
            ).start,
            10.height,
            CommonText(
              text: '${AppString.receiveEmailNotificationsFor}:',
              fontSize: 16,
              textColor: AppColors.greay400,
              fontWeight: FontWeight.w400,
            ).start,
            _itemBuilder(
              title: AppString.whenYouSellYourTicket,
              isActive: true,
              onChanged: (value) {},
            ),
            _itemBuilder(
              title: AppString.whenYouReceiveAMessage,
              isActive: true,
              onChanged: (value) {},
            ),
            _itemBuilder(
              title: AppString.whenAFavoritePublishAnEvent,
              isActive: false,
              onChanged: (value) {},
            ),
            _itemBuilder(
              title: AppString.whenYouCanWithdrawFromYourWallet,
              isActive: true,
              onChanged: (value) {},
            ),
            20.height,
            CommonButton(
              titleText: AppString.save,
              onTap: () {
                appRouter.pop();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemBuilder({
    required String title,
    required bool isActive,
    required Function(bool value) onChanged,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CommonText(
            text: title,
            fontSize: 16,
            maxLines: 1,
            overflow: TextOverflow.fade,
            textColor: AppColors.greay400,
            fontWeight: FontWeight.w400,
          ),
        ), 
        20.width,
        
        CommonSwitch(isActive: isActive, onChanged: onChanged),
      ],
    );
  }
}
