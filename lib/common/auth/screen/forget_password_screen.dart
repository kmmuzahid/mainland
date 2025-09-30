import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mainland/common/auth/widgets/common_logo.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/component/text_field/common_text_field.dart';
import 'package:mainland/core/component/text_field/custom_form.dart';
import 'package:mainland/core/component/text_field/input_helper.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/config/route/app_router.gr.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/core/utils/extensions/extension.dart';

@RoutePage()
class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({required this.newPasswordController, super.key});
  final TextEditingController newPasswordController;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(),
    body: CustomForm(
      builder: (_, formKey) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CommonLogo().center,
            CommonText(
              text: AppString.appName,
              style: getTheme.textTheme.headlineLarge?.copyWith(color: AppColors.primaryColor),
            ).center,
            30.height,
            CommonText(
              text: AppString.resetPassword,
              style: AppTextStyles.titleLarge,
              alignment: MainAxisAlignment.center,
            ).start,

            5.height,
            CommonTextField(
              hintText: AppString.newPassword,
              backgroundColor: AppColors.disable,
              borderColor: AppColors.disable,
              validationType: ValidationType.validatePassword,
            ),
            10.height,
            CommonTextField(
              backgroundColor: AppColors.disable,
              borderColor: AppColors.disable,
              controller: newPasswordController,
              hintText: AppString.confirmPassword,
              validationType: ValidationType.validateConfirmPassword,
              originalPassword: newPasswordController.text,
            ),
            20.height,

            /// Submit Button here
            CommonButton(
              titleText: AppString.resetPassword,
              buttonWidth: 132,
              buttonHeight: 40,
              onTap: () {
                if (formKey.currentState!.validate()) {}
                appRouter.popUntilRouteWithName(SignInRoute.name);
              },
              isLoading: false,
            ).center,

            const Spacer(),
          ],
        ),
      ),
    ),
  );
}
