import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/app_bar/common_app_bar.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/component/text_field/common_text_field.dart';
import 'package:mainland/core/component/text_field/input_helper.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/core/utils/extensions/extension.dart';

@RoutePage()
class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(
              text: AppString.changePassword,
              fontSize: 24,
              fontWeight: FontWeight.w600,

              style: AppTextStyles.titleMedium?.copyWith(color: AppColors.primaryColor),
            ),
            10.height,
            CommonTextField(
              prefixIcon: _requiredIcon(),
              borderColor: AppColors.disable,
              backgroundColor: AppColors.white400,
              validationType: ValidationType.validatePassword,
              hintText: AppString.oldPassword,
              onChanged: (value) {},
            ),
            10.height,
            CommonTextField(
              prefixIcon: _requiredIcon(),
              borderColor: AppColors.disable,
              backgroundColor: AppColors.white400,
              validationType: ValidationType.validatePassword,
              hintText: AppString.newPassword,
              onChanged: (value) {},
            ),
            20.height,
            CommonButton(
              titleText: AppString.submit,
              onTap: () {
                appRouter.pop();
              },
            ).center,
          ],
        ),
      ),
    );
  }

  Widget _requiredIcon() =>
      const CommonText(text: '*', textColor: AppColors.warning, fontSize: 20, top: 10);
}
