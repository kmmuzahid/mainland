import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mainland/common/auth/widgets/already_accunt_rich_text.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/image/common_image.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/component/text_field/common_date_input_text_field.dart';
import 'package:mainland/core/component/text_field/common_text_field.dart';
import 'package:mainland/core/component/text_field/custom_form.dart';
import 'package:mainland/core/component/text_field/input_helper.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/gen/assets.gen.dart';

class SignUpAllField extends StatelessWidget {
  const SignUpAllField({super.key});


  @override
  Widget build(BuildContext context) {
    return CustomForm(
      builder: (BuildContext context, GlobalKey<FormState> formKey) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.height,
            //upload image
            CommonImage(
              width: 150,
              height: 150,
              borderRadius: 150,
              imageSrc: Assets.icon.icon.path,
            ).center,
            10.height,

            /// User Name here
            CommonText(text: AppString.fullName, bottom: 8, top: 12),
            CommonTextField(
              prefixIcon: _requiredIcon(),
              hintText: AppString.fullName,
              validationType: ValidationType.validateFullName,
            ),

            /// User Email here
            10.height,
            CommonTextField(
              prefixIcon: _requiredIcon(),
              hintText: AppString.emailAddress,
              validationType: ValidationType.validateEmail,
            ),
            /// User Phone here
            CommonDateInputTextField(onSave: (date) {}),

            ///Date of Birth here
            CommonText(text: AppString.dateOfBirth, bottom: 8, top: 12),

            /// User Password here
            CommonText(text: AppString.newPassword, bottom: 8, top: 12),
            CommonTextField(
              validationType: ValidationType.validatePassword,
              hintText: AppString.newPassword,
            ),

            /// User Confirm Password here
            CommonText(text: AppString.confirmPassword, bottom: 8, top: 12),
            CommonTextField(
              hintText: AppString.confirmPassword,
              validationType: ValidationType.validateConfirmPassword,
              originalPassword: AppString.confirmPassword,
            ),
            // All Text Filed here
            30.height,

            // Submit Button Here
            CommonButton(
              titleText: AppString.signUp,
              onTap: () {
                //on success
                // if (formKey.currentState!.validate()) {
                //   appRouter.popUntilRouteWithName(SignInRoute.name);
                // }

                // //remove it on release
                // appRouter.popUntilRouteWithName(SignInRoute.name);
              },
              buttonWidth: 132,
            ).center,
            30.height,

            ///  Sign In Instruction here
            const AlreadyAccountRichText().center,
            40.height,
          ],
        ),
      ),
    );
  }

  Icon _requiredIcon() => Icon(Icons.star, size: 15.w, color: AppColors.warning);
}
