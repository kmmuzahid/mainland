import 'package:flutter/material.dart';

import 'package:mainland/common/auth/widgets/already_accunt_rich_text.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/image/image_picker/common_image_picker.dart';
import 'package:mainland/core/component/other_widgets/common_drop_down.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/component/text_field/common_date_input_text_field.dart';
import 'package:mainland/core/component/text_field/common_multiline_text_field.dart';
import 'package:mainland/core/component/text_field/common_text_field.dart';
import 'package:mainland/core/component/text_field/input_helper.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/config/route/app_router.gr.dart';
import 'package:mainland/core/utils/extensions/extension.dart';

class SignUpAllField extends StatelessWidget {
  const SignUpAllField({required this.formKey, super.key});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.height,
            //upload image
            const CommonImagePicker(
              width: 150,
              height: 150,
              borderRadius: 150,
              pickerIcon: Icons.person,
            ).center,
            10.height,
            CommonText(
              text: AppString.profilePhoto,
              style: getTheme.textTheme.titleMedium,
              alignment: MainAxisAlignment.center,
            ).center,

            /// User Name here
            CommonText(text: AppString.fullName, bottom: 8, top: 12),
            CommonTextField(
              hintText: AppString.fullName,
              validationType: ValidationType.validateFullName,
            ),

            /// User Phone here
            CommonText(text: AppString.phoneNumber, bottom: 8, top: 12),
            CommonTextField(
              isReadOnly: true,
              hintText: AppString.phoneNumber,
              validationType: ValidationType.validatePhone,
            ),

            ///Date of Birth here
            CommonText(text: AppString.dateOfBirth, bottom: 8, top: 12),
            CommonDateInputTextField(onSave: (date) {}),
            //role related info
            CommonText(text: AppString.nationalIDcard, bottom: 8, top: 12),
            CommonTextField(
              hintText: AppString.nationalIDcard,
              validationType: ValidationType.validateNID,
            ),
            CommonText(text: AppString.agentInformation, bottom: 8, top: 12),
            CommonMultilineTextField(
              height: 100,
              hintText: AppString.agentInformation,
              validationType: ValidationType.validateRequired,
              onSave: (String p1) {},
            ),
            CommonText(text: AppString.bankName, bottom: 8, top: 12),
            CommonDropDown<String>(
              hint: AppString.bankName,
              items: ['AB Bank', 'SCB Bank'],
              onChanged: (value) {},
              nameBuilder: (value) => value,
            ),
            CommonText(text: AppString.bankAccount, bottom: 8, top: 12),
            CommonTextField(
              hintText: AppString.bankAccount,
              validationType: ValidationType.validateNumber,
            ),

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
              originalPassword: 'orginal password here',
            ),
            // All Text Filed here
            30.height,

            // Submit Button Here
            CommonButton(
              titleText: AppString.signUp,
              onTap: () {
                //on success
                if (formKey.currentState!.validate()) {
                  appRouter.popUntilRouteWithName(SignInRoute.name);
                }

                //remove it on release
                appRouter.popUntilRouteWithName(SignInRoute.name);
              },
              buttonWidth: 132,
              buttonHeight: 40,
              isLoading: false,
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
}
